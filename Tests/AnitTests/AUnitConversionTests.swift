@testable import AUnit
import XCTest

final class AUnitConversionTests: XCTestCase {
    let epsilon = 1e-10 // 设定容忍度，增加精度

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

    func testLengthConversions() {
        assertConversion(1.0, from: .feet, to: .meters, expected: 0.3048) // 英尺到米
        assertConversion(1.0, from: .nauticalMiles, to: .meters, expected: 1852.0) // 海里到米
        assertConversion(1.0, from: .kilometers, to: .meters, expected: 1000.0) // 千米到米
        assertConversion(1.0, from: .miles, to: .meters, expected: 1609.344) // 英里到米
        assertConversion(1.0, from: .inches, to: .meters, expected: 0.0254) // 英寸到米
        assertConversion(1.0, from: .yards, to: .meters, expected: 0.9144) // 码到米
        assertConversion(1.0, from: .scandinavianMiles, to: .meters, expected: 10000.0) // 斯堪的纳维亚里到米
        assertConversion(1.0, from: .lightyears, to: .meters, expected: 9.4607304725808e15) // 光年到米
        assertConversion(1.0, from: .fathoms, to: .meters, expected: 1.8288) // 英寻到米
        assertConversion(1.0, from: .furlongs, to: .meters, expected: 201.168) // 弗隆到米
        assertConversion(1.0, from: .astronomicalUnits, to: .meters, expected: 1.495978707e11) // 天文单位到米
        assertConversion(1.0, from: .parsecs, to: .meters, expected: 3.0856775814913673e16) // 秒差距到米
        // 添加更多长度单位测试
    }

    func testSpeedConversions() {
        assertConversion(1.0, from: .knots, to: .metersPerSecond, expected: 0.514444) // 节到米每秒
        assertConversion(1.0, from: .milesPerHour, to: .metersPerSecond, expected: 0.44704) // 英里每小时到米每秒
        assertConversion(1.0, from: .kilometersPerHour, to: .metersPerSecond, expected: 0.277778) // 千米每小时到米每秒
        assertConversion(1.0, from: .feetPerMinute, to: .metersPerSecond, expected: 0.00508) // 英尺每分钟到米每秒
        assertConversion(1.0, from: .feetPerSecond, to: .metersPerSecond, expected: 0.3048) // 英尺每秒到米每秒
        assertConversion(1.0, from: .inchesPerSecond, to: .metersPerSecond, expected: 0.0254) // 英寸每秒到米每秒
        assertConversion(1.0, from: .yardsPerSecond, to: .metersPerSecond, expected: 0.9144) // 码每秒到米每秒
        // 添加更多速度单位测试
    }

    func testPressureConversions() {
        assertConversion(1.0, from: .hectopascals, to: .newtonsPerMetersSquared, expected: 100.0) // 百帕到牛顿每平方米
        assertConversion(1.0, from: .inchesOfMercury, to: .newtonsPerMetersSquared, expected: 3386.389) // 英寸汞柱到牛顿每平方米
        assertConversion(1.0, from: .millimetersOfMercury, to: .newtonsPerMetersSquared, expected: 133.322) // 毫米汞柱到牛顿每平方米
        assertConversion(1.0, from: .gigapascals, to: .newtonsPerMetersSquared, expected: 1.0e9) // 吉帕到牛顿每平方米
        assertConversion(1.0, from: .megapascals, to: .newtonsPerMetersSquared, expected: 1.0e6) // 兆帕到牛顿每平方米
        assertConversion(1.0, from: .kilopascals, to: .newtonsPerMetersSquared, expected: 1000.0) // 千帕到牛顿每平方米
        assertConversion(1.0, from: .bars, to: .newtonsPerMetersSquared, expected: 1.0e5) // 巴到牛顿每平方米
        assertConversion(1.0, from: .millibars, to: .newtonsPerMetersSquared, expected: 100.0) // 毫巴到牛顿每平方米
        assertConversion(1.0, from: .poundsForcePerSquareInch, to: .newtonsPerMetersSquared, expected: 6894.757) // 磅力每平方英寸到牛顿每平方米
        // 添加更多压力单位测试
    }

    func testTemperatureConversions() {
        assertConversion(0.0, from: .celsius, to: .kelvin, expected: 273.15) // 摄氏度到开尔文
        assertConversion(0.0, from: .fahrenheit, to: .kelvin, expected: 255.37222222222223) // 华氏度到开尔文
        assertConversion(0.0, from: .rankine, to: .kelvin, expected: 0.0) // 兰氏度到开尔文
        assertConversion(1.0, from: .celsiusDelta, to: .fahrenheitDelta, expected: 1.8) // 摄氏度差到华氏度差
        // 添加更多温度单位测试
    }

    func testMassConversions() {
        assertConversion(1.0, from: .kilograms, to: .grams, expected: 1000.0) // 千克到克
        assertConversion(1.0, from: .pounds, to: .grams, expected: 453.59237) // 磅到克
        assertConversion(1.0, from: .ounces, to: .grams, expected: 28.349523125) // 盎司到克
        assertConversion(1.0, from: .metricTons, to: .grams, expected: 1.0e6) // 公吨到克
        assertConversion(1.0, from: .shortTons, to: .grams, expected: 907184.74) // 短吨到克
        assertConversion(1.0, from: .decigrams, to: .grams, expected: 0.1) // 分克到克
        assertConversion(1.0, from: .centigrams, to: .grams, expected: 0.01) // 厘克到克
        assertConversion(1.0, from: .milligrams, to: .grams, expected: 0.001) // 毫克到克
        assertConversion(1.0, from: .micrograms, to: .grams, expected: 1.0e-6) // 微克到克
        assertConversion(1.0, from: .nanograms, to: .grams, expected: 1.0e-9) // 纳克到克
        assertConversion(1.0, from: .picograms, to: .grams, expected: 1.0e-12) // 皮克到克
        assertConversion(1.0, from: .stones, to: .grams, expected: 6350.29318) // 英石到克
        assertConversion(1.0, from: .carats, to: .grams, expected: 0.2) // 克拉到克
        assertConversion(1.0, from: .ouncesTroy, to: .grams, expected: 31.1034768) // 金衡盎司到克
        assertConversion(1.0, from: .slugs, to: .grams, expected: 14593.9029372) // 斯拉格到克
        // 添加更多质量单位测试
    }

    func testVolumeConversions() {
        assertConversion(1.0, from: .liters, to: .cubicMeters, expected: 0.001) // 升到立方米
        assertConversion(1.0, from: .gallons, to: .liters, expected: 3.785411784) // 加仑到升
        assertConversion(1.0, from: .cubicFeet, to: .cubicMeters, expected: 0.028316846592) // 立方英尺到立方米
        assertConversion(1.0, from: .quarts, to: .liters, expected: 0.946352946) // 夸脱到升
        assertConversion(1.0, from: .megaliters, to: .liters, expected: 1.0e6) // 兆升到升
        assertConversion(1.0, from: .kiloliters, to: .liters, expected: 1000.0) // 千升到升
        assertConversion(1.0, from: .deciliters, to: .liters, expected: 0.1) // 分升到升
        assertConversion(1.0, from: .centiliters, to: .liters, expected: 0.01) // 厘升到升
        assertConversion(1.0, from: .milliliters, to: .liters, expected: 0.001) // 毫升到升
        assertConversion(1.0, from: .cubicKilometers, to: .liters, expected: 1.0e12) // 立方千米到升
        assertConversion(1.0, from: .cubicCentimeters, to: .liters, expected: 0.001) // 立方厘米到升
        assertConversion(1.0, from: .cubicMillimeters, to: .liters, expected: 1.0e-6) // 立方毫米到升
        assertConversion(1.0, from: .cubicInches, to: .liters, expected: 0.016387064) // 立方英寸到升
        assertConversion(1.0, from: .cubicYards, to: .liters, expected: 764.554857984) // 立方码到升
        assertConversion(1.0, from: .cubicMiles, to: .liters, expected: 4.168181825440579584e12) // 立方英里到升
        assertConversion(1.0, from: .acreFeet, to: .liters, expected: 1233481.83754752) // 英亩英尺到升
        assertConversion(1.0, from: .bushels, to: .liters, expected: 35.23907016688) // 蒲式耳到升
        assertConversion(1.0, from: .teaspoons, to: .liters, expected: 0.00492892159375) // 茶匙到升
        assertConversion(1.0, from: .tablespoons, to: .liters, expected: 0.01478676478125) // 汤匙到升
        assertConversion(1.0, from: .fluidOunces, to: .liters, expected: 0.0295735295625) // 液体盎司到升
        assertConversion(1.0, from: .cups, to: .liters, expected: 0.24) // 杯到升
        assertConversion(1.0, from: .pints, to: .liters, expected: 0.473176473) // 品脱到升
        assertConversion(1.0, from: .imperialTeaspoons, to: .liters, expected: 0.00591938802083333) // 英制茶匙到升
        assertConversion(1.0, from: .imperialTablespoons, to: .liters, expected: 0.0177581640625) // 英制汤匙到升
        assertConversion(1.0, from: .imperialFluidOunces, to: .liters, expected: 0.0284130625) // 英制液体盎司到升
        assertConversion(1.0, from: .imperialPints, to: .liters, expected: 0.56826125) // 英制品脱到升
        assertConversion(1.0, from: .imperialQuarts, to: .liters, expected: 1.1365225) // 英制夸脱到升
        assertConversion(1.0, from: .imperialGallons, to: .liters, expected: 4.54609) // 英制加仑到升
        assertConversion(1.0, from: .metricCups, to: .liters, expected: 0.25) // 公制杯到升
        // 添加更多体积单位测试
    }

    func testAccelerationConversions() {
        assertConversion(1.0, from: .metersPerSecondSquared, to: .gravity, expected: 0.10197162129779283) // 米每二次方秒到重力加速度
        // 添加更多加速度单位测试
    }

    func testPowerConversions() {
        assertConversion(1.0, from: .kilowatts, to: .watts, expected: 1000.0) // 千瓦到瓦
        assertConversion(1.0, from: .horsepower, to: .watts, expected: 745.69987158227022) // 马力到瓦
        assertConversion(1.0, from: .terawatts, to: .watts, expected: 1.0e12) // 太瓦到瓦
        assertConversion(1.0, from: .gigawatts, to: .watts, expected: 1.0e9) // 吉瓦到瓦
        assertConversion(1.0, from: .megawatts, to: .watts, expected: 1.0e6) // 兆瓦到瓦
        assertConversion(1.0, from: .milliwatts, to: .watts, expected: 0.001) // 毫瓦到瓦
        assertConversion(1.0, from: .microwatts, to: .watts, expected: 1.0e-6) // 微瓦到瓦
        assertConversion(1.0, from: .nanowatts, to: .watts, expected: 1.0e-9) // 纳瓦到瓦
        assertConversion(1.0, from: .picowatts, to: .watts, expected: 1.0e-12) // 皮瓦到瓦
        assertConversion(1.0, from: .femtowatts, to: .watts, expected: 1.0e-15) // 飞瓦到瓦
        // 添加更多功率单位测试
    }

    func testAngleConversions() {
        assertConversion(1.0, from: .degrees, to: .radians, expected: 0.017453292519943295) // 度到弧度
        assertConversion(1.0, from: .revolutions, to: .degrees, expected: 360.0) // 周到度
        assertConversion(1.0, from: .arcMinutes, to: .degrees, expected: 1.0 / 60.0) // 角分到度
        assertConversion(1.0, from: .arcSeconds, to: .degrees, expected: 1.0 / 3600.0) // 角秒到度
        assertConversion(1.0, from: .gradians, to: .degrees, expected: 0.9) // 刻度到度
        // 添加更多角度单位测试
    }

    func testAngularVelocityConversions() {
        assertConversion(1.0, from: .radiansPerSecond, to: .degreesPerSecond, expected: 57.29577951308232) // 弧度每秒到度每秒
        assertConversion(1.0, from: .revolutionsPerMinute, to: .degreesPerSecond, expected: 6.0) // 转每分钟到度每秒
        assertConversion(1.0, from: .revolutionsPerSecond, to: .degreesPerSecond, expected: 360.0) // 转每秒到度每秒
        // 添加更多角速度单位测试
    }

    func testAreaConversions() {
        assertConversion(1.0, from: .squareKilometers, to: .squareMeters, expected: 1.0e6) // 平方千米到平方米
        assertConversion(1.0, from: .acres, to: .squareMeters, expected: 4046.8564224) // 英亩到平方米
        assertConversion(1.0, from: .squareMegameters, to: .squareMeters, expected: 1.0e12) // 平方兆米到平方米
        assertConversion(1.0, from: .squareCentimeters, to: .squareMeters, expected: 0.0001) // 平方厘米到平方米
        assertConversion(1.0, from: .squareMillimeters, to: .squareMeters, expected: 1.0e-6) // 平方毫米到平方米
        assertConversion(1.0, from: .squareMicrometers, to: .squareMeters, expected: 1.0e-12) // 平方微米到平方米
        assertConversion(1.0, from: .squareNanometers, to: .squareMeters, expected: 1.0e-18) // 平方纳米到平方米
        assertConversion(1.0, from: .squareInches, to: .squareMeters, expected: 0.00064516) // 平方英寸到平方米
        assertConversion(1.0, from: .squareFeet, to: .squareMeters, expected: 0.09290304) // 平方英尺到平方米
        assertConversion(1.0, from: .squareYards, to: .squareMeters, expected: 0.83612736) // 平方码到平方米
        assertConversion(1.0, from: .squareMiles, to: .squareMeters, expected: 2.589988110336e6) // 平方英里到平方米
        assertConversion(1.0, from: .ares, to: .squareMeters, expected: 100.0) // 公亩到平方米
        assertConversion(1.0, from: .hectares, to: .squareMeters, expected: 10000.0) // 公顷到平方米
        // 添加更多面积单位测试
    }

    func testConcentrationConversions() {
        assertConversion(1.0, from: .gramsPerLiter, to: .milligramsPerDeciliter, expected: 100.0) // 克每升到毫克每分升
        assertConversion(1.0, from: .partsPerMillion, to: .gramsPerLiter, expected: 1.0e-6) // 百万分之一到克每升
        // 添加更多浓度单位测试
    }

    func testTimeConversions() {
        assertConversion(1.0, from: .hours, to: .seconds, expected: 3600.0) // 小时到秒
        assertConversion(1.0, from: .minutes, to: .seconds, expected: 60.0) // 分钟到秒
        assertConversion(1.0, from: .milliseconds, to: .seconds, expected: 0.001) // 毫秒到秒
        assertConversion(1.0, from: .microseconds, to: .seconds, expected: 1.0e-6) // 微秒到秒
        assertConversion(1.0, from: .nanoseconds, to: .seconds, expected: 1.0e-9) // 纳秒到秒
        assertConversion(1.0, from: .picoseconds, to: .seconds, expected: 1.0e-12) // 皮秒到秒
        assertConversion(1.0, from: .days, to: .seconds, expected: 86400.0) // 天到秒
        assertConversion(1.0, from: .weeks, to: .seconds, expected: 604800.0) // 周到秒
        assertConversion(1.0, from: .years, to: .seconds, expected: 3.15576e7) // 年到秒
        assertConversion(1.0, from: .decades, to: .seconds, expected: 3.15576e8) // 十年到秒
        assertConversion(1.0, from: .centuries, to: .seconds, expected: 3.15576e9) // 百年到秒
        // 添加更多时间单位测试
    }

    func testElectricChargeCapacityConversions() {
        assertConversion(1.0, from: .megaampereHours, to: .ampereHours, expected: 1.0e6) // 兆安时到安时
        assertConversion(1.0, from: .kiloampereHours, to: .ampereHours, expected: 1000.0) // 千安时到安时
        assertConversion(1.0, from: .milliampereHours, to: .ampereHours, expected: 0.001) // 毫安时到安时
        assertConversion(1.0, from: .microampereHours, to: .ampereHours, expected: 1.0e-6) // 微安时到安时
        assertConversion(1.0, from: .coulombs, to: .ampereHours, expected: 1.0 / 3600.0) // 安秒到安时
        assertConversion(1.0, from: .ampereHours, to: .ampereHours, expected: 1.0) // 安时到安时
        // 添加更多电荷容量单位测试
    }

    func testElectricCurrentConversions() {
        assertConversion(1.0, from: .amperes, to: .milliamperes, expected: 1000.0) // 安到毫安
        assertConversion(1.0, from: .megaamperes, to: .amperes, expected: 1.0e6) // 兆安到安
        assertConversion(1.0, from: .kiloamperes, to: .amperes, expected: 1000.0) // 千安到安
        assertConversion(1.0, from: .microamperes, to: .amperes, expected: 1.0e-6) // 微安到安
        // 添加更多电流单位测试
    }

    func testElectricPotentialConversions() {
        assertConversion(1.0, from: .volts, to: .millivolts, expected: 1000.0) // 伏到毫伏
        assertConversion(1.0, from: .megavolts, to: .volts, expected: 1.0e6) // 兆伏到伏
        assertConversion(1.0, from: .kilovolts, to: .volts, expected: 1000.0) // 千伏到伏
        assertConversion(1.0, from: .microvolts, to: .volts, expected: 1.0e-6) // 微伏到伏
        // 添加更多电势单位测试
    }

    func testElectricResistanceConversions() {
        assertConversion(1.0, from: .ohms, to: .milliohms, expected: 1000.0) // 欧姆到毫欧姆
        assertConversion(1.0, from: .megaohms, to: .ohms, expected: 1.0e6) // 兆欧姆到欧姆
        assertConversion(1.0, from: .kiloohms, to: .ohms, expected: 1000.0) // 千欧姆到欧姆
        assertConversion(1.0, from: .microohms, to: .ohms, expected: 1.0e-6) // 微欧姆到欧姆
        // 添加更多电阻单位测试
    }

    func testEnergyConversions() {
        assertConversion(1.0, from: .joules, to: .kilojoules, expected: 0.001) // 焦耳到千焦耳
        assertConversion(1.0, from: .kilocalories, to: .joules, expected: 4184.0) // 千卡到焦耳
        assertConversion(1.0, from: .kilowattHours, to: .joules, expected: 3.6e6) // 千瓦时到焦耳
        assertConversion(1.0, from: .wattHours, to: .joules, expected: 3600.0) // 瓦时到焦耳
        assertConversion(1.0, from: .calories, to: .joules, expected: 4.184) // 卡路里到焦耳
        // 添加更多能量单位测试
    }

    func testFrequencyConversions() {
        assertConversion(1.0, from: .hertz, to: .kilohertz, expected: 0.001) // 赫兹到千赫兹
        assertConversion(1.0, from: .terahertz, to: .hertz, expected: 1.0e12) // 太赫兹到赫兹
        assertConversion(1.0, from: .gigahertz, to: .hertz, expected: 1.0e9) // 吉赫兹到赫兹
        assertConversion(1.0, from: .megahertz, to: .hertz, expected: 1.0e6) // 兆赫兹到赫兹
        assertConversion(1.0, from: .millihertz, to: .hertz, expected: 0.001) // 毫赫兹到赫兹
        assertConversion(1.0, from: .microhertz, to: .hertz, expected: 1.0e-6) // 微赫兹到赫兹
        assertConversion(1.0, from: .nanohertz, to: .hertz, expected: 1.0e-9) // 纳赫兹到赫兹
        assertConversion(1.0, from: .framesPerSecond, to: .hertz, expected: 1.0) // 帧每秒到赫兹
        // 添加更多频率单位测试
    }

    func testFuelEfficiencyConversions() {
        // 测试从每百公里升到英里每加仑的转换
        assertConversion(100.0, from: .litersPer100Kilometers, to: .milesPerGallon, expected: 2.3521458333333)

        // 测试从英里每加仑到每百公里升的转换
        assertConversion(2.3521458333333, from: .milesPerGallon, to: .litersPer100Kilometers, expected: 100.0)

        // 测试从英里每英制加仑到每百公里升的转换
        assertConversion(100.0, from: .milesPerImperialGallon, to: .litersPer100Kilometers, expected: 2.8248093627961)
    }
}
