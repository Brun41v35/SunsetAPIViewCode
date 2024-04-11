@testable import SunsetAPI

final class NetworkManagerMock {

    private(set) var loadDataCallCount = 0

    var networkResponse: Result<Sunrise, APIError> = {
        return .success(.stub())
    }()
}

// MARK: - Extension

extension NetworkManagerMock: NetworkManagerType {

    func loadData(completion: @escaping (APIResult) -> Void) {
        loadDataCallCount += 1
        completion(networkResponse)
    }
}
