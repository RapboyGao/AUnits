// ---------FuelEfficiency------------
public enum AUFuelEfficiency: AUnitProtocol, Identifiable {
    case litersPer100Kilometers, milesPerImperialGallon, milesPerGallon

    public var id: AUnit {
        switch self {
        case .litersPer100Kilometers: return .litersPer100Kilometers
        case .milesPerImperialGallon: return .milesPerImperialGallon
        case .milesPerGallon: return .milesPerGallon
        }
    }

    public static var baseUnit: AUFuelEfficiency = .litersPer100Kilometers

    public func toBaseValue(value: Double) -> Double {
        switch self {
        case .litersPer100Kilometers:
            return value
        case .milesPerImperialGallon:
            return 282.4809362796091 / value
        case .milesPerGallon:
            return 235.2145833333333 / value
        }
    }

    public func fromBaseValue(value: Double) -> Double {
        switch self {
        case .litersPer100Kilometers:
            return value
        case .milesPerImperialGallon:
            return 282.4809362796091 / value
        case .milesPerGallon:
            return 235.2145833333333 / value
        }
    }
}

/// Enumeration representing various units of temperature.
/// 表示各种温度单位的枚举。
public enum AUTemperature: AUnitProtocol, Identifiable {
    case kelvin, celsius, fahrenheit, rankine

    /// Coefficient for converting units to Celsius.
    /// 将单位转换为摄氏度的系数。
    private var coefficient: Double {
        switch self {
        // Temperature
        case .kelvin, .celsius: return 1.0
        case .fahrenheit, .rankine: return 5.0 / 9.0
        }
    }

    /// The constant for temperature conversion.
    /// 温度转换的常数。
    public var constant: Double {
        switch self {
        case .celsius: return 273.15
        case .fahrenheit: return 459.67
        case .kelvin, .rankine: return 0
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var id: AUnit {
        switch self {
        case .celsius: return .celsius
        case .fahrenheit: return .fahrenheit
        case .kelvin: return .kelvin
        case .rankine: return .rankine
        }
    }

    /// The base unit for temperature is Celsius.
    /// 温度的基本单位是摄氏度。
    public static var baseUnit: AUTemperature = .kelvin

    /// Converts a value to the base unit (Kelvin).
    /// 将一个值转换为基础单位（Kelvin）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in Kelvin.
    ///            以Kelvin为单位的值。
    public func toBaseValue(value: Double) -> Double {
        (value + constant) * coefficient
    }

    /// Converts a value from the base unit (Kelvin).
    /// 从基础单位（Kelvin）转换值。
    /// - Parameter value: The value in Kelvin.
    ///                    以Kelvin为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        (value / coefficient) - constant
    }
}
