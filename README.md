# 🌟 AUnits

AUnits is a Swift library designed for unit conversion and manipulation. It provides a set of utilities to handle various unit-based calculations, including adding, subtracting, multiplying, and dividing quantities with different units.

## ✨ Features

- 🔄 **Unit Conversions:** Convert between different units, such as length, area, volume, speed, temperature, and more.
- ➕ **Basic Arithmetic:** Perform arithmetic operations (addition, subtraction, multiplication, division) between quantities.
- ⚙️ **Flexible Units:** Support for custom units using Swift protocols.
- 📏 **Proportional Units:** Includes a protocol for units that have a proportional relationship (e.g., meters to kilometers).

## 📦 Installation

### 🛠 Swift Package Manager

Add `AUnits` to your `Package.swift` file:

```swift
// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "YourProjectName",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnits.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "YourTargetName", dependencies: ["AUnits"]),
    ]
)
```

## 📝 Usage

### 📐 Basic Quantity Creation

Create a quantity using a specific unit:

```swift
import AUnits

let length = AQuantity(value: 5.0, unit: AULength.meters)
let time = AQuantity(value: 10.0, unit: AUTime.seconds)
```

### 🔄 Unit Conversion

Convert a quantity to a different unit:

```swift
let lengthInKilometers = length.converted(to: .kilometers)
print(lengthInKilometers.value) // Output: 0.005
```

### ➕➖ Arithmetic Operations

Perform arithmetic operations between quantities:

```swift
let length1 = AQuantity(value: 3.0, unit: AULength.meters)
let length2 = AQuantity(value: 200.0, unit: AULength.centimeters)

// Add two quantities
let totalLength = length1.add(length2)
print(totalLength.value) // Output: 5.0 (meters)

// Subtract quantities
let difference = length1.subtract(length2)
print(difference.value) // Output: 1.0 (meters)
```

### ✖️➗ Multiplication and Division

Multiply or divide quantities to obtain new units:

```swift
let speed = length.divided(by: time)
print(speed.unit) // Output: metersPerSecond
print(speed.value) // Output: 0.5 (meters/second)
```

### 📏 Working with Proportional Units

For units that have a proportional relationship, use the `AProportionalUnitProtocol` to facilitate conversions:

```swift
let area = AQuantity(value: 10.0, unit: AUArea.squareMeters)
let length = AQuantity(value: 2.0, unit: AULength.meters)

// Divide to get the length
let derivedLength = area.divided(by: length)
print(derivedLength.value) // Output: 5.0 (meters)
```

## 📚 Supported Units

`AUnits` supports a wide range of units, including but not limited to:

- 📏 **Length:** meters, kilometers, miles, feet, inches, etc.
- 🏞 **Area:** square meters, acres, hectares, square miles, etc.
- 🧴 **Volume:** liters, cubic meters, gallons, quarts, etc.
- 🚀 **Speed:** meters per second, kilometers per hour, miles per hour, etc.
- 🌡 **Temperature:** Celsius, Kelvin, Fahrenheit, etc.
- 🌬 **Pressure:** pascals, bars, atmospheres, etc.
- ⚡️ **Energy:** joules, kilojoules, calories, kilowatt-hours, etc.
- 🔌 **Electricity:** volts, amperes, ohms, etc.

## 🛠 Extending Units

To add a custom unit, create a new type conforming to `AUnitProtocol` or `AProportionalUnitProtocol`. Here's an example:

```swift
public enum CustomUnit: AProportionalUnitProtocol, Identifiable {
    case customUnit1, customUnit2

    public var coefficient: Double {
        switch self {
        case .customUnit1: return 1.0
        case .customUnit2: return 100.0
        }
    }

    public var id: CustomUnit {
        return self
    }

    public static var baseUnit: CustomUnit = .customUnit1
}
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
