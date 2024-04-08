import UIKit

protocol SunsetViewModelType {
    var viewController: SunsetViewControllerType? { get set }
    func loadData()
}

protocol SunsetViewControllerType: AnyObject {
    func show(viewModel: SunsetModel)
}

protocol SunsetViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
    func show(viewModel: SunsetModel)
}

protocol SunsetAdapterType {
    func adapt(with response: Sunrise) -> SunsetModel
}
