import Foundation

protocol URLSessionType {
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

protocol NetworkManagerType {
    func loadData(with baseURL: String, completion: @escaping APIResult)
}
