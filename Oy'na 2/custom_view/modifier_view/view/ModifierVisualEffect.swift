import UIKit

class ModifierVisualEffect: UIVisualEffectView {

    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func commonInit() {
        properties()
    }
    
    public func properties() {
        
    }
    
    public func modifiers() -> [ModifierView]? {
        return nil
    }
    
    private func setModifiers() {
        if let modifiers = modifiers() {
            ModifierViewFactory.deploy(view: self, modifierViewList: modifiers)
        }
    }
}
