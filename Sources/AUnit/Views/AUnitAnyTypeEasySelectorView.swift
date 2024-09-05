import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A view for selecting a unit from any unit type easily.
/// 提供选择任意单位类型的视图。
public struct AUnitAnyTypeEasySelectorView: View {
    @Binding private var unit: AUnit?

    public var body: some View {
        AUnitAnyTypeSelectorView(showNil: true) { unit in
            Text(unit.symbol + " / " + unit.longName)
        } content: {
            if let unit = unit {
                Text(unit.shortName)
            } else {
                Text(Ref.none)
            }
        } onSelect: {
            unit = $0
        }
    }

    /// Initializes a new instance of `AUnitAnyTypeEasySelectorView`.
    /// 初始化 `AUnitAnyTypeEasySelectorView` 的新实例。
    /// - Parameter unit: A binding to the selected unit.
    ///   绑定到选定单位的绑定。
    public init(unit: Binding<AUnit?>) {
        self._unit = unit
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct Example: View {
    @State private var unit: AUnit? = nil
    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $unit)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    Example()
}
