# extral dependencies that can be loaded in WORKSPACE files.
workspace(name = "com_culaer_leetcode")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "rules_cc",
  strip_prefix = "rules_cc-master",
  urls = ["https://github.com/bazelbuild/rules_cc/archive/master.zip"],
)

http_archive(
  name = "gtest",
  url = "https://github.com/google/googletest/archive/release-1.7.0.zip",
  sha256 = "b58cb7547a28b2c718d1e38aee18a3659c9e3ff52440297e965f5edffe34b6d0",
  build_file = "@//external:gtest.BUILD",
  strip_prefix = "googletest-release-1.7.0",
)
