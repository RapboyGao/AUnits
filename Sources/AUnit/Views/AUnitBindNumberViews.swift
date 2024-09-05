import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)
/// A SwiftUI view for binding and displaying a numeric value with a selectable unit.
/// This view supports input and display modes, allowing the user to input a value
/// or simply view the converted value with its unit.
/// 一个用于绑定和显示数值与选择单位的 SwiftUI 视图。
/// 此视图支持输入和显示模式，允许用户输入值或仅查看其单位的转换值。
public struct AUnitBindNumberViews: View {
    @Binding private var originalValue: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit?
    private var digits: Int
    private var placeholder: String
    private var allowInput: Bool

    private var shownUnit: AUnit? {
        guard originalUnit?.unitType == unit?.unitType
        else { return originalUnit }
        return unit
    }

    private var bindUnit: Binding<AUnit?> {
        Binding {
            shownUnit
        } set: {
            unit = $0
        }
    }

    private var shownValue: Double? {
        guard let value = originalValue,
              let unit = bindUnit.wrappedValue
        else { return originalValue }
        return originalUnit?.convert(value: value, to: unit)
    }

    private func handleInput(_ newValue: Double?) {
        guard let newValue = newValue
        else {
            originalValue = nil
            return
        }
        guard let shownUnit = shownUnit,
              let originalUnit = originalUnit
        else {
            originalValue = newValue
            return
        }
        originalValue = shownUnit.convert(value: newValue, to: originalUnit)
    }

    private var bindValue: Binding<Double?> {
        Binding<Double?>(
            get: { shownValue },
            set: handleInput
        )
    }

    private var format: FloatingPointFormatStyle<Double> {
        .number.precision(.significantDigits(0 ... digits))
    }

    public var body: some View {
        if allowInput {
            TextField(placeholder, value: bindValue, format: format)
                .multilineTextAlignment(.trailing)
            #if os(iOS)
                .modifier(NumberKeyboardModifier(value: bindValue, digits: digits))
            #endif
        } else {
            Spacer()
            if let shownValue = shownValue {
                Text("=")
                Text(shownValue, format: format)
                    .textSelection(.enabled)
            } else {
                Text(verbatim: "-")
            }
        }
        if let originalUnit = originalUnit, shownValue != nil || allowInput {
            AUnitEasySelectorView(unit: bindUnit, filter: originalUnit.unitType, showNone: false)
            #if os(macOS)
                .frame(maxWidth: 100)
            #endif
        }
    }

    /// Initializes a new instance of `AUnitBindNumberViews`.
    /// 初始化 `AUnitBindNumberViews` 的新实例。
    /// - Parameters:
    ///   - value: A binding to the numeric value.
    ///            数值的绑定。
    ///   - unit: A binding to the unit associated with the value.
    ///           与值关联的单位的绑定。
    ///   - origin: The original unit for conversion, if applicable.
    ///             用于转换的原始单位（如果适用）。
    ///   - digits: Number of significant digits to display.
    ///             要显示的重要数字位数。
    ///   - placeholder: Placeholder text for input fields.
    ///                  输入字段的占位符文本。
    ///   - allowInput: Determines whether the view allows input.
    ///                 确定视图是否允许输入。
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, origin originalUnit: AUnit?, digits: Int, placeholder: String, allowInput: Bool) {
        self._originalValue = value
        self._unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        self.allowInput = allowInput
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)

#Preview {
    List {
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.feet), origin: .meters, digits: 5, placeholder: "Hello", allowInput: true)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.meters), origin: .meters, digits: 5, placeholder: "Hello", allowInput: true)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.celsius), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.celsius), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.fahrenheit), origin: nil, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.fahrenheit), origin: nil, digits: 5, placeholder: "Hello", allowInput: false)
        }
    }
}
