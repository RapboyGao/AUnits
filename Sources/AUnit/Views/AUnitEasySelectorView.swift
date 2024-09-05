import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A view for selecting a unit of a specific type.
/// 提供选择特定类型单位的视图。
public struct AUnitEasySelectorView: View {
    @Binding private var unit: AUnit?
    private var typeFilter: AUnitType

    private var showNone: Bool

    public var body: some View {
        Menu {
            if showNone {
                Button(Ref.none) {
                    unit = nil
                }
            }
            AUnitForeachView(typeFilter: typeFilter) { unit in
                Button {
                    self.unit = unit
                } label: {
                    Label(unit.symbol + " / " + unit.longName, systemImage: unit.unitType.systemImage)
                }
            }
        } label: {
            if let unit = unit {
                Text(unit.symbol)
            } else {
                Text(Ref.none)
            }
        }
    }

    /// Initializes a new instance of `AUnitSelectorView`.
    /// 初始化 `AUnitSelectorView` 的新实例。
    /// - Parameters:
    ///   - unit: A binding to the selected unit.
    ///   - typeFilter: The unit type to filter by.
    ///     要过滤的单位类型。
    public init(unit: Binding<AUnit?>, filter typeFilter: AUnitType, showNone: Bool) {
        self._unit = unit
        self.typeFilter = typeFilter
        self.showNone = showNone
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct AUnitSelectorViewExample: View {
    @State private var unit: AUnit? = .meters

    var body: some View {
        AUnitEasySelectorView(unit: $unit, filter: .length, showNone: false)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    AUnitSelectorViewExample()
}
