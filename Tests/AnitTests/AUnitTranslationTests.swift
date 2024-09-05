@testable import AUnit
import XCTest

final class AUnitTranslationTests: XCTestCase {
    func testAllTranslations() throws {
        // 获取所有可用的本地化列表，过滤掉 Base 本地化
        let localizations = Bundle.module.localizations.filter { $0 != "Base" }

        // 循环遍历每种本地化
        for localization in localizations {
            // 获取当前本地化的路径和 Bundle 对象
            guard let bundlePath = Bundle.module.path(forResource: localization, ofType: "lproj"),
                  let localizedBundle = Bundle(path: bundlePath)
            else {
                continue // 如果未找到本地化包，则跳过
            }

            // 用于记录缺失翻译的数组
            var missingTranslations: [String] = []

            // 检查每个 AUnit 的翻译
            for unit in AUnit.allCases {
                // 获取符号、短名称和长名称的翻译
                let symbol = NSLocalizedString("\(unit).symbol", bundle: localizedBundle, comment: "")
                let shortName = NSLocalizedString("\(unit).shortName", bundle: localizedBundle, comment: "")
                let longName = NSLocalizedString("\(unit).longName", bundle: localizedBundle, comment: "")

                // 检查符号翻译是否存在
                if symbol == "\(unit.self).symbol" {
                    missingTranslations.append("\(localization): \(unit).symbol") // 记录缺失的符号翻译
                }
                // 检查短名称翻译是否存在
                if shortName == "\(unit.self).shortName" {
                    missingTranslations.append("\(localization): \(unit).shortName") // 记录缺失的短名称翻译
                }
                // 检查长名称翻译是否存在
                if longName == "\(unit.self).longName" {
                    missingTranslations.append("\(localization): \(unit).longName") // 记录缺失的长名称翻译
                }

                if longName == "\(unit.self).detailedIntroduction" {
                    missingTranslations.append("\(localization): \(unit).detailedIntroduction") // 记录缺失的detailedIntroduction
                }
            }

            // 检查每个 AUnitType 的翻译
            for unitType in AUnitType.allCases {
                // 获取符号、短名称和长名称的翻译
                let symbol = NSLocalizedString("\(unitType).symbol", bundle: localizedBundle, comment: "")
                let shortName = NSLocalizedString("\(unitType).shortName", bundle: localizedBundle, comment: "")
                let longName = NSLocalizedString("\(unitType).longName", bundle: localizedBundle, comment: "")

                // 检查符号翻译是否存在
                if symbol == "\(unitType.self).symbol" {
                    missingTranslations.append("\(localization): \(unitType).symbol") // 记录缺失的符号翻译
                }
                // 检查短名称翻译是否存在
                if shortName == "\(unitType.self).shortName" {
                    missingTranslations.append("\(localization): \(unitType).shortName") // 记录缺失的短名称翻译
                }
                // 检查长名称翻译是否存在
                if longName == "\(unitType.self).longName" {
                    missingTranslations.append("\(localization): \(unitType).longName") // 记录缺失的长名称翻译
                }

                if longName == "\(unitType.self).detailedIntroduction" {
                    missingTranslations.append("\(localization): \(unitType).detailedIntroduction") // 记录缺失的detailedIntroduction
                }
            }

            // 如果存在缺失的翻译，标记测试失败并输出缺失的翻译
            if !missingTranslations.isEmpty {
                XCTFail("Missing translations: \(missingTranslations.joined(separator: ", "))")
            }
        }
    }
}
