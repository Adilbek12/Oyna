import UIKit

protocol OnKeyboardShow {
    func onKeyboardWillShow()
    func onKeyboardWillHide()
}

extension OnKeyboardShow {
    func startKeyboardListining() {
        NotificationCenter.default.addObserver(self, selector: Selector(("onKeyboardWillShow")), name: NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: Selector(("onKeyboardWillHide")), name: NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
}
