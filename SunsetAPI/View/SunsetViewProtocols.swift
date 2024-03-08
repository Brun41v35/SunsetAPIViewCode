import UIKit

protocol SunsetViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
}
