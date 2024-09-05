import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A view for selecting a unit from any unit type with customizable labels and content.
/// 提供从任意单位类型中选择单位的视图，并且可以自定义标签和内容。
public struct AUnitAnyTypeSelectorView<Label: View, Content: View>: View {
    private var showNil: Bool
    private var label: (AUnit) -> Label
    private var content: () -> Content
    private var onSelect: (AUnit?) -> Void

    public var body: some View {
        Menu {
            if showNil {
                Button(Ref.none) {
                    onSelect(nil)
                }
            }
            AUnitAnyTypeForeachMenuView { unitType in
                SwiftUI.Label(unitType.shortName, systemImage: unitType.systemImage)
            } content: { unit in
                Button {
                    onSelect(unit)
                } label: {
                    label(unit)
                }
            }
        } label: {
            content()
        }
    }

    /// Initializes a new instance of `AUnitAnyTypeSelectorView`.
    /// 初始化 `AUnitAnyTypeSelectorView` 的新实例。
    /// - Parameters:
    ///   - showNil: A boolean indicating whether to show a "None" option.
    ///     指示是否显示“None”选项的布尔值。
    ///   - label: A view builder that provides the label for each unit.
    ///     为每个单位提供标签的视图构建器。
    ///   - content: A view builder that provides the content for the menu.
    ///     为菜单提供内容的视图构建器。
    ///   - onSelect: A closure that is called when a unit is selected.
    ///     选择单位时调用的闭包。
    public init(showNil: Bool, @ViewBuilder label: @escaping (AUnit) -> Label, @ViewBuilder content: @escaping () -> Content, onSelect: @escaping (AUnit?) -> Void) {
        self.showNil = showNil
        self.label = label
        self.content = content
        self.onSelect = onSelect
    }
}
