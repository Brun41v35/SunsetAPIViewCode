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
            self?.viewModel.loadData()
        }
    }
}

// MARK: - SunsetViewType

extension SunsetViewController: SunsetViewControllerType {

    func show(viewModel: SunsetModel) {
        DispatchQueue.main.async {
            self.contentView.show(viewModel: viewModel)
        }
    }
}
