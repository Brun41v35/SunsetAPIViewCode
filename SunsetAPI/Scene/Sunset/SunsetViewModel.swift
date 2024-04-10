import Foundation

final class SunsetViewModel {

    // MARK: - Internal Properties

    weak var viewController: SunsetViewControllerType?
    
    //MARK: - Private Properties

    private let network: NetworkManagerType
    private let adapter: SunsetAdapterType

    //MARK: - Init

    init(network: NetworkManagerType,
         adapter: SunsetAdapterType = SunsetAdapter()) {
        self.network = network
        self.adapter = adapter
    }

    //MARK: - Private Methods

    private func fetchData() {
        network.loadData { [weak self] result in
            self?.handleResponse(with: result)
        }
    }

    private func handleResponse(with result: APIResult) {
        switch result {
        case .success(let response):
            let viewModel = adapter.adapt(with: response)
            viewController?.show(viewModel: viewModel)
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
}

// MARK: - SunsetViewModelType

extension SunsetViewModel: SunsetViewModelType {

    func loadData() {
        fetchData()
    }
}
