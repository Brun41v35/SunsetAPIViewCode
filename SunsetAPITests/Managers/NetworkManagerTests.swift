import XCTest
@testable import SunsetAPI

final class NetworkManagerTests: XCTestCase {

    func test_loadData_shouldCallDataTaskOnce() {
        let sessionMock = URLSessionMock()
        let sut = NetworkManager(session: sessionMock)

        sut.loadData(with: "") { _ in }

        XCTAssertEqual(sessionMock.dataTaskCallCount, 1)
    }
}
