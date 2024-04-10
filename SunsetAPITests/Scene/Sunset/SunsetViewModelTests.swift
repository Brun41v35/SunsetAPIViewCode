import XCTest
@testable import SunsetAPI

final class SunsetViewModelTests: XCTestCase {

    func test_loadData_shouldCallNetworkLoadDataOnce() {
        let networkMock = NetworkManagerMock()
        let sut = SunsetViewModel(network: networkMock)

        sut.loadData()

        XCTAssertEqual(networkMock.loadDataCallCount, 1)
    }

    func test_loadData_whenResultIsSuccess_shouldCallAdapterOnce() {
        let networkMock = NetworkManagerMock()
        let adapterMock = SunsetAdapterMock()
        let sut = SunsetViewModel(network: networkMock,
                                  adapter: adapterMock)

        sut.loadData()

        XCTAssertEqual(adapterMock.adaptResponseArgs, [.stub()])
        XCTAssertEqual(adapterMock.adaptResponseArgs.count, 1)
    }

    func test_loadData_whenResultIsSuccess_shouldCallViewControllerShowOnce() {
        let networkMock = NetworkManagerMock()
        let adapterMock = SunsetAdapterMock()
        let viewController = SunsetViewControllerSpy()
        let sut = SunsetViewModel(network: networkMock,
                                  adapter: adapterMock)
        sut.viewController = viewController

        sut.loadData()

        XCTAssertEqual(viewController.showViewModelArgs, [.stub()])
    }
}
