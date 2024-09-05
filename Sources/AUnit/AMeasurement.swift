import Foundation

/// A struct representing a measurement with a specific value and unit.
/// 表示具有特定值和单位的测量结构。
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    /// The value of the measurement.
    /// 测量的值。
    public var value: Double
    /// The unit of the measurement.
    /// 测量的单位。
    public var unit: AUnit

    /// Initializes a new measurement with the given value and unit.
    /// 使用给定的值和单位初始化一个新的测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///   - unit: The unit of the measurement.
    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    /// Converts the measurement to a target unit.
    /// 将测量值转换为目标单位。
    /// - Parameter targetUnit: The unit to convert to.
    /// - Returns: A new measurement converted to the target unit, or nil if conversion is not possible.
    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    /// A description of the measurement.
    /// 测量的描述。
    public var description: String {
        return "\(value) \(unit.symbol)"
    }

    /// Adds another measurement to this measurement.
    /// 将另一个测量值添加到此测量值中。
    /// - Parameter other: The other measurement to add.
    /// - Returns: A new measurement representing the sum, or nil if the units are incompatible.
    public func adding(_ other: AMeasurement) -> AMeasurement? {
        switch unit {
        case .fahrenheit, .rankine:
            guard let otherConverted = other.converted(to: .fahrenheitDelta)
            else { return nil }
            return AMeasurement(value: value + otherConverted.value, unit: unit)
        case .celsius, .kelvin:
            guard let otherConverted = other.converted(to: .celsiusDelta)
            else { return nil }
            return AMeasurement(value: value + otherConverted.value, unit: unit)
        default:
            guard unit.unitType == other.unit.unitType,
                  unit.unitType != .fuelEfficiency, // 燃油效率特殊，不能相加减
                  let otherConverted = other.converted(to: unit)
            else { return nil }
            return AMeasurement(value: value + otherConverted.value, unit: unit)
        }
    }

    /// Subtracts another measurement from this measurement.
    /// 从此测量值中减去另一个测量值。
    /// - Parameter other: The other measurement to subtract.
    /// - Returns: A new measurement representing the difference, or nil if the units are incompatible.
    public func subtracting(_ other: AMeasurement) -> AMeasurement? {
        switch unit {
        case .fahrenheit, .rankine:
            guard let otherConverted = other.converted(to: .fahrenheitDelta)
            else { return nil }
            return AMeasurement(value: value - otherConverted.value, unit: unit)
        case .celsius, .kelvin:
            guard let otherConverted = other.converted(to: .celsiusDelta)
            else { return nil }
            return AMeasurement(value: value - otherConverted.value, unit: unit)
        default:
            guard unit.unitType == other.unit.unitType,
                  unit.unitType != .fuelEfficiency, // 燃油效率特殊，不能相加减
                  let otherConverted = other.converted(to: unit)
            else { return nil }
            return AMeasurement(value: value - otherConverted.value, unit: unit)
        }
    }

    /// Multiplies this measurement by another measurement.
    /// 将此测量值乘以另一个测量值。
    /// - Parameter other: The other measurement to multiply by.
    /// - Returns: A new measurement representing the product, or nil if the units are incompatible.
    public func multiplying(by other: AMeasurement, recalculate: Bool = false) -> AMeasurement? {
        switch (unit.unitType, other.unit.unitType) {
        case (.length, .length):
            guard let selfInMeters = converted(to: .meters),
                  let otherInMeters = other.converted(to: .meters) else { return nil }
            return AMeasurement(value: selfInMeters.value * otherInMeters.value, unit: .squareMeters)
        case (.length, .area):
            guard let selfInMeters = converted(to: .meters),
                  let otherInSquareMeters = other.converted(to: .squareMeters) else { return nil }
            return AMeasurement(value: selfInMeters.value * otherInSquareMeters.value, unit: .cubicMeters)
        case (.electricCurrent, .electricPotential):
            guard let selfInAmperes = converted(to: .amperes),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInAmperes.value * otherInVolts.value, unit: .watts)
        case (.power, .time):
            guard let selfInWatts = converted(to: .watts),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInWatts.value * otherInSeconds.value, unit: .joules)
        case (.speed, .time):
            guard let selfInMetersPerSecond = converted(to: .metersPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecond.value * otherInSeconds.value, unit: .meters)
        case (.acceleration, .time):
            guard let selfInMetersPerSecondSquared = converted(to: .metersPerSecondSquared),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecondSquared.value * otherInSeconds.value, unit: .metersPerSecond)
        case (.electricChargeCapacity, .electricPotential):
            guard let selfInAmpereHours = converted(to: .ampereHours),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInAmpereHours.value * otherInVolts.value, unit: .wattHours)
        case (.angularVelocity, .time):
            guard let selfInRadiansPerSecond = converted(to: .radiansPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInRadiansPerSecond.value * otherInSeconds.value, unit: .radians)
        case (.time, .angularVelocity):
            guard let selfInSeconds = converted(to: .seconds),
                  let otherInRadiansPerSecond = other.converted(to: .radiansPerSecond) else { return nil }
            return AMeasurement(value: selfInSeconds.value * otherInRadiansPerSecond.value, unit: .radians)
        // 其他乘法操作（可根据需要扩展）
        default:
            guard recalculate else { return other.multiplying(by: self, recalculate: true) }
            return nil
        }
    }

    /// Multiplies this measurement by a scalar.
    /// 将此测量值乘以一个标量。
    /// - Parameter scalar: The scalar to multiply by.
    /// - Returns: A new measurement representing the product.
    public func multiplying(by scalar: Double) -> AMeasurement {
        return AMeasurement(value: value * scalar, unit: unit)
    }

    /// Divides this measurement by another measurement.
    /// 将此测量值除以另一个测量值。
    /// - Parameter other: The other measurement to divide by.
    /// - Returns: A new measurement representing the quotient, or nil if the units are incompatible.
    public func dividing(by other: AMeasurement) -> AMeasurement? {
        switch (unit.unitType, other.unit.unitType) {
        case (.length, .time):
            guard let selfInMeters = converted(to: .meters),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMeters.value / otherInSeconds.value, unit: .metersPerSecond)
        case (.mass, .volume):
            guard let selfInKilograms = converted(to: .grams),
                  let otherInLiters = other.converted(to: .liters) else { return nil }
            return AMeasurement(value: selfInKilograms.value / otherInLiters.value, unit: .gramsPerLiter)
        case (.electricPotential, .electricCurrent):
            guard let selfInVolts = converted(to: .volts),
                  let otherInAmperes = other.converted(to: .amperes) else { return nil }
            return AMeasurement(value: selfInVolts.value / otherInAmperes.value, unit: .ohms)
        case (.energy, .time):
            guard let selfInJoules = converted(to: .joules),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInSeconds.value, unit: .watts)
        case (.speed, .time):
            guard let selfInMetersPerSecond = converted(to: .metersPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecond.value / otherInSeconds.value, unit: .metersPerSecondSquared)
        case (.energy, .electricPotential):
            guard let selfInJoules = converted(to: .wattHours),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInVolts.value, unit: .ampereHours)
        case (.energy, .electricChargeCapacity):
            guard let selfInJoules = converted(to: .wattHours),
                  let otherInAmpereHours = other.converted(to: .ampereHours) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInAmpereHours.value, unit: .volts)
        case (.volume, .area):
            guard let selfInCubicMeters = converted(to: .cubicMeters),
                  let otherInSquareMeters = other.converted(to: .squareMeters) else { return nil }
            return AMeasurement(value: selfInCubicMeters.value / otherInSquareMeters.value, unit: .meters)
        case (.volume, .length):
            guard let selfInCubicMeters = converted(to: .cubicMeters),
                  let otherInMeters = other.converted(to: .meters) else { return nil }
            return AMeasurement(value: selfInCubicMeters.value / otherInMeters.value, unit: .squareMeters)
        case (.angle, .time):
            guard let selfInRadians = converted(to: .radians),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInRadians.value / otherInSeconds.value, unit: .radiansPerSecond)
        // 其他除法操作（可根据需要扩展）
        default:
            return nil
        }
    }

    /// Divides this measurement by a scalar.
    /// 将此测量值除以一个标量。
    /// - Parameter scalar: The scalar to divide by.
    /// - Returns: A new measurement representing the quotient.
    public func dividing(by scalar: Double) -> AMeasurement {
        return AMeasurement(value: value / scalar, unit: unit)
    }

    /// Performs the modulo operation on this measurement by another measurement.
    /// 对该测量值执行取模运算。
    /// - Parameter other: The other measurement to use as the divisor.
    /// - Returns: A new measurement representing the remainder, or nil if the units are incompatible or temperature units.
    public func modulo(by other: AMeasurement) -> AMeasurement? {
        guard unit.unitType == other.unit.unitType,
              unit.unitType != .temperature,
              unit.unitType != .fuelEfficiency,
              let otherConverted = other.converted(to: unit) else { return nil }
        return AMeasurement(value: value.truncatingRemainder(dividingBy: otherConverted.value), unit: unit)
    }

    /// Checks if this measurement is equal to another measurement within a specified tolerance.
    /// 检查此测量值是否在指定的容差范围内等于另一个测量值。
    /// - Parameters:
    ///   - other: The other measurement to compare.
    ///   - epsilon: The tolerance within which the measurements are considered equal.
    /// - Returns: A boolean indicating whether the measurements are equal within the specified tolerance.
    public func equal(to other: AMeasurement, epsilon: Double = 1e-10) -> Bool {
        guard let convertedOther = other.converted(to: unit)
        else { return false }
        return abs(value - convertedOther.value) <= epsilon
    }
}
