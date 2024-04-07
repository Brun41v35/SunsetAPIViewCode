import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

typealias APIResult = Result<Sunrise, APIError>
