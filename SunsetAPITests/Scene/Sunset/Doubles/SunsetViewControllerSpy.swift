@testable import SunsetAPI

final class SunsetViewControllerSpy {

    private(set) var showViewModelArgs = [SunsetModel]()
    private(set) var showAlertErrorCallCount = 0
}

// MARK: - SunsetViewControllerType

extension SunsetViewControllerSpy: SunsetViewControllerType {

    func show(viewModel: SunsetModel) {
        showViewModelArgs.append(viewModel)
    }

    func showAlertError() {
        showAlertErrorCallCount += 1
    }
}
