import UIKit

class ViewBlure: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setModifiers()
    }
    
    private func setModifiers() {
        ModifierViewFactory.deploy(view: self, modifierViewList: [
                ModifierViewBlure.init(),
                ModifierViewCornerRadius.init(radius: Constant.CORNER_RADIUS.low!)
            ])
    }
}
