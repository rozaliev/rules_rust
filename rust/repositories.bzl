RUST_DARWIN_BUILD_FILE = """
filegroup(
    name = "rustc",
    srcs = ["rustc/bin/rustc"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rustc_lib",
    srcs = glob(["rustc/lib/*.dylib"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rustdoc",
    srcs = ["rustc/bin/rustdoc"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rust_lib",
    srcs = glob([
        "rust-std-x86_64-apple-darwin/lib/rustlib/x86_64-apple-darwin/lib/*.rlib",
        "rust-std-x86_64-apple-darwin/lib/rustlib/x86_64-apple-darwin/lib/*.dylib",
        "rust-std-x86_64-apple-darwin/lib/rustlib/x86_64-apple-darwin/lib/*.a",
        "rustc/lib/rustlib/x86_64-apple-darwin/lib/*.rlib",
        "rustc/lib/rustlib/x86_64-apple-darwin/lib/*.dylib",
        "rustc/lib/rustlib/x86_64-apple-darwin/lib/*.a",
    ]),
    visibility = ["//visibility:public"],
)
"""

RUST_LINUX_BUILD_FILE = """
filegroup(
    name = "rustc",
    srcs = ["rustc/bin/rustc"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rustc_lib",
    srcs = glob(["rustc/lib/*.so"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rustdoc",
    srcs = ["rustc/bin/rustdoc"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rust_lib",
    srcs = glob([
        "rust-std-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.rlib",
        "rust-std-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.so",
        "rust-std-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.a",
        "rustc/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.rlib",
        "rustc/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.so",
        "rustc/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.a",
    ]),
    visibility = ["//visibility:public"],
)
"""

# Eventually with better toolchain hosting options we could load only one of these, not both.
def rust_repositories():
  native.new_http_archive(
      name = "rust_linux_x86_64",
      url = "https://static.rust-lang.org/dist/2017-06-25/rust-nightly-x86_64-unknown-linux-gnu.tar.gz",
      strip_prefix = "rust-nightly-x86_64-unknown-linux-gnu",
      sha256 = "4aeb6769881e386fcad55c517644aec36b58a308b5655742bd4415c2b6fb2843",
      build_file_content = RUST_LINUX_BUILD_FILE,
  )

  native.new_http_archive(
      name = "rust_darwin_x86_64",
      url = "https://static.rust-lang.org/dist/2017-06-25/rust-nightly-x86_64-apple-darwin.tar.gz",
      strip_prefix = "rust-nightly-x86_64-apple-darwin",
      sha256 = "ed8fa569894eb6c8d52e0b1487cb2388d385eac6337f1844afd6e1d6756d6953",
      build_file_content = RUST_DARWIN_BUILD_FILE,
  )
