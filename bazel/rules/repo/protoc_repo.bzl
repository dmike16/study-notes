PROTOC_BUILD_FILE = """
package(default_visibility = [ "//visibility:public" ])

exports_files([
    "readme.txt"
])

alias(
    name = "compiler",
    actual = "bin/protoc"
)

filegroup(
    name = "include",
    srcs = ["include"]
)
"""

def _proto_repo_impl(repo_ctx):
    os_name = repo_ctx.os.name
    print("Current system : %s" % os_name)

    download_info = repo_ctx.download_and_extract(
        output = "",
        type = "zip",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-x86_64.zip",
        sha256 = "24ea6924faaf94d4a0c5850fdb278290a326eff9a68f36ee5809654faccd0e10",
    )

    protoc_root = repo_ctx.path(".").dirname
    print("Root repo dir: %s" % protoc_root)

    protoc_bin = protoc_root.get_child("bin")
    protoc_include = protoc_root.get_child("include")

    repo_ctx.file("WORKSPACE", "workspace(name=\"%s\")\n" % repo_ctx.attr.name, False)
    repo_ctx.file("BUILD.bazel", PROTOC_BUILD_FILE, False)

    return struct(name = repo_ctx.attr.name, sha256 = download_info.sha256)

_proto_repo = repository_rule(
    implementation = _proto_repo_impl,
    local = False,
)

def protoc_repositories():
    _proto_repo(
        name = "protoc",
    )
