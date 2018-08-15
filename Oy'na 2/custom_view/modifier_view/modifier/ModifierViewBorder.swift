import UIKit

class ModifierViewBorder: ModifierView {
    
    private let width: CGFloat
    private let color: UIColor
    
    init (width: CGFloat, color: UIColor) {
        self.width = width
        self.color = color
    }
    
    func modify(view: UIView) {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
    }
}
