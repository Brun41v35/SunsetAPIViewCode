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
        
    }

    // MARK: - Helpers

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
