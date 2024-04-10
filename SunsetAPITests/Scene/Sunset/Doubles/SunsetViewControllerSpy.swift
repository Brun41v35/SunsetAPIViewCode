@testable import SunsetAPI

final class SunsetViewControllerSpy {

    private(set) var showViewModelArgs = [SunsetModel]()
}

// MARK: - SunsetViewControllerType

extension SunsetViewControllerSpy: SunsetViewControllerType {

    func show(viewModel: SunsetModel) {
        showViewModelArgs.append(viewModel)
    }
}
