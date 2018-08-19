import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextFiled: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startKeyboardListining()
    }

    @IBAction func onClickNextButton(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickCancelButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension ForgotPasswordViewController: KeyboardDeletgate {
    @objc func onKeyboardWillShow(_ notification: NSNotification) {
        var userInfo = notification.userInfo!
        var keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func onKeyboardWillHide(_ notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}

extension ForgotPasswordViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
