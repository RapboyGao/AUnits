import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct AUnitTranslationPreviewView: View {
    // 获取所有可用的本地化列表，过滤掉 Base 本地化
    let localizations: [String] = Bundle.module.localizations.filter { $0 != "Base" }

    // 当前选择的语言
    @State private var selectedLocalization: String

    init() {
        // 默认选择第一个本地化语言
        _selectedLocalization = State(initialValue: localizations.first ?? "en")
    }

    var body: some View {
        VStack {
            // 语言选择器
            languagePicker
                .padding() // 添加内边距
                .background(Color.gray.opacity(0.1)) // 设置背景颜色
                .cornerRadius(8) // 设置圆角
                .padding(.horizontal) // 添加水平内边距

            // 单位列表
            unitList
        }
        .environment(\.locale, .init(identifier: selectedLocalization)) // 设置当前环境的语言
    }

    // 语言选择器视图
    private var languagePicker: some View {
        Picker("Select Language", selection: $selectedLocalization) { // 语言选择器
            ForEach(localizations, id: \.self) { localization in // 遍历所有本地化语言
                Text(Locale.current.localizedString(forIdentifier: localization) ?? localization).tag(localization) // 显示语言名称
            }
        }
    }

    // 单位列表视图
    private var unitList: some View {
        List(AUnitType.allCases) { unitType in // 遍历所有单位类型
            Section(header: Text(localizedString("\(unitType).longName")) // 段头
                .font(.headline) // 设置字体
                .foregroundColor(.primary)) // 设置颜色
            {
                AUnitForeachView(typeFilter: unitType) { unit in // 遍历每个单位类型的单位
                    VStack(alignment: .leading, spacing: 4) { // 垂直堆叠视图
                        Text("\(localizedString("\(unit).symbol"))") // 显示符号
                            .font(.subheadline) // 设置子标题字体
                            .foregroundColor(.secondary) // 设置次要颜色
                        Text("Short Name: \(localizedString("\(unit).shortName"))") // 显示短名称
                            .font(.body) // 设置正文字体
                        Text("Long Name: \(localizedString("\(unit).longName"))") // 显示长名称
                            .font(.body) // 设置正文字体
                        Text("\(localizedString("\(unit).detailedIntroduction"))") // 显示长名称
                            .font(.body) // 设置正文字体
                    }
                    .padding(.vertical, 4) // 添加垂直内边距
                }
            }
        }
    }

    // 获取本地化字符串的方法
    private func localizedString(_ key: String) -> String {
        guard let bundlePath = Bundle.module.path(forResource: selectedLocalization, ofType: "lproj"), // 获取本地化文件路径
              let localizedBundle = Bundle(path: bundlePath) // 获取本地化 Bundle
        else {
            return key // 如果未找到，返回键值
        }
        return NSLocalizedString(key, bundle: localizedBundle, comment: "") // 返回本地化字符串
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    AUnitTranslationPreviewView() // 预览视图
}
