import UIKit

class TextFieldCodeTypeOne: ModifierTextField {

    override func properties() {
        backgroundColor = .white
    }
    
    override func modifiers() -> [ModifierView]? {
        return [
            ModifierViewPadding.init(padding: 0),
            ModifierViewCornerRadius.init(radius: Constant.CORNER_RADIUS.low!)
        ]
    }
}
