import UIKit

class ButtonTypeOne: UIButton {
    
    private let gradientColorTop: UIColor = Colors.Gradient.GRAY[0]
    private let gradientColorBottom: UIColor = Colors.Gradient.GRAY[1]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        self.titleLabel?.textColor = Colors.GREEN
        self.titleLabel?.font = .systemFont(ofSize: Constant.Text.Size.LARGE)
        
        setModifierList()
    }
    
    private func setModifierList() {
        let viewModifierList: [ModifierView] = [
            ModifierViewGradient.init(colorTop: gradientColorTop, colorBottom: gradientColorBottom),
            ModifierViewPadding.init(padding: Constant.View.PADDING),
            ModifierViewCornerRadius.init(radius: Constant.View.CornerRadius.HIGHT)
        ]
        
        ModifierViewFactory.deploy(view: self, viewModifierList: viewModifierList)
    }
}
