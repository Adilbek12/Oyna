import UIKit

class ModifierViewGradient: ModifierView {
    
    private let colorTop: UIColor
    private let colorBottom: UIColor
    
    init(colorTop: UIColor, colorBottom: UIColor) {
        self.colorTop = colorTop
        self.colorBottom = colorBottom
    }
    
    func modify(view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        
        if (view.layer.sublayers?[0] as? CAGradientLayer) != nil {
            view.layer.sublayers?[0] = gradientLayer
        } else {
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
