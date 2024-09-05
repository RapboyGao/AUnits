import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
/// A view for inputting a value and selecting a unit.
/// 提供输入值和选择单位的视图。
public struct AUnitInputViews: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit
    private var digits: Int
    private var placeholder: String

    private var bindUnit: Binding<AUnit?> {
        Binding {
            guard originalUnit.unitType == unit?.unitType
            else { return originalUnit }
            return unit
        } set: {
            unit = $0
        }
    }

    private var convertedValue: Binding<Double?> {
        Binding<Double?>(
            get: {
                guard let value = value,
                      let unit = bindUnit.wrappedValue
                else { return value }
                return originalUnit.convert(value: value, to: unit)
            },
            set: { newValue in
                guard let newValue = newValue,
                      let unit = bindUnit.wrappedValue
                else {
                    value = newValue
                    return
                }
                value = unit.convert(value: newValue, to: originalUnit)
            }
        )
    }

    public var body: some View {
        TextField(
            placeholder,
            value: convertedValue,
            format: .number.precision(.significantDigits(0 ... digits))
        )
        .multilineTextAlignment(.trailing)
        #if os(iOS)
            .modifier(NumberKeyboardModifier(value: convertedValue, digits: digits))
        #endif
        AUnitEasySelectorView(unit: bindUnit, filter: originalUnit.unitType, showNone: false)
    }

    /// Initializes a new instance of `UnitInputView`.
    /// 初始化 `UnitInputView` 的新实例。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeholder: The placeholder text for the text field.
    ///   - label: A view builder for the label to be displayed before the text field.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeholder: String) {
        _value = value
        _unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
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
