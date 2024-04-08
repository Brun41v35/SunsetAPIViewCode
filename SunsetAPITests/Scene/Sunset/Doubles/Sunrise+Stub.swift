@testable import SunsetAPI

extension Sunrise {

    static func stub(results: Results = .stub()) -> Sunrise {
        return Sunrise(results: results)
    }
}

extension Results {

    static func stub(sunrise: String = "5:54:07 AM",
                     sunset: String = "6:45:46 PM") -> Results {
        return Results(sunrise: sunrise,
                       sunset: sunset)
    }
}
