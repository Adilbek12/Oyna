import UIKit

class ModifierTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
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
