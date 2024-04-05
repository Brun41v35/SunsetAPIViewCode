import UIKit

final class SunsetViewController: UIViewController {
    
    //MARK: - Variables

    private let contentView: SunsetViewType
    private let viewModel: SunsetViewModelType

    // MARK: - Init

    init(contentView: SunsetViewType = SunsetView(),
         viewModel: SunsetViewModelType) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle

    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - setup

    private func setup() {
        bindLayoutEvents()
    }

    private func bindLayoutEvents() {

        contentView.didTapButton = { [weak self] in
            print("Tapped")
        }
    }

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

