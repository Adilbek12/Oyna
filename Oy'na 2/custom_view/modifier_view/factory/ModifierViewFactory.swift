import UIKit
class ModifierViewFactory {
    public static func deploy(view: UIView, modifierViewList: [ModifierView]) {
        view.layer.masksToBounds = true
        modifierViewList.forEach { (viewModifier) in
            viewModifier.modify(view: view)
        }
    }
    
    public static func deploy(view: UIView, modifierView: ModifierView) {
        view.layer.masksToBounds = true
        modifierView.modify(view: view)
    }
}
