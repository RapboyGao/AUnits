import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A menu view for selecting units from any unit type.
/// 提供从任意单位类型中选择单位的菜单视图。
public struct AUnitAnyTypeForeachMenuView<Label: View, Content: View>: View {
    private var label: (AUnitType) -> Label
    private var content: (AUnit) -> Content

    public var body: some View {
        ForEach(AUnitType.allCases) { typeFilter in
            Menu {
                AUnitForeachView(typeFilter: typeFilter) {
                    content($0)
                }
            } label: {
                label(typeFilter)
            }
        }
    }

    /// Initializes a new instance of `AUnitAnyTypeForeachMenuView`.
    /// 初始化 `AUnitAnyTypeForeachMenuView` 的新实例。
    /// - Parameters:
    ///   - label: A view builder that provides the label for each unit type.
    ///     为每个单位类型提供标签的视图构建器。
    ///   - content: A view builder that provides the content for each unit.
    ///     为每个单位提供内容的视图构建器。
    public init(@ViewBuilder label: @escaping (AUnitType) -> Label, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.label = label
        self.content = content
    }
}
