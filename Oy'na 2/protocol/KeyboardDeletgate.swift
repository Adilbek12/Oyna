import UIKit

protocol KeyboardDeletgate {
    func onKeyboardWillShow(_ notification:NSNotification)
    func onKeyboardWillHide(_ notification:NSNotification)
}

extension KeyboardDeletgate {
    public func startKeyboardListining() {
        NotificationCenter.default.addObserver(self, selector: Selector(("onKeyboardWillShow:")), name: NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: Selector(("onKeyboardWillHide:")), name: NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    public func appnedKeyboardHeightFor(scrollView: UIScrollView, parentView view: UIView, notification: NSNotification) {
        var userInfo = notification.userInfo!
        var keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 100
        scrollView.contentInset = contentInset
    }
    
    public func removeKeyboardHeightFor(scrollView: UIScrollView) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
