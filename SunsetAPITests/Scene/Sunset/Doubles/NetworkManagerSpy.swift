@testable import SunsetAPI

final class NetworkManagerSpy: NetworkManagerType {

    func loadData(completion: @escaping (APIResult) -> Void) {}
}
