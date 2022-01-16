java_binary(
    name = "ProjectRunner",
    srcs = glob(["src/main/java/com/study/bazel/ProjectRunner.java"]),
    main_class = "com.study.bazel.ProjectRunner",
    deps = [":greeter"],
)

java_library(
    name = "greeter",
    srcs = ["src/main/java/com/study/bazel/Greeting.java"],
    visibility = ["//src/main/java/com/study/bazel/cmdline:__pkg__"],
)
