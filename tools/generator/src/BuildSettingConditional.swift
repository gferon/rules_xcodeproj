struct BuildSettingConditional: Equatable, Hashable {
    static let any: Self = .init(platform: nil)

    private let platform: Platform?
}

extension BuildSettingConditional {
    init(platform: Platform) {
        self.platform = platform
    }

    func conditionalize(_ key: String) -> String {
        guard let platform = platform else {
            return key
        }

        var components = [key]
        if archConditionalAllowed(on: key) {
            components.append("[arch=\(platform.arch)]")
        }
        if sdkConditionalAllowed(on: key) {
            components.append("[sdk=\(platform.name)]")
        }
        return components.joined()
    }

    private func archConditionalAllowed(on key: String) -> Bool {
        return key != "ARCHS"
    }

    private func sdkConditionalAllowed(on key: String) -> Bool {
        return key != "SDKROOT"
    }
}

extension BuildSettingConditional: Comparable {
    static func < (
        lhs: BuildSettingConditional,
        rhs: BuildSettingConditional
    ) -> Bool {
        guard
            let lhsPlatform = lhs.platform, let rhsPlatform = rhs.platform
        else {
            // Sort `.any` first
            return lhs.platform == nil
        }

        guard lhsPlatform.environment == rhsPlatform.environment else {
            // Sort simulator first
            switch (lhsPlatform.environment, rhsPlatform.environment) {
            case ("Simulator", _): return true
            case (_, "Simulator"): return false
            case (nil, _), ("Device", _): return true
            case (_, nil), (_, "Device"): return false
            default: return false
            }
        }

        // Sort Apple Silicon first
        return lhsPlatform.arch == "arm64"
    }
}

extension Target {
    var buildSettingConditional: BuildSettingConditional {
        return BuildSettingConditional(platform: platform)
    }
}