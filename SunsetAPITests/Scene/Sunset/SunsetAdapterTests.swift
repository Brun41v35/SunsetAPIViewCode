import XCTest
@testable import SunsetAPI

final class SunsetAdapterTests: XCTestCase {

    func test_adaptWithResponse_shouldAdaptCorrect() {

        let capturedValue: SunsetModel?
        let expectedValue: SunsetModel?

        let sut = SunsetAdapter()
        capturedValue = sut.adapt(with: .stub())

        expectedValue = SunsetModel(sunrise: "5:54:07 AM",
                                    sunset: "6:45:46 PM")

        XCTAssertEqual(capturedValue, expectedValue)
    }
}
