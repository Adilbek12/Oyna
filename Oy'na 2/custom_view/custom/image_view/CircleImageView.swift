import UIKit

class CircleImageView: UIImageView {

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
        let modifierViewList = [
            ModifierViewCircle.init()
        ]
        ModifierViewFactory.deploy(view: self, modifierViewList: modifierViewList)
    }
}
