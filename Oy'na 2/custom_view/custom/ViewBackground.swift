import UIKit

class ViewBackground: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(willTapView))
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    @objc private func willTapView(sender: UITapGestureRecognizer?) {
        endEditing(true)
    }
}
