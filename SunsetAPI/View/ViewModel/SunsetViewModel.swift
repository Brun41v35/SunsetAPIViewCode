import Foundation

final class SunsetViewModel {
    
    //MARK: - Private Methods

    private let network: NetworkManagerType

    //MARK: - Init

    init(network: NetworkManagerType) {
        self.network = network
    }

    //MARK: - Private Methods

    private func fetchData() {
        network.loadData { result in
            switch result {
            case .success:
                print("Success")
            case .failure:
                print("Error")
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
