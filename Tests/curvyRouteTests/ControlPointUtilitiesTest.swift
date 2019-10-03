@testable import CurvyRoute
import Foundation
import XCTest

class ControlUtilitiesTest: XCTestCase {
    var sut: ControlPointUtilities!

    override func setUp() {
        super.setUp()
        sut = ControlPointUtilities()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testThatControlPointIsCorrect() {
        let pointA = CGPoint(x: 0, y: 10)
        let pointB = CGPoint(x: 10, y: 10)
        let controlPoint = sut.controlPoint(pointA, pointB)
        XCTAssertEqual(controlPoint, CGPoint(x: 5, y: 5))
    }

    func testThatControlPointIsCorrectWithCustomradiusMultiplier() {
        let pointA = CGPoint(x: 0, y: 5)
        let pointB = CGPoint(x: 10, y: 10)
        let controlPoint = sut.controlPoint(pointA, pointB, radiusMultiplier: 0.7)
        XCTAssertEqual(controlPoint, CGPoint(x: 6.75, y: 4))
    }

    func testThatControlPointIsCorrectWithDoubleradiusMultiplier() {
        let pointA = CGPoint(x: 0, y: 10)
        let pointB = CGPoint(x: 10, y: 10)
        let controlPoint = sut.controlPoint(pointA, pointB, radiusMultiplier: 2)
        XCTAssertEqual(controlPoint, CGPoint(x: 5.000000000000001, y: 0))
    }
}
