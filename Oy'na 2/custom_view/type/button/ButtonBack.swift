import UIKit

class ButtonBack: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setParametrs()
        setViewModifierList()
    }
    
    private func setViewModifierList() {
        let viewModifierList: [ModifierView] = [
            ModifierViewCircle.init(),
            ModifierViewPadding.init(padding: 0)
        ]
        ModifierViewFactory.deploy(view: self, viewModifierList: viewModifierList)
    }

    private func setParametrs() {
        titleLabel?.text = ""
        setImage(UIImage.init(named: "arrow_left"), for: .normal)
        setBlurEffect()
    }
    
    private func setBlurEffect() {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffectStyle.light))
        blur.frame = bounds
        blur.isUserInteractionEnabled = false
        insertSubview(blur, at: subviews.count)
        bringSubview(toFront: imageView!)
    }
}
