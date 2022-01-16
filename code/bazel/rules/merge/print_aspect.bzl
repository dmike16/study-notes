def _print_aspect_impl(target, ctx):
    # Make sure the rule has a srcs attribute.
    print(target.label.workspace_root)
    print(ctx.workspace_name)
    if hasattr(ctx.rule.attr, 'chunks'):
        # Iterate through the files that make up the sources and
        # print their paths.
        for c in ctx.rule.attr.chunks:
            for f in c.files:
                print(f.path)
    return []

print_aspect = aspect(
    implementation = _print_aspect_impl,
    attr_aspects = ['deps'],
)