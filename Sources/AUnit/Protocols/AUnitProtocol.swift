import Foundation

/// Protocol representing a unit of measurement with conversion capabilities.
/// 表示具有转换功能的测量单位的协议。
public protocol AUnitProtocol: Codable, Sendable, Hashable, CaseIterable {
    /// Converts a value from the current unit to another unit.
    /// 将一个值从当前单位转换为另一个单位。
    /// - Parameters:
    ///   - value: The value to be converted.
    ///            要转换的值。
    ///   - unit: The target unit to convert to.
    ///           要转换到的目标单位。
    /// - Returns: The converted value.
    ///            转换后的值。
    func convert(value: Double, to unit: Self) -> Double

    /// Converts a value to the base unit value.
    /// 将一个值转换为基础单位值。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in the base unit.
    ///            基础单位中的值。
    func toBaseValue(value: Double) -> Double

    /// Converts a value from the base unit value.
    /// 从基础单位值转换一个值。
    /// - Parameter value: The value in the base unit.
    ///                    基础单位中的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    func fromBaseValue(value: Double) -> Double

    /// Associated AUnit enumeration value.
    /// 关联的 AUnit 枚举值。
    var id: AUnit { get }

    /// The base unit for this unit type.
    /// 此单位类型的基础单位。
    static var baseUnit: Self { get }
}

public extension AUnitProtocol {
    /// The symbol for the unit.
    /// 单位的符号。
    var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit.
    /// 单位的短名称。
    var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit.
    /// 单位的全名称。
    var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit.
    /// 单位的详细介绍。
    var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// Converts a value from the current unit to another unit of the same type.
    /// 将一个值从当前单位转换为相同类型的另一个单位。
    /// - Parameters:
    ///   - value: The value to be converted.
    ///            要转换的值。
    ///   - unit: The target unit to convert to.
    ///           要转换到的目标单位。
    /// - Returns: The converted value.
    ///            转换后的值。
    func convert(value: Double, to unit: Self) -> Double {
        let baseValue = self.toBaseValue(value: value)
        return unit.fromBaseValue(value: baseValue)
    }
}
