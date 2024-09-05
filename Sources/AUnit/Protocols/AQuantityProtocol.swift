import Foundation

/// Protocol representing a measurement with a specific value and unit.
/// 表示具有特定值和单位的测量协议。
public protocol AQuantityProtocol: Codable, Hashable, Sendable {
    associatedtype UnitType: AUnitProtocol

    /// The value of the measurement.
    /// 测量的值。
    var value: Double { get set }

    /// The unit of the measurement.
    /// 测量的单位。
    var unit: UnitType { get set }

    /// Initializes a new measurement with the given value and unit.
    /// 使用给定的值和单位初始化一个新的测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///   - unit: The unit of the measurement.
    init(value: Double, unit: UnitType)
}

public extension AQuantityProtocol {
    /// Converts the measurement to a specified unit.
    /// 将测量值转换为指定单位。
    /// - Parameter newUnit: The target unit to convert to.
    ///                      要转换的目标单位。
    mutating func convertSelf(to newUnit: UnitType) {
        self.value = unit.convert(value: value, to: newUnit)
        self.unit = newUnit
    }

    /// Returns a new measurement converted to a specified unit.
    /// 返回一个转换为指定单位的新测量值。
    /// - Parameter newUnit: The target unit to convert to.
    ///                      要转换的目标单位。
    /// - Returns: A new measurement converted to the target unit.
    ///            转换为目标单位的新测量值。
    func converted(to newUnit: UnitType) -> Self {
        let newValue = unit.convert(value: value, to: newUnit)
        return .init(value: newValue, unit: newUnit)
    }

    /// Checks if this measurement is equal to another measurement within a specified tolerance.
    /// 检查此测量值是否在指定的容差范围内等于另一个测量值。
    /// - Parameters:
    ///   - other: The other measurement to compare.
    ///   - epsilon: The tolerance within which the measurements are considered equal.
    /// - Returns: A boolean indicating whether the measurements are equal within the specified tolerance.
    func isEqual(to other: Self, epsilon: Double = 1e-10) -> Bool {
        let convertedOther = other.converted(to: unit)
        return abs(value - convertedOther.value) <= epsilon
    }
}
