import UIKit

class ModifierViewPlaceholderColor: ModifierView {
    
    private let color: UIColor
    
    init (color: UIColor) {
        self.color = color
    }
    
    func modify(view: UIView) {
        if let textField = view as? UITextField {
            setPlaceholderColor(forTextField: textField)
        }
    }
    
    private func setPlaceholderColor(forTextField textField: UITextField) {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "",
                                                             attributes: [NSAttributedStringKey.foregroundColor: color])
    }
}
