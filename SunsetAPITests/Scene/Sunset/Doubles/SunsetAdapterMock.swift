@testable import SunsetAPI

final class SunsetAdapterMock {

    var adaptReturn: SunsetModel = .stub()
    private(set) var adaptResponseArgs = [Sunrise]()
}

// MARK: - Extension

extension SunsetAdapterMock: SunsetAdapterType {

    func adapt(with response: Sunrise) -> SunsetModel {
        adaptResponseArgs.append(response)
        return adaptReturn
    }
}
