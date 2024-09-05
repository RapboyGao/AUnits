// MARK: - Length

public enum AULength: AProportionalUnitProtocol, Identifiable {
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    public var coefficient: Double {
        switch self {
        case .feet: return 0.3048
        case .nauticalMiles: return 1852.0
        case .meters: return 1.0
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .megameters: return 1000000.0
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1e-06
        case .nanometers: return 1e-09
        case .picometers: return 1e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 10000.0
        case .lightyears: return 9.4607304725808e+15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 149597870700.0
        case .parsecs: return 3.085677581491367e+16
        }
    }

    public var id: AUnit {
        switch self {
        case .feet: return .feet
        case .nauticalMiles: return .nauticalMiles
        case .meters: return .meters
        case .kilometers: return .kilometers
        case .miles: return .miles
        case .megameters: return .megameters
        case .hectometers: return .hectometers
        case .decameters: return .decameters
        case .decimeters: return .decimeters
        case .centimeters: return .centimeters
        case .millimeters: return .millimeters
        case .micrometers: return .micrometers
        case .nanometers: return .nanometers
        case .picometers: return .picometers
        case .inches: return .inches
        case .yards: return .yards
        case .scandinavianMiles: return .scandinavianMiles
        case .lightyears: return .lightyears
        case .fathoms: return .fathoms
        case .furlongs: return .furlongs
        case .astronomicalUnits: return .astronomicalUnits
        case .parsecs: return .parsecs
        }
    }

    public static var baseUnit: AULength = .meters
}

// MARK: - Speed

public enum AUSpeed: AProportionalUnitProtocol, Identifiable {
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond
    public var coefficient: Double {
        switch self {
        case .knots: return 0.514444
        case .metersPerSecond: return 1.0
        case .feetPerMinute: return 0.00508
        case .kilometersPerHour: return 0.277778
        case .feetPerSecond: return 0.3048
        case .milesPerHour: return 0.44704
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        }
    }

    public var id: AUnit {
        switch self {
        case .knots: return .knots
        case .metersPerSecond: return .metersPerSecond
        case .feetPerMinute: return .feetPerMinute
        case .kilometersPerHour: return .kilometersPerHour
        case .feetPerSecond: return .feetPerSecond
        case .milesPerHour: return .milesPerHour
        case .inchesPerSecond: return .inchesPerSecond
        case .yardsPerSecond: return .yardsPerSecond
        }
    }

    public static var baseUnit: AUSpeed = .metersPerSecond
}

// MARK: - Pressure

public enum AUPressure: AProportionalUnitProtocol, Identifiable {
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch
    public var coefficient: Double {
        switch self {
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3386.389
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1000000000.0
        case .megapascals: return 1000000.0
        case .kilopascals: return 1000.0
        case .bars: return 100000.0
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6894.757
        }
    }

    public var id: AUnit {
        switch self {
        case .hectopascals: return .hectopascals
        case .inchesOfMercury: return .inchesOfMercury
        case .millimetersOfMercury: return .millimetersOfMercury
        case .newtonsPerMetersSquared: return .newtonsPerMetersSquared
        case .gigapascals: return .gigapascals
        case .megapascals: return .megapascals
        case .kilopascals: return .kilopascals
        case .bars: return .bars
        case .millibars: return .millibars
        case .poundsForcePerSquareInch: return .poundsForcePerSquareInch
        }
    }

    public static var baseUnit: AUPressure = .newtonsPerMetersSquared
}

// MARK: - TemperatureDifference

public enum AUTemperatureDifference: AProportionalUnitProtocol, Identifiable {
    case celsiusDelta, fahrenheitDelta
    public var coefficient: Double {
        switch self {
        case .celsiusDelta: return 1.0
        case .fahrenheitDelta: return 0.5555555555555556
        }
    }

    public var id: AUnit {
        switch self {
        case .celsiusDelta: return .celsiusDelta
        case .fahrenheitDelta: return .fahrenheitDelta
        }
    }

    public static var baseUnit: AUTemperatureDifference = .celsiusDelta
}

// MARK: - Mass

public enum AUMass: AProportionalUnitProtocol, Identifiable {
    case metricTons, shortTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, stones, carats, ouncesTroy, slugs
    public var coefficient: Double {
        switch self {
        case .metricTons: return 1000000.0
        case .shortTons: return 907184.74
        case .kilograms: return 1000.0
        case .kilopounds: return 453592.37
        case .pounds: return 453.59237
        case .ounces: return 28.349523125
        case .grams: return 1.0
        case .decigrams: return 0.1
        case .centigrams: return 0.01
        case .milligrams: return 0.001
        case .micrograms: return 1e-06
        case .nanograms: return 1e-09
        case .picograms: return 1e-12
        case .stones: return 6350.29318
        case .carats: return 0.2
        case .ouncesTroy: return 31.1034768
        case .slugs: return 14593.9029372
        }
    }

    public var id: AUnit {
        switch self {
        case .metricTons: return .metricTons
        case .shortTons: return .shortTons
        case .kilograms: return .kilograms
        case .kilopounds: return .kilopounds
        case .pounds: return .pounds
        case .ounces: return .ounces
        case .grams: return .grams
        case .decigrams: return .decigrams
        case .centigrams: return .centigrams
        case .milligrams: return .milligrams
        case .micrograms: return .micrograms
        case .nanograms: return .nanograms
        case .picograms: return .picograms
        case .stones: return .stones
        case .carats: return .carats
        case .ouncesTroy: return .ouncesTroy
        case .slugs: return .slugs
        }
    }

    public static var baseUnit: AUMass = .grams
}

// MARK: - Volume

public enum AUVolume: AProportionalUnitProtocol, Identifiable {
    case liters, quarts, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups
    public var coefficient: Double {
        switch self {
        case .liters: return 1.0
        case .quarts: return 0.946352946
        case .cubicMeters: return 1000.0
        case .cubicCentimeters: return 0.001
        case .gallons: return 3.785411784
        case .megaliters: return 1000000.0
        case .kiloliters: return 1000.0
        case .deciliters: return 0.1
        case .centiliters: return 0.01
        case .milliliters: return 0.001
        case .cubicKilometers: return 1000000000000.0
        case .cubicDecimeters: return 1.0
        case .cubicMillimeters: return 1e-06
        case .cubicInches: return 0.016387064
        case .cubicFeet: return 28.316846592
        case .cubicYards: return 764.554857984
        case .cubicMiles: return 4168181825440.5796
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
        }
    }

    public var id: AUnit {
        switch self {
        case .liters: return .liters
        case .quarts: return .quarts
        case .cubicMeters: return .cubicMeters
        case .cubicCentimeters: return .cubicCentimeters
        case .gallons: return .gallons
        case .megaliters: return .megaliters
        case .kiloliters: return .kiloliters
        case .deciliters: return .deciliters
        case .centiliters: return .centiliters
        case .milliliters: return .milliliters
        case .cubicKilometers: return .cubicKilometers
        case .cubicDecimeters: return .cubicDecimeters
        case .cubicMillimeters: return .cubicMillimeters
        case .cubicInches: return .cubicInches
        case .cubicFeet: return .cubicFeet
        case .cubicYards: return .cubicYards
        case .cubicMiles: return .cubicMiles
        case .acreFeet: return .acreFeet
        case .bushels: return .bushels
        case .teaspoons: return .teaspoons
        case .tablespoons: return .tablespoons
        case .fluidOunces: return .fluidOunces
        case .cups: return .cups
        case .pints: return .pints
        case .imperialTeaspoons: return .imperialTeaspoons
        case .imperialTablespoons: return .imperialTablespoons
        case .imperialFluidOunces: return .imperialFluidOunces
        case .imperialPints: return .imperialPints
        case .imperialQuarts: return .imperialQuarts
        case .imperialGallons: return .imperialGallons
        case .metricCups: return .metricCups
        }
    }

    public static var baseUnit: AUVolume = .liters
}

// MARK: - Acceleration

public enum AUAcceleration: AProportionalUnitProtocol, Identifiable {
    case metersPerSecondSquared, gravity
    public var coefficient: Double {
        switch self {
        case .metersPerSecondSquared: return 1.0
        case .gravity: return 9.80665
        }
    }

    public var id: AUnit {
        switch self {
        case .metersPerSecondSquared: return .metersPerSecondSquared
        case .gravity: return .gravity
        }
    }

    public static var baseUnit: AUAcceleration = .metersPerSecondSquared
}

// MARK: - Power

public enum AUPower: AProportionalUnitProtocol, Identifiable {
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower
    public var coefficient: Double {
        switch self {
        case .terawatts: return 1000000000000.0
        case .gigawatts: return 1000000000.0
        case .megawatts: return 1000000.0
        case .kilowatts: return 1000.0
        case .watts: return 1.0
        case .milliwatts: return 0.001
        case .microwatts: return 1e-06
        case .nanowatts: return 1e-09
        case .picowatts: return 1e-12
        case .femtowatts: return 1e-15
        case .horsepower: return 745.6998715822702
        }
    }

    public var id: AUnit {
        switch self {
        case .terawatts: return .terawatts
        case .gigawatts: return .gigawatts
        case .megawatts: return .megawatts
        case .kilowatts: return .kilowatts
        case .watts: return .watts
        case .milliwatts: return .milliwatts
        case .microwatts: return .microwatts
        case .nanowatts: return .nanowatts
        case .picowatts: return .picowatts
        case .femtowatts: return .femtowatts
        case .horsepower: return .horsepower
        }
    }

    public static var baseUnit: AUPower = .watts
}

// MARK: - Angle

public enum AUAngle: AProportionalUnitProtocol, Identifiable {
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions
    public var coefficient: Double {
        switch self {
        case .degrees: return 1.0
        case .arcMinutes: return 0.016666666666666666
        case .arcSeconds: return 0.0002777777777777778
        case .radians: return 57.29577951308232
        case .gradians: return 0.9
        case .revolutions: return 360.0
        }
    }

    public var id: AUnit {
        switch self {
        case .degrees: return .degrees
        case .arcMinutes: return .arcMinutes
        case .arcSeconds: return .arcSeconds
        case .radians: return .radians
        case .gradians: return .gradians
        case .revolutions: return .revolutions
        }
    }

    public static var baseUnit: AUAngle = .degrees
}

// MARK: - AngularVelocity

public enum AUAngularVelocity: AProportionalUnitProtocol, Identifiable {
    case radiansPerSecond, degreesPerSecond, revolutionsPerMinute, revolutionsPerSecond
    public var coefficient: Double {
        switch self {
        case .radiansPerSecond: return 57.29577951308232
        case .degreesPerSecond: return 1.0
        case .revolutionsPerMinute: return 6.0
        case .revolutionsPerSecond: return 360.0
        }
    }

    public var id: AUnit {
        switch self {
        case .radiansPerSecond: return .radiansPerSecond
        case .degreesPerSecond: return .degreesPerSecond
        case .revolutionsPerMinute: return .revolutionsPerMinute
        case .revolutionsPerSecond: return .revolutionsPerSecond
        }
    }

    public static var baseUnit: AUAngularVelocity = .degreesPerSecond
}

// MARK: - Area

public enum AUArea: AProportionalUnitProtocol, Identifiable {
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares
    public var coefficient: Double {
        switch self {
        case .squareMegameters: return 1000000000000.0
        case .squareKilometers: return 1000000.0
        case .squareMeters: return 1.0
        case .squareCentimeters: return 0.0001
        case .squareMillimeters: return 1e-06
        case .squareMicrometers: return 1e-12
        case .squareNanometers: return 1e-18
        case .squareInches: return 0.00064516
        case .squareFeet: return 0.09290304
        case .squareYards: return 0.83612736
        case .squareMiles: return 2589988.110336
        case .acres: return 4046.8564224
        case .ares: return 100.0
        case .hectares: return 10000.0
        }
    }

    public var id: AUnit {
        switch self {
        case .squareMegameters: return .squareMegameters
        case .squareKilometers: return .squareKilometers
        case .squareMeters: return .squareMeters
        case .squareCentimeters: return .squareCentimeters
        case .squareMillimeters: return .squareMillimeters
        case .squareMicrometers: return .squareMicrometers
        case .squareNanometers: return .squareNanometers
        case .squareInches: return .squareInches
        case .squareFeet: return .squareFeet
        case .squareYards: return .squareYards
        case .squareMiles: return .squareMiles
        case .acres: return .acres
        case .ares: return .ares
        case .hectares: return .hectares
        }
    }

    public static var baseUnit: AUArea = .squareMeters
}

// MARK: - Concentration

public enum AUConcentration: AProportionalUnitProtocol, Identifiable {
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion
    public var coefficient: Double {
        switch self {
        case .gramsPerLiter: return 1.0
        case .milligramsPerDeciliter: return 0.01
        case .partsPerMillion: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .gramsPerLiter: return .gramsPerLiter
        case .milligramsPerDeciliter: return .milligramsPerDeciliter
        case .partsPerMillion: return .partsPerMillion
        }
    }

    public static var baseUnit: AUConcentration = .gramsPerLiter
}

// MARK: - Time

public enum AUTime: AProportionalUnitProtocol, Identifiable {
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries
    public var coefficient: Double {
        switch self {
        case .hours: return 3600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1e-06
        case .nanoseconds: return 1e-09
        case .picoseconds: return 1e-12
        case .days: return 86400.0
        case .weeks: return 604800.0
        case .years: return 31557600.0
        case .decades: return 315576000.0
        case .centuries: return 3155760000.0
        }
    }

    public var id: AUnit {
        switch self {
        case .hours: return .hours
        case .minutes: return .minutes
        case .seconds: return .seconds
        case .milliseconds: return .milliseconds
        case .microseconds: return .microseconds
        case .nanoseconds: return .nanoseconds
        case .picoseconds: return .picoseconds
        case .days: return .days
        case .weeks: return .weeks
        case .years: return .years
        case .decades: return .decades
        case .centuries: return .centuries
        }
    }

    public static var baseUnit: AUTime = .seconds
}

// MARK: - ElectricChargeCapacity

public enum AUElectricChargeCapacity: AProportionalUnitProtocol, Identifiable {
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, coulombs
    public var coefficient: Double {
        switch self {
        case .megaampereHours: return 3600000000.0
        case .kiloampereHours: return 3600000.0
        case .ampereHours: return 3600.0
        case .milliampereHours: return 3.6
        case .microampereHours: return 0.0036
        case .coulombs: return 1.0
        }
    }

    public var id: AUnit {
        switch self {
        case .megaampereHours: return .megaampereHours
        case .kiloampereHours: return .kiloampereHours
        case .ampereHours: return .ampereHours
        case .milliampereHours: return .milliampereHours
        case .microampereHours: return .microampereHours
        case .coulombs: return .coulombs
        }
    }

    public static var baseUnit: AUElectricChargeCapacity = .coulombs
}

// MARK: - ElectricCurrent

public enum AUElectricCurrent: AProportionalUnitProtocol, Identifiable {
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes
    public var coefficient: Double {
        switch self {
        case .megaamperes: return 1000000.0
        case .kiloamperes: return 1000.0
        case .amperes: return 1.0
        case .milliamperes: return 0.001
        case .microamperes: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .megaamperes: return .megaamperes
        case .kiloamperes: return .kiloamperes
        case .amperes: return .amperes
        case .milliamperes: return .milliamperes
        case .microamperes: return .microamperes
        }
    }

    public static var baseUnit: AUElectricCurrent = .amperes
}

// MARK: - ElectricPotential

public enum AUElectricPotential: AProportionalUnitProtocol, Identifiable {
    case megavolts, kilovolts, volts, millivolts, microvolts
    public var coefficient: Double {
        switch self {
        case .megavolts: return 1000000.0
        case .kilovolts: return 1000.0
        case .volts: return 1.0
        case .millivolts: return 0.001
        case .microvolts: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .megavolts: return .megavolts
        case .kilovolts: return .kilovolts
        case .volts: return .volts
        case .millivolts: return .millivolts
        case .microvolts: return .microvolts
        }
    }

    public static var baseUnit: AUElectricPotential = .volts
}

// MARK: - ElectricResistance

public enum AUElectricResistance: AProportionalUnitProtocol, Identifiable {
    case megaohms, kiloohms, ohms, milliohms, microohms
    public var coefficient: Double {
        switch self {
        case .megaohms: return 1000000.0
        case .kiloohms: return 1000.0
        case .ohms: return 1.0
        case .milliohms: return 0.001
        case .microohms: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .megaohms: return .megaohms
        case .kiloohms: return .kiloohms
        case .ohms: return .ohms
        case .milliohms: return .milliohms
        case .microohms: return .microohms
        }
    }

    public static var baseUnit: AUElectricResistance = .ohms
}

// MARK: - Energy

public enum AUEnergy: AProportionalUnitProtocol, Identifiable {
    case kilojoules, joules, kilocalories, calories, kilowattHours, wattHours
    public var coefficient: Double {
        switch self {
        case .kilojoules: return 1000.0
        case .joules: return 1.0
        case .kilocalories: return 4184.0
        case .calories: return 4.184
        case .kilowattHours: return 3600000.0
        case .wattHours: return 3600.0
        }
    }

    public var id: AUnit {
        switch self {
        case .kilojoules: return .kilojoules
        case .joules: return .joules
        case .kilocalories: return .kilocalories
        case .calories: return .calories
        case .kilowattHours: return .kilowattHours
        case .wattHours: return .wattHours
        }
    }

    public static var baseUnit: AUEnergy = .joules
}

// MARK: - Frequency

public enum AUFrequency: AProportionalUnitProtocol, Identifiable {
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond
    public var coefficient: Double {
        switch self {
        case .terahertz: return 1000000000000.0
        case .gigahertz: return 1000000000.0
        case .megahertz: return 1000000.0
        case .kilohertz: return 1000.0
        case .hertz: return 1.0
        case .millihertz: return 0.001
        case .microhertz: return 1e-06
        case .nanohertz: return 1e-09
        case .framesPerSecond: return 1.0
        }
    }

    public var id: AUnit {
        switch self {
        case .terahertz: return .terahertz
        case .gigahertz: return .gigahertz
        case .megahertz: return .megahertz
        case .kilohertz: return .kilohertz
        case .hertz: return .hertz
        case .millihertz: return .millihertz
        case .microhertz: return .microhertz
        case .nanohertz: return .nanohertz
        case .framesPerSecond: return .framesPerSecond
        }
    }

    public static var baseUnit: AUFrequency = .hertz
}

// MARK: - Data

public enum AUData: AProportionalUnitProtocol, Identifiable {
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits
    public var coefficient: Double {
        switch self {
        case .bytes: return 1.0
        case .bits: return 0.125
        case .nibbles: return 0.5
        case .yottabytes: return 1e+24
        case .zettabytes: return 1e+21
        case .exabytes: return 1e+18
        case .petabytes: return 1000000000000000.0
        case .terabytes: return 1000000000000.0
        case .gigabytes: return 1000000000.0
        case .megabytes: return 1000000.0
        case .kilobytes: return 1000.0
        case .yottabits: return 1.25e+23
        case .zettabits: return 1.25e+20
        case .exabits: return 1.25e+17
        case .petabits: return 125000000000000.0
        case .terabits: return 125000000000.0
        case .gigabits: return 125000000.0
        case .megabits: return 125000.0
        case .kilobits: return 125.0
        case .yobibytes: return 1.2089258196146292e+24
        case .zebibytes: return 1.1805916207174113e+21
        case .exbibytes: return 1.152921504606847e+18
        case .pebibytes: return 1125899906842624.0
        case .tebibytes: return 1099511627776.0
        case .gibibytes: return 1073741824.0
        case .mebibytes: return 1048576.0
        case .kibibytes: return 1024.0
        case .yobibits: return 1.5111572745182865e+23
        case .zebibits: return 1.4757395258967641e+20
        case .exbibits: return 1.4411518807585587e+17
        case .pebibits: return 140737488355328.0
        case .tebibits: return 137438953472.0
        case .gibibits: return 134217728.0
        case .mebibits: return 131072.0
        case .kibibits: return 128.0
        }
    }

    public var id: AUnit {
        switch self {
        case .bytes: return .bytes
        case .bits: return .bits
        case .nibbles: return .nibbles
        case .yottabytes: return .yottabytes
        case .zettabytes: return .zettabytes
        case .exabytes: return .exabytes
        case .petabytes: return .petabytes
        case .terabytes: return .terabytes
        case .gigabytes: return .gigabytes
        case .megabytes: return .megabytes
        case .kilobytes: return .kilobytes
        case .yottabits: return .yottabits
        case .zettabits: return .zettabits
        case .exabits: return .exabits
        case .petabits: return .petabits
        case .terabits: return .terabits
        case .gigabits: return .gigabits
        case .megabits: return .megabits
        case .kilobits: return .kilobits
        case .yobibytes: return .yobibytes
        case .zebibytes: return .zebibytes
        case .exbibytes: return .exbibytes
        case .pebibytes: return .pebibytes
        case .tebibytes: return .tebibytes
        case .gibibytes: return .gibibytes
        case .mebibytes: return .mebibytes
        case .kibibytes: return .kibibytes
        case .yobibits: return .yobibits
        case .zebibits: return .zebibits
        case .exbibits: return .exbibits
        case .pebibits: return .pebibits
        case .tebibits: return .tebibits
        case .gibibits: return .gibibits
        case .mebibits: return .mebibits
        case .kibibits: return .kibibits
        }
    }

    public static var baseUnit: AUData = .bytes
}
