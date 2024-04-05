import Foundation
@testable import SunsetAPI

final class URLSessionMock: URLSessionType {

    // MARK: - Private Properties

    private(set) var dataTaskCallCount = 0
    private(set) var dataTaskArgsRequest = [URLRequest]()
    private let dummyURLSession = DummyURLSessionDataTask()

    // MARK: - Methods

    func dataTask(with request: URLRequest,
                  completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        return dummyURLSession
    }
}
