@testable import SunsetAPI

final class NetworkManagerMock {}

// MARK: - Extension

extension NetworkManagerMock: NetworkManagerType {

    func loadData(completion: @escaping (APIResult) -> Void) {}
}
