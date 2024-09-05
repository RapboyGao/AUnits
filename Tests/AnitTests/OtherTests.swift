@testable import AUnitStrong
import XCTest

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
final class OtherTests: XCTestCase {
    func testSummary() throws {
        print("现在一共有\(AUnit.allCases.count)种单位")
    }
}
