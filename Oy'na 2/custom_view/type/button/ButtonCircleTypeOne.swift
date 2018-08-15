import UIKit

class ButtonCircleTypeOne: UIButton {
    
    @IBInspectable public var gradointColorTop: UIColor = UIColor.clear {
        didSet {
            updateGradientColor()
        }
    }
    @IBInspectable public var gradointColorBottom: UIColor = UIColor.clear {
        didSet {
            updateGradientColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let viewModifierList: [ModifierView] = [
            ModifierViewBorder.init(width: Constant.View.BORDER_WIDTH, color: Colors.Special.BORDER_COLOR),
            ModifierViewGradient.init(colorTop: gradointColorTop, colorBottom: gradointColorBottom),
            ModifierViewPadding.init(padding: 0),
            ModifierViewCircle()
        ]
        ModifierViewFactory.deploy(view: self, viewModifierList: viewModifierList)
    }
    
    private func updateGradientColor() {
        let viewModifierList: [ModifierView] = [
            ModifierViewGradient.init(colorTop: gradointColorTop, colorBottom: gradointColorBottom)
        ]
        ModifierViewFactory.deploy(view: self, viewModifierList: viewModifierList)
    }
}
