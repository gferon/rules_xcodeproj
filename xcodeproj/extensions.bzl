"""Module extension for loading dependencies not yet compatible with bzlmod."""

load(
    "//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
    "xcodeproj_rules_dev_dependencies",
)

dev_non_module_deps = module_extension(implementation = lambda _: xcodeproj_rules_dev_dependencies())
non_module_deps = module_extension(implementation = lambda _: xcodeproj_rules_dependencies(include_bzlmod_ready_dependencies = False))
