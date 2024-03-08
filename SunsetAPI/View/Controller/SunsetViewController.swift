import UIKit

final class SunsetViewController: UIViewController {
    
    //MARK: - Variables

    private let contentView: SunsetViewType
    private let viewModel = SunsetViewModel()

    // MARK: Init

    init(contentView: SunsetViewType = SunsetView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle

    public override func loadView() {
        self.view = contentView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        requestingInformation()
    }
    
    //MARK: - Functions

//    private func requestingInformation() {
//        sunsetView.updateButton.addTarget(self, action: #selector(sendRequest), for: .touchUpInside)
//    }
    
//    @objc private func sendRequest() {
//        viewModel.makeRequesting { information, errorMessage in
//            guard let information = information else {
//                print("Erro")
//                return
//            }
//            DispatchQueue.main.async {
//                self.contentView.labelSunrise.text = information.results.sunrise
//                self.contentView.labelSunset.text = information.results.sunset
//            }
//        }
//    }
}

