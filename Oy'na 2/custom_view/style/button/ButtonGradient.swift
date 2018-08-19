import UIKit

class ButtonGradient: UIButton {
    
    @IBInspectable var colotTop: UIColor = UIColor.clear {
        didSet {
            self.updateGradientColors()
        }
    }
    @IBInspectable var colorBottom: UIColor = UIColor.clear {
        didSet {
            self.updateGradientColors()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.updateCornerRadius()
        }
    }
    
    private func updateGradientColors() {
        let modifierViewGradient = ModifierViewGradient.init(colorTop: colotTop, colorBottom: colorBottom)
        ModifierViewFactory.deploy(view: self, modifierView: modifierViewGradient)
    }
    
    private func updateCornerRadius() {
        let modifierViewCornerRadius = ModifierViewCornerRadius.init(radius: cornerRadius)
        ModifierViewFactory.deploy(view: self, modifierView: modifierViewCornerRadius)
    }
}
