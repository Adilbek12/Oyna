import UIKit

class ModifierViewBlure: ModifierView {
    
    func modify(view: UIView) {
        setBackgroundBlurEffect(view: view)
        checkViewAndSetProperties(view: view)
    }
    
    private func checkViewAndSetProperties(view: UIView) {
        if let button = view as? UIButton {
            if button.imageView != nil {
                button.bringSubview(toFront: button.imageView!)
            }
        }
    }
    
    private func setBackgroundBlurEffect(view: UIView) {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffectStyle.light))
        blur.frame = view.bounds
        blur.isUserInteractionEnabled = false
        view.insertSubview(blur, at: 0)
    }
}
