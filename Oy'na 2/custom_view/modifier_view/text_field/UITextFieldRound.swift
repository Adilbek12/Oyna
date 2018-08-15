import UIKit

class UITextFieldRound: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: Constant.View.PADDING, bottom: 0, right: Constant.View.PADDING)

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        layer.masksToBounds = true
        layer.borderColor = Colors.Special.BORDER_COLOR.cgColor
        layer.borderWidth = Constant.View.BORDER_WIDTH
        layer.cornerRadius = Constant.View.CornerRadius.HIGHT
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                   attributes: [NSAttributedStringKey.foregroundColor: Colors.Special.PLACEHOLDER_COLOR])
    }
}
