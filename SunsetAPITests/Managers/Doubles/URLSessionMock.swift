import Foundation
@testable import SunsetAPI

final class URLSessionMock {

    // MARK: - Private Properties

    private(set) var dataTaskCallCount = 0
    private(set) var dataTaskArgsRequest = [URLRequest]()
    private(set) var dataTaskArgsCompletionHandler = [(Data?, URLResponse?, Error?) -> Void]()
    private let dummyURLSession = DummyURLSessionDataTask()
}

// MARK: - Extension

extension URLSessionMock: URLSessionType {

    func dataTask(with request: URLRequest,
                  completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        return dummyURLSession
    }
}
