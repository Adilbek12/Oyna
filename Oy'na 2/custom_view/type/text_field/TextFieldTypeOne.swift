import UIKit

class TextFieldTypeOne: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        font = .systemFont(ofSize: Constant.Text.Size.LARGE)
        textColor = .white
        setViewModifierList()
    }
    
    private func setViewModifierList() {
        let viewModifierList: [ModifierView] = [
            ModifierViewBorder.init(width: Constant.View.BORDER_WIDTH, color: Colors.Special.BORDER_COLOR),
            ModifierViewCornerRadius.init(radius: Constant.View.CornerRadius.HIGHT),
            ModifierViewPadding.init(padding: Constant.View.PADDING),
            ModifierViewPlaceholderColor.init(color: Colors.Special.PLACEHOLDER_COLOR)
        ]
        
        ModifierViewFactory.deploy(view: self, viewModifierList: viewModifierList)
    }
}
