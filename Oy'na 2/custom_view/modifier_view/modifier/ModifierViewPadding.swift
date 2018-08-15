import UIKit
import Foundation

class ModifierViewPadding: ModifierView {
    
    private let padding: CGFloat
    
    init (padding: CGFloat) {
        self.padding = padding
    }
    
    func modify(view: UIView) {
        
        if let textField = view as? UITextField {
            let paddingView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: padding, height: padding))
            textField.leftView = paddingView
            textField.leftViewMode = .always
            textField.rightView = paddingView
            textField.rightViewMode = .always
        } else if let button = view as? UIButton {
            button.titleEdgeInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        } else {
            view.bounds.insetBy(dx: padding, dy: padding)
        }
    }
}
