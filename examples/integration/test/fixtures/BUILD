load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:testing.bzl",
    "update_fixtures",
    "validate_fixtures",
    "xcodeproj_fixture",
)
load(
    "//:xcodeproj_targets.bzl",
    "ASSOCIATED_EXTRA_FILES",
    "CONFIG",
    "EXTRA_FILES",
    "PROJECT_OPTIONS",
    "SCHEME_AUTOGENERATION_MODE",
    "UNFOCUSED_TARGETS",
    "XCODEPROJ_TARGETS",
    "get_xcode_schemes",
)

xcodeproj_fixture(
    associated_extra_files = ASSOCIATED_EXTRA_FILES,
    config = CONFIG,
    extra_files = EXTRA_FILES,
    project_options = PROJECT_OPTIONS,
    scheme_autogeneration_mode = SCHEME_AUTOGENERATION_MODE,
    schemes = get_xcode_schemes(),
    top_level_targets = XCODEPROJ_TARGETS,
    unfocused_targets = UNFOCUSED_TARGETS,
)

_FIXTURES = [
    ":xcodeproj_bwb",
    ":xcodeproj_bwx",
]

update_fixtures(
    name = "update",
    tags = ["manual"],
    targets = _FIXTURES,
)

validate_fixtures(
    name = "validate",
    tags = ["manual"],
    targets = _FIXTURES,
)
