import UIKit

class TextFieldTypeOne: ModifierTextField {
    override func modifiers() -> [ModifierView]? {
        return [
            ModifierViewBorder.init(width: Constant.BORDER_WIDTH, color: Colors.BORDER_COLOR),
            ModifierViewCornerRadius.init(radius: Constant.CORNER_RADIUS.hight!),
            ModifierViewPadding.init(padding: Constant.PADDING),
            ModifierViewPlaceholderColor.init(color: Colors.PLACEHOLDER_COLOR)
        ]
    }
}
