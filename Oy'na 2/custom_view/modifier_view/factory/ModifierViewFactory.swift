import UIKit
class ModifierViewFactory {
    public static func deploy(view: UIView, viewModifierList: [ModifierView]) {
        view.layer.masksToBounds = true
        viewModifierList.forEach { (viewModifier) in
            viewModifier.modify(view: view)
        }
    }
}
