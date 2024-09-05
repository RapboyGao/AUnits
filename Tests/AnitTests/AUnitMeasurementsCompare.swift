@testable import AUnit
import Foundation
import XCTest

final class AUnitMeasurementsCompare: XCTestCase {
    let epsilon = 1e-2 // 设定容忍度，增加精度

    /// 定义测试转换函数
    /// - Parameters:
    ///   - value: 测试值
    ///   - from: 起始单位
    ///   - to: 目标单位
    ///   - expected: 预期结果
    func assertConversion(_ value: Double, from: AUnit, to: AUnit, expected: Double) {
        let measurement = AMeasurement(value: value, unit: from)
        guard let converted = measurement.converted(to: to) else {
            XCTFail("Conversion from \(from) to \(to) failed.")
            return
        }
        XCTAssertEqual(converted.value, expected, accuracy: epsilon, "Conversion from \(from) to \(to) expected to be \(expected), but got \(converted.value)")
    }

    func assertMeasurementConversion<T: Dimension>(_ value: Double, from: T, to: T, expected: Double) {
        let measurement = Measurement(value: value, unit: from)
        let converted = measurement.converted(to: to)
        XCTAssertEqual(converted.value, expected, accuracy: epsilon, "Conversion from \(from) to \(to) expected to be \(expected), but got \(converted.value)")
    }

    func testLengthConversions() {
        let lengthConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitLength, foundationTo: UnitLength)] = [
            (1.0, .feet, .meters, .feet, .meters),
            (1.0, .nauticalMiles, .meters, .nauticalMiles, .meters),
            (1.0, .kilometers, .meters, .kilometers, .meters),
            (1.0, .miles, .meters, .miles, .meters),
            (1.0, .inches, .meters, .inches, .meters),
            (1.0, .yards, .meters, .yards, .meters),
            (1.0, .lightyears, .meters, .lightyears, .meters)
        ]

        for conversion in lengthConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testMassConversions() {
        let massConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitMass, foundationTo: UnitMass)] = [
            (1.0, .kilograms, .grams, .kilograms, .grams),
            (1.0, .pounds, .grams, .pounds, .grams),
            (1.0, .ounces, .grams, .ounces, .grams),
            (1.0, .metricTons, .grams, .metricTons, .grams),
            (1.0, .stones, .grams, .stones, .grams)
        ]

        for conversion in massConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testVolumeConversions() {
        let volumeConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitVolume, foundationTo: UnitVolume)] = [
            (1.0, .liters, .cubicMeters, .liters, .cubicMeters),
            (1.0, .gallons, .liters, .gallons, .liters),
            (1.0, .cubicFeet, .cubicMeters, .cubicFeet, .cubicMeters),
            (1.0, .quarts, .liters, .quarts, .liters),
            (1.0, .pints, .liters, .pints, .liters)
        ]

        for conversion in volumeConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testSpeedConversions() {
        let speedConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitSpeed, foundationTo: UnitSpeed)] = [
            (1.0, .knots, .metersPerSecond, .knots, .metersPerSecond),
            (1.0, .milesPerHour, .metersPerSecond, .milesPerHour, .metersPerSecond),
            (1.0, .kilometersPerHour, .metersPerSecond, .kilometersPerHour, .metersPerSecond)
        ]

        for conversion in speedConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testPressureConversions() {
        let pressureConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitPressure, foundationTo: UnitPressure)] = [
            (1.0, .hectopascals, .newtonsPerMetersSquared, .hectopascals, .newtonsPerMetersSquared),
            (1.0, .inchesOfMercury, .newtonsPerMetersSquared, .inchesOfMercury, .newtonsPerMetersSquared),
            (1.0, .millimetersOfMercury, .newtonsPerMetersSquared, .millimetersOfMercury, .newtonsPerMetersSquared),
            (1.0, .bars, .newtonsPerMetersSquared, .bars, .newtonsPerMetersSquared)
        ]

        for conversion in pressureConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testTemperatureConversions() {
        let temperatureConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitTemperature, foundationTo: UnitTemperature)] = [
            (0.0, .celsius, .kelvin, .celsius, .kelvin),
            (32.0, .fahrenheit, .kelvin, .fahrenheit, .kelvin)
        ]

        for conversion in temperatureConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testPowerConversions() {
        let powerConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitPower, foundationTo: UnitPower)] = [
            (1.0, .kilowatts, .watts, .kilowatts, .watts),
            (1.0, .horsepower, .watts, .horsepower, .watts)
        ]

        for conversion in powerConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testEnergyConversions() {
        let energyConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitEnergy, foundationTo: UnitEnergy)] = [
            (1000.0, .joules, .kilojoules, .joules, .kilojoules),
            (1.0, .calories, .joules, .calories, .joules),
            (1.0, .kilowattHours, .joules, .kilowattHours, .joules)
        ]

        for conversion in energyConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testFrequencyConversions() {
        let frequencyConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitFrequency, foundationTo: UnitFrequency)] = [
            (1.0, .hertz, .kilohertz, .hertz, .kilohertz),
            (1.0, .terahertz, .hertz, .terahertz, .hertz),
            (1.0, .gigahertz, .hertz, .gigahertz, .hertz),
            (1.0, .megahertz, .hertz, .megahertz, .hertz),
            (1.0, .millihertz, .hertz, .millihertz, .hertz),
            (1.0, .microhertz, .hertz, .microhertz, .hertz),
            (1.0, .nanohertz, .hertz, .nanohertz, .hertz)
        ]

        for conversion in frequencyConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testAreaConversions() {
        let areaConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitArea, foundationTo: UnitArea)] = [
            (1.0, .squareKilometers, .squareMeters, .squareKilometers, .squareMeters),
            (1.0, .acres, .squareMeters, .acres, .squareMeters),
            (1.0, .squareMegameters, .squareMeters, .squareMegameters, .squareMeters),
            (1.0, .squareCentimeters, .squareMeters, .squareCentimeters, .squareMeters),
            (1.0, .squareMillimeters, .squareMeters, .squareMillimeters, .squareMeters),
            (1.0, .squareMicrometers, .squareMeters, .squareMicrometers, .squareMeters),
            (1.0, .squareNanometers, .squareMeters, .squareNanometers, .squareMeters),
            (1.0, .squareInches, .squareMeters, .squareInches, .squareMeters),
            (1.0, .squareFeet, .squareMeters, .squareFeet, .squareMeters),
            (1.0, .squareYards, .squareMeters, .squareYards, .squareMeters),
            (1.0, .squareMiles, .squareMeters, .squareMiles, .squareMeters),
            (1.0, .ares, .squareMeters, .ares, .squareMeters),
            (1.0, .hectares, .squareMeters, .hectares, .squareMeters)
        ]

        for conversion in areaConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testFuelEfficiencyConversions() {
        let fuelEfficiencyConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitFuelEfficiency, foundationTo: UnitFuelEfficiency)] = [
            (100.0, .litersPer100Kilometers, .milesPerGallon, .litersPer100Kilometers, .milesPerGallon),
            (2.3521458333333, .milesPerGallon, .litersPer100Kilometers, .milesPerGallon, .litersPer100Kilometers),
            (100.0, .milesPerImperialGallon, .litersPer100Kilometers, .milesPerImperialGallon, .litersPer100Kilometers)
        ]

        for conversion in fuelEfficiencyConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testDataConversions() {
        let dataConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitInformationStorage, foundationTo: UnitInformationStorage)] = [
            (1.0, .bytes, .bits, .bytes, .bits),
            (1.0, .bits, .bytes, .bits, .bytes),
            (1.0, .kilobytes, .bytes, .kilobytes, .bytes),
            (1.0, .megabytes, .bytes, .megabytes, .bytes),
            (1.0, .gigabytes, .bytes, .gigabytes, .bytes),
            (1.0, .terabytes, .bytes, .terabytes, .bytes),
            (1.0, .petabytes, .bytes, .petabytes, .bytes),
            (1.0, .exabytes, .bytes, .exabytes, .bytes),
            (1.0, .zettabytes, .bytes, .zettabytes, .bytes),
            (1.0, .yottabytes, .bytes, .yottabytes, .bytes),
            (1.0, .kilobits, .bits, .kilobits, .bits),
            (1.0, .megabits, .bits, .megabits, .bits),
            (1.0, .gigabits, .bits, .gigabits, .bits),
            (1.0, .terabits, .bits, .terabits, .bits),
            (1.0, .petabits, .bits, .petabits, .bits),
            (1.0, .exabits, .bits, .exabits, .bits),
            (1.0, .zettabits, .bits, .zettabits, .bits),
            (1.0, .yottabits, .bits, .yottabits, .bits),
            (1.0, .kibibytes, .bytes, .kibibytes, .bytes),
            (1.0, .mebibytes, .bytes, .mebibytes, .bytes),
            (1.0, .gibibytes, .bytes, .gibibytes, .bytes),
            (1.0, .tebibytes, .bytes, .tebibytes, .bytes),
            (1.0, .pebibytes, .bytes, .pebibytes, .bytes),
            (1.0, .exbibytes, .bytes, .exbibytes, .bytes),
            (1.0, .zebibytes, .bytes, .zebibytes, .bytes),
            (1.0, .yobibytes, .bytes, .yobibytes, .bytes),
            (1.0, .kibibits, .bits, .kibibits, .bits),
            (1.0, .mebibits, .bits, .mebibits, .bits),
            (1.0, .gibibits, .bits, .gibibits, .bits),
            (1.0, .tebibits, .bits, .tebibits, .bits),
            (1.0, .pebibits, .bits, .pebibits, .bits),
            (1.0, .exbibits, .bits, .exbibits, .bits),
            (1.0, .zebibits, .bits, .zebibits, .bits),
            (1.0, .yobibits, .bits, .yobibits, .bits)
        ]

        for conversion in dataConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testElectricChargeCapacityConversions() {
        let electricChargeCapacityConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitElectricCharge, foundationTo: UnitElectricCharge)] = [
            (1.0, .megaampereHours, .ampereHours, .megaampereHours, .ampereHours),
            (1.0, .kiloampereHours, .ampereHours, .kiloampereHours, .ampereHours),
            (1.0, .milliampereHours, .ampereHours, .milliampereHours, .ampereHours),
            (1.0, .microampereHours, .ampereHours, .microampereHours, .ampereHours),
            (1.0, .coulombs, .ampereHours, .coulombs, .ampereHours)
        ]

        for conversion in electricChargeCapacityConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testElectricCurrentConversions() {
        let electricCurrentConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitElectricCurrent, foundationTo: UnitElectricCurrent)] = [
            (1.0, .amperes, .milliamperes, .amperes, .milliamperes),
            (1.0, .megaamperes, .amperes, .megaamperes, .amperes),
            (1.0, .kiloamperes, .amperes, .kiloamperes, .amperes),
            (1.0, .microamperes, .amperes, .microamperes, .amperes)
        ]

        for conversion in electricCurrentConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testElectricPotentialConversions() {
        let electricPotentialConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitElectricPotentialDifference, foundationTo: UnitElectricPotentialDifference)] = [
            (1.0, .volts, .millivolts, .volts, .millivolts),
            (1.0, .megavolts, .volts, .megavolts, .volts),
            (1.0, .kilovolts, .volts, .kilovolts, .volts),
            (1.0, .microvolts, .volts, .microvolts, .volts)
        ]

        for conversion in electricPotentialConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    func testElectricResistanceConversions() {
        let electricResistanceConversions: [(value: Double, from: AUnit, to: AUnit, foundationFrom: UnitElectricResistance, foundationTo: UnitElectricResistance)] = [
            (1.0, .ohms, .milliohms, .ohms, .milliohms),
            (1.0, .megaohms, .ohms, .megaohms, .ohms),
            (1.0, .kiloohms, .ohms, .kiloohms, .ohms),
            (1.0, .microohms, .ohms, .microohms, .ohms)
        ]

        for conversion in electricResistanceConversions {
            let expected = Measurement(value: conversion.value, unit: conversion.foundationFrom).converted(to: conversion.foundationTo).value
            assertConversion(conversion.value, from: conversion.from, to: conversion.to, expected: expected)
        }
    }

    // 添加更多的测试方法以覆盖所有可能的单位类型和转换
}
