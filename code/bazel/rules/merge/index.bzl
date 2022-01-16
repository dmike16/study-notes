load(":print_aspect.bzl", "print_aspect")

def _merge_impl(ctx):
    deps_chunks = depset()
    for dep in ctx.attr.deps:
        if DefaultInfo in dep:
            deps_chunks = depset(dep[DefaultInfo].files.to_list(), transitive = [deps_chunks])

    # The list of arguments we pass to the script.
    args = [ctx.outputs.merged.path] + [f.path for f in ctx.files.chunks] + [dc.path for dc in deps_chunks.to_list()]

    # Action to call the script.
    ctx.actions.run(
        inputs = depset(ctx.files.chunks, transitive = [deps_chunks]),
        outputs = [ctx.outputs.merged],
        arguments = args,
        progress_message = "Merging into %s" % ctx.outputs.merged.short_path,
        executable = ctx.executable._merge_tool,
    )

    return [DefaultInfo(files = depset([ctx.outputs.merged]))]

merge = rule(
    implementation = _merge_impl,
    attrs = {
        "chunks": attr.label_list(
            allow_files = True,
        ),
        "deps": attr.label_list(
            aspects = [print_aspect],
        ),
        "_merge_tool": attr.label(
            executable = True,
            cfg = "host",
            default = Label("//merge:merge_tool"),
        ),
    },
    outputs = {
        "merged": "%{name}.merged",
    },
)
