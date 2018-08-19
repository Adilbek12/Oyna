import UIKit

class VisualEffectContianer: ModifierVisualEffect {

    override func modifiers() -> [ModifierView]? {
        return [
            ModifierViewCornerRadius.init(radius: Constant.CORNER_RADIUS.low!)
        ]
    }
}
