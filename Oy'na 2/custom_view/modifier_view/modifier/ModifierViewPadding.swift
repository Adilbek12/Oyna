import UIKit
import Foundation

class ModifierViewPadding: ModifierView {
    
    private let leftPadding: CGFloat
    private let rightPadding: CGFloat
    private let topPadding: CGFloat
    private let bottomPadding: CGFloat
    
    init (padding: CGFloat) {
        self.leftPadding = padding
        self.rightPadding = padding
        self.topPadding = padding
        self.bottomPadding = padding
    }
    
    init (left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.leftPadding = left
        self.rightPadding = right
        self.topPadding = top
        self.bottomPadding = bottom
    }
    
    func modify(view: UIView) {
        
        if let textField = view as? UITextField {
            setPaddingTo(textField: textField)
        } else if let button = view as? UIButton {
            setPaddingTo(button: button)
        }
    }
    
    private func setPaddingTo(textField: UITextField) {
        let leftPaddingView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: leftPadding, height: leftPadding))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        let rightPaddingView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: rightPadding, height: rightPadding))
        textField.rightView = rightPaddingView
        textField.rightViewMode = .always
    }
    
    private func setPaddingTo(button: UIButton) {
        button.titleEdgeInsets = UIEdgeInsetsMake(topPadding, leftPadding, bottomPadding, rightPadding)
        button.imageEdgeInsets = UIEdgeInsetsMake(topPadding, leftPadding, bottomPadding, rightPadding)
    }
}
