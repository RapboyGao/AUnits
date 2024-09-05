import Foundation
import SwiftUI

/// Constant value for Pi (π)
private let pi = 3.14159265358979323846264338327950288419716939937510
/// Constant value for 2π, representing the circumference of a circle
private let twoPi = 6.28318530717958647692528676655900576839433879875020

/// Structure representing an angle, conforming to AQuantityProtocol, Comparable, and AdditiveArithmetic protocols
public struct AAngle: AQuantityProtocol, Comparable, AdditiveArithmetic, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    /// The numeric value of the angle
    public var value: Double
    /// The unit of the angle (e.g., degrees or radians)
    public var unit: AUAngle

    /// Initializes an angle with a value and unit
    /// - Parameters:
    ///   - value: The numeric value of the angle
    ///   - unit: The unit of the angle
    public init(value: Double, unit: AUAngle) {
        self.value = value
        self.unit = unit
    }

    /// Creates an angle in degrees
    /// - Parameter value: The value in degrees
    /// - Returns: An instance of AAngle
    public static func degrees(_ value: Double) -> Self {
        .init(value: value, unit: .degrees)
    }

    /// Creates an angle in radians
    /// - Parameter value: The value in radians
    /// - Returns: An instance of AAngle
    public static func radians(_ value: Double) -> Self {
        .init(value: value, unit: .radians)
    }
}

public extension AAngle {
    /// Converts the angle to radians
    /// - Returns: The value of the angle in radians
    private var radians: Double {
        let newQuantity = converted(to: .radians)
        return newQuantity.value
    }

    /// Zero angle constant
    static var zero: AAngle = .init(value: 0, unit: .radians)

    /// Calculates the cosine of the angle
    /// - Returns: The cosine value
    func cos() -> Double {
        Darwin.cos(radians)
    }

    /// Calculates the sine of the angle
    /// - Returns: The sine value
    func sin() -> Double {
        Darwin.sin(radians)
    }

    /// Calculates the tangent of the angle
    /// - Returns: The tangent value
    func tan() -> Double {
        Darwin.tan(radians)
    }

    /// Calculates the hyperbolic sine of the angle
    /// - Returns: The hyperbolic sine value
    func sinh() -> Double {
        Darwin.sinh(radians)
    }

    /// Calculates the hyperbolic cosine of the angle
    /// - Returns: The hyperbolic cosine value
    func cosh() -> Double {
        Darwin.cosh(radians)
    }

    /// Calculates the hyperbolic tangent of the angle
    /// - Returns: The hyperbolic tangent value
    func tanh() -> Double {
        Darwin.tanh(radians)
    }

    /// Adds two angles
    /// - Parameters:
    ///   - left: The left-hand angle
    ///   - right: The right-hand angle
    /// - Returns: The sum of the two angles
    static func + (left: Self, right: Self) -> Self {
        Self(value: left.radians + right.radians, unit: .radians)
    }

    /// Subtracts one angle from another
    /// - Parameters:
    ///   - left: The left-hand angle
    ///   - right: The right-hand angle
    /// - Returns: The difference between the two angles
    static func - (left: Self, right: Self) -> Self {
        Self(value: left.radians - right.radians, unit: .radians)
    }

    /// Compares two angles
    /// - Parameters:
    ///   - left: The left-hand angle
    ///   - right: The right-hand angle
    /// - Returns: True if the left-hand angle is smaller than the right-hand angle
    static func < (left: Self, right: Self) -> Bool {
        left.radians < right.radians
    }

    /// Calculates the arccosine of a value
    /// - Parameter value: The input value
    /// - Returns: The corresponding angle
    static func aCos(_ value: Double) -> Self {
        Self(value: Darwin.acos(value), unit: .radians)
    }

    /// Calculates the arcsine of a value
    /// - Parameter value: The input value
    /// - Returns: The corresponding angle
    static func aSin(_ value: Double) -> Self {
        Self(value: Darwin.asin(value), unit: .radians)
    }

    /// Calculates the arctangent of a value
    /// - Parameter value: The input value
    /// - Returns: The corresponding angle
    static func aTan(_ value: Double) -> Self {
        Self(value: Darwin.atan(value), unit: .radians)
    }

    /// Normalizes the angle to the [0, 2π) range
    /// - Returns: The normalized angle
    func in360() -> Self {
        guard value.isNormal else {
            return self
        }
        var result = converted(to: .radians)
        let scale = (result.value / twoPi).rounded(.down)
        result.value -= scale * twoPi
        return result
    }

    /// Normalizes the angle to the [-π, π) or (-π, π] range
    /// - Parameter include180: Whether to include π in the range
    /// - Returns: The normalized angle
    func in180(include180: Bool) -> AAngle {
        guard value.isNormal else {
            return self
        }
        var result = converted(to: .radians)
        let scale = (result.value / twoPi).rounded(.down)
        if include180 {
            if result.value > pi {
                result.value -= twoPi
            }
        } else {
            if result.value >= pi {
                result.value -= twoPi
            }
        }
        return result
    }

    /// Normalizes the angle to the [-π, π] range and takes the absolute value
    /// - Returns: The normalized and absolute value of the angle
    func in180ThenAbs() -> AAngle {
        let value = in180(include180: true)
            .radians
        return .init(value: abs(value), unit: .radians)
    }

    /// Normalizes the angle to the (-2π, 0] range
    /// - Returns: The normalized angle
    func inM360() -> AAngle {
        guard value.isNormal else {
            return self
        }
        var result = converted(to: .radians)
        let scale = (result.value / twoPi).rounded(.up)
        result.value -= scale * twoPi
        return result
    }

    /// Initializes the angle with a float literal
    init(floatLiteral value: Double) {
        self.value = value
        self.unit = .degrees
    }

    /// Initializes the angle with an integer literal
    init(integerLiteral value: Int) {
        self.value = Double(value)
        self.unit = .degrees
    }

    func isNormalOrZero() -> Bool {
        return value.isNormal || value.isZero
    }

    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    func toAngle() -> Angle {
        switch unit {
        case .degrees:
            return .degrees(value)
        case .radians:
            return .radians(value)
        case .arcMinutes, .arcSeconds, .gradians, .revolutions:
            return .radians(radians)
        }
    }
}
