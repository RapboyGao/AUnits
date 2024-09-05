import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
/// A view for inputting a value and selecting a unit.
/// 提供输入值和选择单位的视图。
public struct AUnitInputHStack<ALabel: View>: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit
    private var digits: Int
    private var placeholder: String
    private var label: () -> ALabel

    public var body: some View {
        HStack {
            label()
            AUnitInputViews(value: $value, unit: $unit, originalUnit, digits: digits, placeholder: placeholder)
        }
    }

    /// Initializes a new instance of `AUnitInputHStack`.
    /// 初始化 `AUnitInputHStack` 的新实例。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeholder: The placeholder text for the text field.
    ///   - label: A view builder for the label to be displayed before the text field.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeholder: String, @ViewBuilder label: @escaping () -> ALabel) {
        _value = value
        _unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        self.label = label
    }

    /// Initializes a new instance of `AUnitInputHStack` with a default label.
    /// 初始化 `AUnitInputHStack` 的新实例，并使用默认标签。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeholder: The placeholder text for the text field, which is also used as the label.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeholder: String) where ALabel == Text {
        _value = value
        _unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        label = { Text(placeholder) }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
private struct UnitInputViewExample: View {
    @State private var value: Double? = 1500
    @State private var unit1: AUnit? = .fahrenheit
    @State private var unit2: AUnit? = .feet

    var body: some View {
        NavigationView {
            List {
                AUnitInputHStack(
                    value: $value,
                    unit: $unit1,
                    .meters,
                    digits: 5,
                    placeholder: "1"
                )
                AUnitInputHStack(
                    value: $value,
                    unit: $unit2,
                    .meters,
                    digits: 5,
                    placeholder: "2"
                )
            }
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    UnitInputViewExample()
}
