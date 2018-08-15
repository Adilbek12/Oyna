import UIKit

class ModifierViewCircle: ModifierView {
    func modify(view: UIView) {
        view.layer.cornerRadius = 0.5 * view.bounds.size.width
    }
}
