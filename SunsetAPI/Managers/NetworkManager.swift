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

    func loadData(with baseURL: String, completion: @escaping APIResult) {

        let endpoint = baseURL + "?lat=36.7201600&lng=-4.4203400"
        guard let url = URL(string: endpoint) else { return }
        let request = URLRequest(url: url)

        let dataTask = session.dataTask(with: request) { data, response, error in

            guard let _ = error else {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(Sunrise.self, from: data)
                completion(.success(decoderResponse))
            } catch {
                completion(.failure(.unableToComplete))
            }
        }
        dataTask.resume()
    }
}
