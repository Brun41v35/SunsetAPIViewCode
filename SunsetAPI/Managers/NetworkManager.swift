import Foundation

final class NetworkManager {

    // MARK: - Private Properties

    private var session: URLSessionType

    // MARK: - Init

    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }
}

extension NetworkManager: NetworkManagerType {

    func loadData() {
//        let endpoint = baseURL + "?lat=36.7201600&lng=-4.4203400"
    }
}
