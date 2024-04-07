import Foundation

final class SunsetViewModel {

    // MARK: - Internal Properties

    weak var viewController: SunsetViewControllerType?
    
    //MARK: - Private Properties

    private let network: NetworkManagerType

    //MARK: - Init

    init(network: NetworkManagerType) {
        self.network = network
    }

    //MARK: - Private Methods

    private func fetchData() {
        network.loadData { [weak self] result in
            switch result {
            case .success(let response):
                let viewModel = SunsetModel(sunrise: response.results.sunrise,
                                            sunset: response.results.sunset)
                self?.viewController?.show(viewModel: viewModel)
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}

// MARK: - SunsetViewModelType

extension SunsetViewModel: SunsetViewModelType {

    func loadData() {
        fetchData()
    }
}
