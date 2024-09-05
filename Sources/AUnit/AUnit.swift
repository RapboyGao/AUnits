import Foundation

/// Enum representing various units.
/// 表示各种单位的枚举。
public enum AUnit: Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // Speed
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond
    // Pressure
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch
    // Temperature
    case kelvin, celsius, fahrenheit, rankine
    // TemperatureDifference
    case celsiusDelta, fahrenheitDelta
    // Mass
    case metricTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, shortTons, stones, carats, ouncesTroy, slugs
    // Volume
    case liters, quarts, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups
    // Acceleration
    case metersPerSecondSquared, gravity
    // Power
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower
    // Angle
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions
    // Angular Velocity
    case radiansPerSecond, degreesPerSecond, revolutionsPerMinute, revolutionsPerSecond
    // Area
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares
    // Concentration
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion
    // Time
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries
    // ElectricChargeCapacity
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, coulombs
    // ElectricCurrent
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes
    // ElectricPotential
    case megavolts, kilovolts, volts, millivolts, microvolts
    // ElectricResistance
    case megaohms, kiloohms, ohms, milliohms, microohms
    // Energy
    case kilojoules, joules, kilocalories, calories, kilowattHours, wattHours
    // Frequency
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond
    // FuelEfficiency
    case litersPer100Kilometers, milesPerImperialGallon, milesPerGallon
    // Data
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits

    /// The unit type of the unit.
    /// 单位的类型。
    public var unitType: AUnitType {
        switch self {
        case .feet, .nauticalMiles, .meters, .kilometers, .miles, .megameters, .hectometers, .decameters, .decimeters, .centimeters, .millimeters, .micrometers, .nanometers, .picometers, .inches, .yards, .scandinavianMiles, .lightyears, .fathoms, .furlongs, .astronomicalUnits, .parsecs:
            return .length
        case .feetPerSecond, .knots, .kilometersPerHour, .metersPerSecond, .milesPerHour, .feetPerMinute, .inchesPerSecond, .yardsPerSecond:
            return .speed
        case .hectopascals, .inchesOfMercury, .millimetersOfMercury, .newtonsPerMetersSquared, .gigapascals, .megapascals, .kilopascals, .bars, .millibars, .poundsForcePerSquareInch:
            return .pressure
        case .celsius, .fahrenheit, .kelvin, .rankine:
            return .temperature
        case .celsiusDelta, .fahrenheitDelta:
            return .temperatureDifference
        case .kilograms, .grams, .decigrams, .centigrams, .milligrams, .micrograms, .nanograms, .picograms, .ounces, .pounds, .stones, .metricTons, .shortTons, .carats, .ouncesTroy, .slugs, .kilopounds:
            return .mass
        case .liters, .quarts, .cubicMeters, .cubicCentimeters, .gallons, .megaliters, .kiloliters, .deciliters, .centiliters, .milliliters, .cubicKilometers, .cubicDecimeters, .cubicMillimeters, .cubicInches, .cubicFeet, .cubicYards, .cubicMiles, .acreFeet, .bushels, .teaspoons, .tablespoons, .fluidOunces, .cups, .pints, .imperialTeaspoons, .imperialTablespoons, .imperialFluidOunces, .imperialPints, .imperialQuarts, .imperialGallons, .metricCups:
            return .volume
        case .metersPerSecondSquared, .gravity:
            return .acceleration
        case .terawatts, .gigawatts, .megawatts, .kilowatts, .watts, .milliwatts, .microwatts, .nanowatts, .picowatts, .femtowatts, .horsepower:
            return .power
        case .degrees, .arcMinutes, .arcSeconds, .radians, .gradians, .revolutions:
            return .angle
        case .radiansPerSecond, .degreesPerSecond, .revolutionsPerMinute, .revolutionsPerSecond:
            return .angularVelocity
        case .squareMegameters, .squareKilometers, .squareMeters, .squareCentimeters, .squareMillimeters, .squareMicrometers, .squareNanometers, .squareInches, .squareFeet, .squareYards, .squareMiles, .acres, .ares, .hectares:
            return .area
        case .gramsPerLiter, .milligramsPerDeciliter, .partsPerMillion:
            return .concentration
        case .hours, .minutes, .seconds, .milliseconds, .microseconds, .nanoseconds, .picoseconds, .days, .weeks, .years, .decades, .centuries:
            return .time
        case .megaampereHours, .kiloampereHours, .ampereHours, .milliampereHours, .microampereHours, .coulombs:
            return .electricChargeCapacity
        case .megaamperes, .kiloamperes, .amperes, .milliamperes, .microamperes:
            return .electricCurrent
        case .megavolts, .kilovolts, .volts, .millivolts, .microvolts:
            return .electricPotential
        case .megaohms, .kiloohms, .ohms, .milliohms, .microohms:
            return .electricResistance
        case .kilojoules, .joules, .kilocalories, .calories, .kilowattHours, .wattHours:
            return .energy
        case .terahertz, .gigahertz, .megahertz, .kilohertz, .hertz, .millihertz, .microhertz, .nanohertz, .framesPerSecond:
            return .frequency
        case .litersPer100Kilometers, .milesPerImperialGallon, .milesPerGallon:
            return .fuelEfficiency
        case .bytes, .bits, .nibbles, .yottabytes, .zettabytes, .exabytes, .petabytes, .terabytes, .gigabytes, .megabytes, .kilobytes, .yottabits, .zettabits, .exabits, .petabits, .terabits, .gigabits, .megabits, .kilobits, .yobibytes, .zebibytes, .exbibytes, .pebibytes, .tebibytes, .gibibytes, .mebibytes, .kibibytes, .yobibits, .zebibits, .exbibits, .pebibits, .tebibits, .gibibits, .mebibits, .kibibits:
            return .data
        }
    }

    public var id: AUnit { self }

    /// The coefficient for conversion.
    /// 转换系数。
    public var coefficient: Double {
        switch self {
        // Length
        case .feet: return 0.3048
        case .nauticalMiles: return 1852.0
        case .meters: return 1.0
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .megameters: return 1.0e6
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1.0e-6
        case .nanometers: return 1.0e-9
        case .picometers: return 1.0e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 1.0e4
        case .lightyears: return 9.4607304725808e15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 1.495978707e11
        case .parsecs: return 3.0856775814913673e16
        // Speed
        case .knots: return 0.514444
        case .metersPerSecond: return 1.0
        case .feetPerMinute: return 0.00508
        case .kilometersPerHour: return 0.277778
        case .feetPerSecond: return 0.3048
        case .milesPerHour: return 0.44704
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        // Pressure
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3386.389
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1.0e9
        case .megapascals: return 1.0e6
        case .kilopascals: return 1000.0
        case .bars: return 1.0e5
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6894.757
        // Temperature
        case .kelvin, .celsius, .celsiusDelta: return 1.0
        case .fahrenheit, .rankine, .fahrenheitDelta: return 5.0 / 9.0
        // Mass
        case .metricTons: return 1.0e6
        case .shortTons: return 907184.74
        case .kilograms: return 1000.0
        case .kilopounds: return 4.5359237e5
        case .pounds: return 453.59237
        case .ounces: return 28.349523125
        case .grams: return 1.0
        case .decigrams: return 0.1
        case .centigrams: return 0.01
        case .milligrams: return 0.001
        case .micrograms: return 1.0e-6
        case .nanograms: return 1.0e-9
        case .picograms: return 1.0e-12
        case .stones: return 6350.29318
        case .carats: return 0.2
        case .ouncesTroy: return 31.1034768
        case .slugs: return 14593.9029372
        // Volume
        case .liters: return 1.0
        case .quarts: return 0.946352946
        case .cubicMeters: return 1000.0
        case .cubicCentimeters: return 0.001
        case .gallons: return 3.785411784
        case .megaliters: return 1.0e6
        case .kiloliters: return 1000.0
        case .deciliters: return 0.1
        case .centiliters: return 0.01
        case .milliliters: return 0.001
        case .cubicKilometers: return 1.0e12
        case .cubicDecimeters: return 1.0
        case .cubicMillimeters: return 1.0e-6
        case .cubicInches: return 0.016387064
        case .cubicFeet: return 28.316846592
        case .cubicYards: return 764.554857984
        case .cubicMiles: return 4.168181825440579584e12
        case .acreFeet: return 1233481.83754752
        case .bushels: return 35.23907016688
        case .teaspoons: return 0.00492892159375
        case .tablespoons: return 0.01478676478125
        case .fluidOunces: return 0.0295735295625
        case .cups: return 0.24
        case .pints: return 0.473176473
        case .imperialTeaspoons: return 0.00591938802083333
        case .imperialTablespoons: return 0.0177581640625
        case .imperialFluidOunces: return 0.0284130625
        case .imperialPints: return 0.56826125
        case .imperialQuarts: return 1.1365225
        case .imperialGallons: return 4.54609
        case .metricCups: return 0.25
        // Acceleration
        case .metersPerSecondSquared: return 1.0
        case .gravity: return 9.80665
        // Power
        case .terawatts: return 1.0e12
        case .gigawatts: return 1.0e9
        case .megawatts: return 1.0e6
        case .kilowatts: return 1000.0
        case .watts: return 1.0
        case .milliwatts: return 0.001
        case .microwatts: return 1.0e-6
        case .nanowatts: return 1.0e-9
        case .picowatts: return 1.0e-12
        case .femtowatts: return 1.0e-15
        case .horsepower: return 745.69987158227022
        // Angle
        case .degrees: return 1.0
        case .arcMinutes: return 1.0 / 60.0
        case .arcSeconds: return 1.0 / 3600.0
        case .radians: return 57.29577951308232
        case .gradians: return 0.9
        case .revolutions: return 360.0
        // Angular Velocity
        case .radiansPerSecond: return 57.29577951308232
        case .degreesPerSecond: return 1.0
        case .revolutionsPerMinute: return 6.0
        case .revolutionsPerSecond: return 360.0
        // Area
        case .squareMegameters: return 1.0e12
        case .squareKilometers: return 1.0e6
        case .squareMeters: return 1.0
        case .squareCentimeters: return 0.0001
        case .squareMillimeters: return 1.0e-6
        case .squareMicrometers: return 1.0e-12
        case .squareNanometers: return 1.0e-18
        case .squareInches: return 0.00064516
        case .squareFeet: return 0.09290304
        case .squareYards: return 0.83612736
        case .squareMiles: return 2.589988110336e6
        case .acres: return 4046.8564224
        case .ares: return 100.0
        case .hectares: return 10000.0
        // Concentration
        case .gramsPerLiter: return 1.0
        case .milligramsPerDeciliter: return 0.01
        case .partsPerMillion: return 1.0e-6
        // Time
        case .hours: return 3600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1.0e-6
        case .nanoseconds: return 1.0e-9
        case .picoseconds: return 1.0e-12
        case .days: return 86400.0
        case .weeks: return 604800.0
        case .years: return 3.15576e7
        case .decades: return 3.15576e8
        case .centuries: return 3.15576e9
        // ElectricChargeCapacity
        case .megaampereHours: return 3.6e9
        case .kiloampereHours: return 3.6e6
        case .ampereHours: return 3600.0
        case .milliampereHours: return 3.6
        case .microampereHours: return 0.0036
        case .coulombs: return 1.0
        // ElectricCurrent
        case .megaamperes: return 1.0e6
        case .kiloamperes: return 1000.0
        case .amperes: return 1.0
        case .milliamperes: return 0.001
        case .microamperes: return 1.0e-6
        // ElectricPotential
        case .megavolts: return 1.0e6
        case .kilovolts: return 1000.0
        case .volts: return 1.0
        case .millivolts: return 0.001
        case .microvolts: return 1.0e-6
        // ElectricResistance
        case .megaohms: return 1.0e6
        case .kiloohms: return 1000.0
        case .ohms: return 1.0
        case .milliohms: return 0.001
        case .microohms: return 1.0e-6
        // Energy
        case .kilojoules: return 1000.0
        case .joules: return 1.0
        case .kilocalories: return 4184.0
        case .calories: return 4.184
        case .kilowattHours: return 3.6e6
        case .wattHours: return 3600.0
        // Frequency
        case .terahertz: return 1.0e12
        case .gigahertz: return 1.0e9
        case .megahertz: return 1.0e6
        case .kilohertz: return 1000.0
        case .hertz: return 1.0
        case .millihertz: return 0.001
        case .microhertz: return 1.0e-6
        case .nanohertz: return 1.0e-9
        case .framesPerSecond: return 1.0
        // FuelEfficiency （特殊）
        // 注意：100公里多少升、和加仑能跑多少英里时反的
        case .litersPer100Kilometers: return 1.0
        case .milesPerImperialGallon: return 282.4809362796091
        case .milesPerGallon: return 235.2145833333333
        // Data
        case .bytes: return 1.0
        case .bits: return 0.125
        case .nibbles: return 0.5
        case .yottabytes: return 1.0e24
        case .zettabytes: return 1.0e21
        case .exabytes: return 1.0e18
        case .petabytes: return 1.0e15
        case .terabytes: return 1.0e12
        case .gigabytes: return 1.0e9
        case .megabytes: return 1.0e6
        case .kilobytes: return 1000.0
        case .yottabits: return 1.0e24 * 0.125
        case .zettabits: return 1.0e21 * 0.125
        case .exabits: return 1.0e18 * 0.125
        case .petabits: return 1.0e15 * 0.125
        case .terabits: return 1.0e12 * 0.125
        case .gigabits: return 1.0e9 * 0.125
        case .megabits: return 1.0e6 * 0.125
        case .kilobits: return 125.0
        case .yobibytes: return 1.2089258196146292e24
        case .zebibytes: return 1.1805916207174113e21
        case .exbibytes: return 1.152921504606847e18
        case .pebibytes: return 1.125899906842624e15
        case .tebibytes: return 1.099511627776e12
        case .gibibytes: return 1.073741824e9
        case .mebibytes: return 1.048576e6
        case .kibibytes: return 1024.0
        case .yobibits: return 1.2089258196146292e24 * 0.125
        case .zebibits: return 1.1805916207174113e21 * 0.125
        case .exbibits: return 1.152921504606847e18 * 0.125
        case .pebibits: return 1.125899906842624e15 * 0.125
        case .tebibits: return 1.099511627776e12 * 0.125
        case .gibibits: return 1.073741824e9 * 0.125
        case .mebibits: return 1.048576e6 * 0.125
        case .kibibits: return 1024.0 * 0.125
        }
    }

    /// The constant for temperature conversion.
    /// 温度转换的常数。
    public var constant: Double {
        switch self {
        case .celsius: return 273.15
        case .fahrenheit: return 459.67
        default: return 0
        }
    }

    /// The symbol for the unit.
    /// 单位的符号。
    public var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit.
    /// 单位的短名称。
    public var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit.
    /// 单位的全名称。
    public var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit.
    /// 单位的详细介绍。
    public var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// Converts a value from this unit to another unit.
    /// 将值从此单位转换为另一单位。
    /// - Parameters:
    ///   - value: The value to convert.
    ///   - unit: The target unit.
    /// - Returns: The converted value, or nil if conversion is not possible.
    public func convert(value: Double, to unit: AUnit) -> Double? {
        guard self.unitType == unit.unitType else { return nil }
        // Temperature conversion
        if self.unitType == .temperature {
            let valueInKelvin = (value + self.constant) * self.coefficient
            return (valueInKelvin / unit.coefficient) - unit.constant
        }

        // 油效率比较特殊，需要反算
        if self.unitType == .fuelEfficiency {
            if self == .litersPer100Kilometers {
                if unit == .milesPerGallon {
                    return 235.2145833333333 / value
                } else if unit == .milesPerImperialGallon {
                    return 282.4809362796091 / value
                }
            } else if self == .milesPerGallon {
                if unit == .litersPer100Kilometers {
                    return 235.2145833333333 / value
                } else if unit == .milesPerImperialGallon {
                    return (235.2145833333333 / value) * (235.2145833333333 / 282.4809362796091)
                }
            } else if self == .milesPerImperialGallon {
                if unit == .litersPer100Kilometers {
                    return 282.4809362796091 / value
                } else if unit == .milesPerGallon {
                    return (282.4809362796091 / value) * (282.4809362796091 / 235.2145833333333)
                }
            }
        }
        // General conversion
        return (value * self.coefficient) / unit.coefficient
    }
}
