@testable import SunsetAPI

extension SunsetModel {

    static func stub(sunrise: String = "5:54:07 AM",
                     sunset: String = "5:54:07 AM") -> Self {

        return SunsetModel(sunrise: sunrise,
                           sunset: sunset)
    }
}
