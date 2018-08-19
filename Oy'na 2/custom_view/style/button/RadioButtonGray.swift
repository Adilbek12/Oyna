import UIKit

class RadioButtonGray: RadioButton {
    
    private var colorTop: UIColor = Colors.GRAY.top!
    private var colorBottom: UIColor = Colors.GRAY.bottom!
    
    override func modifiers() -> [ModifierView]? {
        return [
            ModifierViewCircle.init()
        ]
    }
    
    override func setActive() {
        setStatusActiveProperties()
        setStatusActiveModifiers()
    }
    
    private func setStatusActiveProperties() {
        setTitleColor(Colors.getColor(r: 0, g: 83, b: 3), for: .normal)
    }
    
    private func setStatusActiveModifiers() {
        let modifierViewList: [ModifierView] = [
            ModifierViewBorder.init(width: 0, color: .clear),
            ModifierViewGradient.init(colorTop: colorTop, colorBottom: colorBottom)
        ]
        ModifierViewFactory.deploy(view: self, modifierViewList: modifierViewList)
    }
    
    override func setUnactive() {
        setStatusUnactiveProperties()
        setStatusUnactiveModifiers()
    }
    
    private func setStatusUnactiveProperties() {
        setTitleColor(.white, for: .normal)
    }
    
    private func setStatusUnactiveModifiers() {
        let modifierViewList: [ModifierView] = [
            ModifierViewBorder.init(width: Constant.BORDER_WIDTH, color: .white),
            ModifierViewGradient.init(colorTop: .clear, colorBottom: .clear)
        ]
        ModifierViewFactory.deploy(view: self, modifierViewList: modifierViewList)
    }
}
