import UIKit

final class SunsetViewController: UIViewController {
    
    //MARK: - Variables
    private let sunsetView = SunsetView()
    private let viewModel = SunsetViewModel()
    
    //MARK: - LifeCycle
    public override func loadView() {
        self.view = sunsetView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestingInformation()
    }
    
    //MARK: - Functions
    private func requestingInformation() {
        sunsetView.updateButton.addTarget(self, action: #selector(sendRequest), for: .touchUpInside)
    }
    
    @objc private func sendRequest() {
        viewModel.makeRequesting { information, errorMessage in
            guard let information = information else {
                print("Erro")
                return
            }
            DispatchQueue.main.async {
                self.sunsetView.labelSunrise.text = information.results.sunrise
                self.sunsetView.labelSunset.text = information.results.sunset
            }
        }
    }
}

