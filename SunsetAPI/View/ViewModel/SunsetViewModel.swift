import Foundation

final class SunsetViewModel {
    
    //MARK: - Request
    func makeRequesting(completed: @escaping (Surise?, String?) -> Void) {
        NetworkManager.shared.getInformationAPI { information, errorMessage in
            guard let information = information else {
                completed(nil, errorMessage)
                return
            }
            completed(information, nil)
        }
    }
}
