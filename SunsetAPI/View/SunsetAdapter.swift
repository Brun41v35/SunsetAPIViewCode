import Foundation

final class SunsetAdapter: SunsetAdapterType {

    func adapt(with response: Sunrise) -> SunsetModel {
        let sunrise = response.results.sunrise
        let sunset = response.results.sunset

        return SunsetModel(sunrise: sunrise,
                           sunset: sunset)
    }
}
