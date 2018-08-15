import UIKit

class ModifierViewCornerRadius: ModifierView {
    
    private let radius: CGFloat
    
    init (radius: CGFloat) {
        self.radius = radius
    }
    
    func modify(view: UIView) {
        view.layer.cornerRadius = radius
    }
}
