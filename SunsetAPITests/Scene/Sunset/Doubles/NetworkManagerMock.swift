@testable import SunsetAPI

final class NetworkManagerMock {

    private(set) var loadDataCallCount = 0
}

// MARK: - Extension

extension NetworkManagerMock: NetworkManagerType {

    func loadData(completion: @escaping (APIResult) -> Void) {
        loadDataCallCount += 1
    }
}
