@testable import AUnit
import XCTest

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
final class OtherTests: XCTestCase {
    func testSummary() throws {
        print("现在一共有\(AUnit.allCases.count)种单位")
    }

    func testSummaryProportional() throws {
        for unitType in AUnitType.allCases {
            guard unitType != .fuelEfficiency, unitType != .temperature
            else { continue }
            let capitalFirst = "\(unitType)".replacing(#/^\w/#) { match in
                match.capitalized
            }
            let caseStrings = unitType.allUnits.map { unit in
                "\(unit)"
            }
            let coefficientStrings = unitType.allUnits.map { unit in
                "case .\(unit): return \(unit.coefficient)"
            }
            let aUnitStrings = caseStrings.map {
                "case .\($0): return .\($0)"
            }
            let baseUnit = unitType.allUnits.first { $0.coefficient == 1 && $0.constant == 0 }
            guard let baseUnit = baseUnit
            else { fatalError("没有基准单位") }
            let toPrint = """
            // Mark: - \(capitalFirst)
            public enum AU\(capitalFirst): AProportionalUnitProtocol, Identifiable{
                case \(caseStrings.joined(separator: ","))
                public var coefficient: Double {
                    switch self {
                    \(coefficientStrings.joined(separator: "\n\t\t"))
                    }
                }
                public var id: AUnit {
                    switch self {
                    \(aUnitStrings.joined(separator: "\n\t\t"))
                    }
                }
                public static var baseUnit: AU\(capitalFirst) = .\(baseUnit)
            }
            """
            print(toPrint)
        }
    }

    func testTemperature() throws {
        let number = Double.random(in: -50 ... 100)
        guard let value1 = AUnit.celsius.convert(value: number, to: .fahrenheit)
        else {
            fatalError("Cannot convert")
        }
        let value2 = AUTemperature.celsius.convert(value: number, to: .fahrenheit)
        let quantity = AQuantity(value: number, unit: AUTemperature.celsius)
        let value3 = quantity.converted(to: .fahrenheit).value
        XCTAssertEqual(value1, value2, accuracy: 1e-10, "Temperature conversion error")
        XCTAssertEqual(value2, value3, accuracy: 1e-10, "Temperature conversion error")
    }

    func testFuelEfficiency() throws {
        let number = Double.random(in: -50 ... 100)
        guard let value1 = AUnit.litersPer100Kilometers.convert(value: number, to: .milesPerGallon)
        else {
            fatalError("Cannot convert")
        }
        let value2 = AUFuelEfficiency.litersPer100Kilometers.convert(value: number, to: .milesPerGallon)
        let quantity = AQuantity(value: number, unit: AUFuelEfficiency.litersPer100Kilometers)
        let value3 = quantity.converted(to: .milesPerGallon).value
        XCTAssertEqual(value1, value2, accuracy: 1e-10, "Fuel efficiency conversion error")
        XCTAssertEqual(value2, value3, accuracy: 1e-10, "Fuel efficiency conversion error")
    }

    func testLength() throws {
        let value1 = AULength.nauticalMiles.convert(value: 1, to: .kilometers)
        XCTAssertEqual(value1, 1.852)
    }

    func testUUID() throws {
        print(UUID())
    }
}
