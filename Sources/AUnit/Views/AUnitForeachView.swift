import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
/// A view for iterating over units of a specific type.
/// 提供遍历特定类型单位的视图。
public struct AUnitForeachView<Content: View>: View {
    private var typeFilter: AUnitType
    private var content: (AUnit) -> Content

    private var unitsOfTheSameType: [AUnit] {
        AUnit.allCases.filter { unit in
            unit.unitType == typeFilter
        }
    }

    public var body: some View {
        ForEach(unitsOfTheSameType) { unit in
            content(unit)
        }
    }

    /// Initializes a new instance of `AUnitForeachView`.
    /// 初始化 `AUnitForeachView` 的新实例。
    /// - Parameters:
    ///   - typeFilter: The unit type to filter by.
    ///     要过滤的单位类型。
    ///   - content: A view builder that provides the content for each unit.
    ///     为每个单位提供内容的视图构建器。
    public init(typeFilter: AUnitType, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.typeFilter = typeFilter
        self.content = content
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    List(AUnitType.allCases) { unitType in
        Section(unitType.shortName) {
            AUnitForeachView(typeFilter: unitType) { unit in
                DisclosureGroup(unit.symbol) {
                    VStack(alignment: .leading) {
                        Text(unit.shortName)
                        Text(unit.longName)
                        Text(unit.detailedIntroduction)
                    }
                }
            }
        }
    }
    .environment(\.locale, .init(identifier: "zh-Hans"))
}
