import UIKit

class ModifierViewPlaceholderColor: ModifierView {
    
    private let color: UIColor
    
    init (color: UIColor) {
        self.color = color
    }
    
    func modify(view: UIView) {
        if let textFiled = view as? UITextField {
            textFiled.attributedPlaceholder = NSAttributedString(string: textFiled.placeholder ?? "",
                                                                   attributes: [NSAttributedStringKey.foregroundColor: color])
        }
    }
}
