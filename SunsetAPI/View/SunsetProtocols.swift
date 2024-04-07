import UIKit

protocol SunsetViewModelType {
    func loadData()
}

protocol SunsetViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
}
