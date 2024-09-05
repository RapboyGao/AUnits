import Foundation

// 符合比例的UnitProtocol
public protocol AProportionalUnitProtocol: AUnitProtocol {
    var coefficient: Double { get }
}

public extension AProportionalUnitProtocol {
    func toBaseValue(value: Double) -> Double {
        return value * self.coefficient
    }

    func fromBaseValue(value: Double) -> Double {
        return value / self.coefficient
    }
}
