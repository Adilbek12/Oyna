import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldContainer: UIVisualEffectView!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let apiAuthorization = ApiAuthorization.init()
    private var alertHelper: AlertHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startKeyboardListining()
        alertHelper = AlertHelper.init(parentView: view)
    }
    
    @IBAction func onClickSingInButton(_ sender: UIButton) {
        if let phoneNumber = phoneNumberTextField.text,
            let password = passwordTextField.text {
            tryToAuthorizingUserWith(phoneNumber: phoneNumber, password: password)
        }
    }
    
    private func tryToAuthorizingUserWith(phoneNumber: String, password: String) {
        let authorizationUser = AuthorizationUser.init(phoneNumber: phoneNumber, password: password)
        apiAuthorization.authorizing(user: authorizationUser) { (token) in
            guard token != nil else {
                self.showAuthorizingErrorAlert()
                return
            }
            self.duringSuccessfulAuthorizing(token: token!)
        }
    }
    
    private func showAuthorizingErrorAlert() {
        hideKeyboard()
        alertHelper.showWrongMessageWith(text: "Wrong data !!!")
    }
    
    private func duringSuccessfulAuthorizing(token: String) {
        let menuTabController = MenuTabController()
        menuTabController.userToken = token
        self.navigationController?.pushViewController(menuTabController, animated: true)
    }
    
    private func hideKeyboard() {
        view.endEditing(true)
    }
}

extension LoginViewController: KeyboardDeletgate {
    @objc func onKeyboardWillShow(_ notification: NSNotification) {
        appnedKeyboardHeightFor(scrollView: scrollView, parentView: view, notification: notification)
    }
    
    @objc func onKeyboardWillHide(_ notification: NSNotification) {
        removeKeyboardHeightFor(scrollView: scrollView)
    }
}

extension LoginViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
