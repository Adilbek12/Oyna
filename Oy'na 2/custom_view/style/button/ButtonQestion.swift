import UIKit

class ButtonQestion: ModifierButton {
    
    override func modifiers() -> [ModifierView] {
        return [
            ModifierViewCircle.init(),
            ModifierViewBorder.init(width: 2, color: .white),
            ModifierViewBlure.init()
        ]
    }
    
    override func properties() {
        setTitle("?", for: .normal)
        setTitleColor(.white, for: .normal)
    }
}
