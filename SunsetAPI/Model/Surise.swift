import Foundation

struct Sunrise: Codable {
    
    //MARK: - Properties

    let results: Results
}

struct Results: Codable {

    //MARK: - Properties

    let sunrise: String
    let sunset: String
}
