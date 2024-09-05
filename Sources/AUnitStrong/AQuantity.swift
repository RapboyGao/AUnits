public struct AQuantity<UnitType: AUnitProtocol>: AQuantityProtocol {
    public var unit: UnitType
    public var value: Double
    public init(value: Double, unit: UnitType) {
        self.value = value
        self.unit = unit
    }
}

public extension AQuantity where UnitType: AProportionalUnitProtocol {
    func add(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value + other.value, unit: unit) }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return AQuantity(value: value1 + value2, unit: .baseUnit)
    }

    func subtract(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value - other.value, unit: unit) }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return AQuantity(value: value1 - value2, unit: .baseUnit)
    }

    func divided(by other: AQuantity<UnitType>) -> Double {
        guard unit != other.unit
        else { return value / other.value }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return value1 / value2
    }
}

// MARK: - 乘除法

public extension AQuantity where UnitType == AULength {
    func multiply(by other: AQuantity<AULength>) -> AQuantity<AUArea> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AUArea>(value: value1 * value2, unit: .squareMeters)
    }

    func multiply(by other: AQuantity<AUArea>) -> AQuantity<AUVolume> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .squareMeters)
        return AQuantity<AUVolume>(value: value1 * value2, unit: .cubicMeters)
    }

    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUSpeed>(value: value1 / value2, unit: .metersPerSecond)
    }

    func divided(by other: AQuantity<AUSpeed>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecond)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }
}

public extension AQuantity where UnitType == AUArea {
    func divided(by other: AQuantity<AULength>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .squareMeters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }

    func multiply(by other: AQuantity<AULength>) -> AQuantity<AUVolume> {
        other.multiply(by: self)
    }

    func divided(by other: AQuantity<AUVolume>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .squareMeters)
        let value2 = other.unit.convert(value: other.value, to: .cubicMeters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }
}

public extension AQuantity where UnitType == AUVolume {
    func divided(by other: AQuantity<AULength>) -> AQuantity<AUArea> {
        let value1 = unit.convert(value: value, to: .cubicMeters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AUArea>(value: value1 / value2, unit: .squareMeters)
    }

    func divided(by other: AQuantity<AUArea>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .cubicMeters)
        let value2 = other.unit.convert(value: other.value, to: .squareMeters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }

    func multiply(by other: AQuantity<AUConcentration>) -> AQuantity<AUMass> {
        other.multiply(by: self)
    }
}

public extension AQuantity where UnitType == AUTime {
    func multiply(by other: AQuantity<AUSpeed>) -> AQuantity<AULength> {
        other.multiply(by: self)
    }

    func multiply(by other: AQuantity<AUAcceleration>) -> AQuantity<AUSpeed> {
        other.multiply(by: self)
    }

    func multiply(by other: AQuantity<AUPower>) -> AQuantity<AUEnergy> {
        other.multiply(by: self)
    }

    func multiply(by other: AQuantity<AUAngularVelocity>) -> AQuantity<AUAngle> {
        other.multiply(by: self)
    }

    func divided(by other: AQuantity<AUSpeed>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .seconds)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecond)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }

    func divided(by other: AQuantity<AUAcceleration>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .seconds)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecondSquared)
        return AQuantity<AUSpeed>(value: value1 / value2, unit: .metersPerSecond)
    }
}

public extension AQuantity where UnitType == AUSpeed {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AULength>(value: value1 * value2, unit: .meters)
    }

    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUAcceleration> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAcceleration>(value: value1 / value2, unit: .metersPerSecondSquared)
    }

    func divided(by other: AQuantity<AUAcceleration>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecondSquared)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }
}

public extension AQuantity where UnitType == AUAcceleration {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .metersPerSecondSquared)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUSpeed>(value: value1 * value2, unit: .metersPerSecond)
    }
}

public extension AQuantity where UnitType == AUMass {
    func divided(by other: AQuantity<AUVolume>) -> AQuantity<AUConcentration> {
        let value1 = unit.convert(value: value, to: .grams)
        let value2 = other.unit.convert(value: other.value, to: .liters)
        return AQuantity<AUConcentration>(value: value1 / value2, unit: .gramsPerLiter)
    }

    func divided(by other: AQuantity<AUConcentration>) -> AQuantity<AUVolume> {
        let value1 = unit.convert(value: value, to: .grams)
        let value2 = other.unit.convert(value: other.value, to: .gramsPerLiter)
        return AQuantity<AUVolume>(value: value1 / value2, unit: .liters)
    }
}

public extension AQuantity where UnitType == AUConcentration {
    func multiply(by other: AQuantity<AUVolume>) -> AQuantity<AUMass> {
        let value1 = unit.convert(value: value, to: .gramsPerLiter)
        let value2 = other.unit.convert(value: other.value, to: .liters)
        return AQuantity<AUMass>(value: value1 * value2, unit: .grams)
    }
}

public extension AQuantity where UnitType == AUEnergy {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUPower> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUPower>(value: value1 / value2, unit: .watts)
    }

    func divided(by other: AQuantity<AUPower>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .watts)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }

    func divided(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUElectricChargeCapacity> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUElectricChargeCapacity>(value: value1 / value2, unit: .coulombs)
    }

    func divided(by other: AQuantity<AUElectricChargeCapacity>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .coulombs)
        return AQuantity<AUElectricPotential>(value: value1 / value2, unit: .volts)
    }
}

public extension AQuantity where UnitType == AUPower {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUEnergy> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUEnergy>(value: value1 * value2, unit: .joules)
    }

    func divided(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .amperes)
        return AQuantity<AUElectricPotential>(value: value1 / value2, unit: .volts)
    }

    func divided(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUElectricCurrent> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUElectricCurrent>(value: value1 / value2, unit: .amperes)
    }
}

public extension AQuantity where UnitType == AUElectricCurrent {
    func multiply(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUPower> {
        let value1 = unit.convert(value: value, to: .amperes)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUPower>(value: value1 * value2, unit: .watts)
    }

    func multiply(by other: AQuantity<AUElectricResistance>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .amperes)
        let value2 = other.unit.convert(value: other.value, to: .ohms)
        return AQuantity<AUElectricPotential>(value: value1 * value2, unit: .volts)
    }
}

public extension AQuantity where UnitType == AUElectricPotential {
    func multiply(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUPower> {
        other.multiply(by: self)
    }

    func divided(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricResistance> {
        let value1 = unit.convert(value: value, to: .volts)
        let value2 = other.unit.convert(value: other.value, to: .amperes)
        return AQuantity<AUElectricResistance>(value: value1 / value2, unit: .ohms)
    }

    func divided(by other: AQuantity<AUElectricResistance>) -> AQuantity<AUElectricCurrent> {
        let value1 = unit.convert(value: value, to: .volts)
        let value2 = other.unit.convert(value: other.value, to: .ohms)
        return AQuantity<AUElectricCurrent>(value: value1 / value2, unit: .amperes)
    }

    func multiply(by other: AQuantity<AUElectricChargeCapacity>) -> AQuantity<AUEnergy> {
        other.multiply(by: self)
    }
}

public extension AQuantity where UnitType == AUElectricResistance {
    func multiply(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricPotential> {
        other.multiply(by: self)
    }
}

public extension AQuantity where UnitType == AUElectricChargeCapacity {
    func multiply(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUEnergy> {
        let value1 = unit.convert(value: value, to: .ampereHours)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUEnergy>(value: value1 * value2, unit: .joules)
    }
}

public extension AQuantity where UnitType == AUAngle {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUAngularVelocity> {
        let value1 = unit.convert(value: value, to: .degrees)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAngularVelocity>(value: value1 / value2, unit: .degreesPerSecond)
    }

    func divided(by other: AQuantity<AUAngularVelocity>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .degrees)
        let value2 = other.unit.convert(value: other.value, to: .degreesPerSecond)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }
}

public extension AQuantity where UnitType == AUAngularVelocity {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUAngle> {
        let value1 = unit.convert(value: value, to: .degreesPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAngle>(value: value1 * value2, unit: .degrees)
    }
}

// MARK: - 温度加减法

public extension AQuantity where UnitType == AUTemperature {
    func add(_ other: AQuantity<AUTemperatureDifference>) -> AQuantity<AUTemperature> {
        switch unit {
        case .kelvin, .celsius:
            let temperatureDelta = other.converted(to: .celsiusDelta)
            return AQuantity(value: value + temperatureDelta.value, unit: unit)
        case .fahrenheit, .rankine:
            let temperatureDelta = other.converted(to: .fahrenheitDelta)
            return AQuantity(value: value + temperatureDelta.value, unit: unit)
        }
    }

    func subtract(_ other: AQuantity<AUTemperatureDifference>) -> AQuantity<AUTemperature> {
        switch unit {
        case .kelvin, .celsius:
            let temperatureDelta = other.converted(to: .celsiusDelta)
            return AQuantity(value: value - temperatureDelta.value, unit: unit)
        case .fahrenheit, .rankine:
            let temperatureDelta = other.converted(to: .fahrenheitDelta)
            return AQuantity(value: value - temperatureDelta.value, unit: unit)
        }
    }
}

public extension AQuantity where UnitType == AUTemperatureDifference {
    func add(_ other: AQuantity<AUTemperature>) -> AQuantity<AUTemperature> {
        other.add(self)
    }
}
