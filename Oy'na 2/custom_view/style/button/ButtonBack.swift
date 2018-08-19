import UIKit

class ButtonBack: ModifierButton {
    
    override func modifiers() -> [ModifierView]? {
        return [
            ModifierViewCircle.init(),
            ModifierViewPadding.init(padding: 10),
            ModifierViewBlure.init()
        ]
    }

    override func properties() {
        titleLabel?.text = ""
        setImage(#imageLiteral(resourceName: "arrow_left"), for: .normal)
    }
}
