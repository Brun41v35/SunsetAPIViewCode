import Foundation

struct Sunrise: Decodable, Equatable {
    
    //MARK: - Properties

    let results: Results
}

struct Results: Decodable, Equatable  {

    //MARK: - Properties

    let sunrise: String
    let sunset: String
}
