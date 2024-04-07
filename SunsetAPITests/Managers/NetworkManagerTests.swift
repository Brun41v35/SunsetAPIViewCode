import XCTest
@testable import SunsetAPI

final class NetworkManagerTests: XCTestCase {

    func test_loadData_shouldCallDataTaskOnce() {
        let sessionMock = URLSessionMock()
        let sut = NetworkManager(session: sessionMock)

        sut.loadData { _ in }

        XCTAssertEqual(sessionMock.dataTaskCallCount, 1)
    }

    func test_loadData_shouldHaveTheRightURL() {
        let sessionMock = URLSessionMock()
        let sut = NetworkManager(session: sessionMock)
        let url = URL(string: "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400")!
        let request = URLRequest(url: url)

        sut.loadData { _ in }

        XCTAssertEqual(sessionMock.dataTaskArgsRequest.first, request)
    }

    func test_loadData_shouldReturnSuccessResponse() {
        let sessionMock = URLSessionMock()
        let sut = NetworkManager(session: sessionMock)

        let expectation = expectation(description: "completion called")
        var capturedResult: APIResult!

        sut.loadData { result in
            capturedResult = result
            expectation.fulfill()
        }

        sessionMock.dataTaskArgsCompletionHandler.first?(
            jsonData(),
            response(with: 200),
            nil
        )

        wait(for: [expectation], timeout: 1.0)

        let valueToTest = returnCapturedResult(capturedResult: capturedResult)

        let sunrise = Sunrise(results: Results(sunrise: "5:54:07 AM", sunset: "6:45:46 PM"))

        XCTAssertEqual(valueToTest, sunrise)
    }

    func test_loadData_shouldReturnErrorResponse() {
        let sessionMock = URLSessionMock()
        let sut = NetworkManager(session: sessionMock)

        let expectation = expectation(description: "completion called")
        var capturedResult: APIResult!

        sut.loadData { result in
            capturedResult = result
            expectation.fulfill()
        }

        sessionMock.dataTaskArgsCompletionHandler.first?(
            nil,
            nil,
            anyNSError()
        )

        wait(for: [expectation], timeout: 1.0)

        let valueToTest = resultErrorFor(capturedResult: capturedResult)

        XCTAssertNotNil(valueToTest)
    }

    // MARK: - Helpers

    func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }

    private func resultErrorFor(capturedResult: APIResult) -> Error? {
        switch capturedResult {
        case let .failure(error):
            return error
        default:
            XCTFail("Expected failure, got ERROR instead")
            return nil
        }
    }

    private func returnCapturedResult(capturedResult: APIResult) -> Sunrise? {
        switch capturedResult {
        case let .success(response):
            return response
        default:
            XCTFail("Expected success, got ERROR instead")
            return nil
        }
    }

    private func jsonData() -> Data {
        """
        {
          "results": {
            "sunrise": "5:54:07 AM",
            "sunset": "6:45:46 PM"
          },
        }
        """.data(using: .utf8)!
    }

    private func response(with statusCode: Int) -> HTTPURLResponse? {
        let url = URL(string: "https://dummy.com")!
        let response = HTTPURLResponse(url: url,
                                       statusCode: statusCode,
                                       httpVersion: nil,
                                       headerFields: nil)
        return response
    }
}
