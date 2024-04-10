import XCTest
@testable import SunsetAPI

final class SunsetViewModelTests: XCTestCase {

    func test_loadData_shouldCallNetworkLoadDataOnce() {
        let networkMock = NetworkManagerMock()
        let sut = SunsetViewModel(network: networkMock)

        sut.loadData()

        XCTAssertEqual(networkMock.loadDataCallCount, 1)
    }
}
