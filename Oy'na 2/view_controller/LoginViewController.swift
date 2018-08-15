import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldContainerViewYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textFieldContainer: UIVisualEffectView!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let httpService: HttpService? = nil
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
        httpService?.authorizingUserBy(phoneNumber: phoneNumber, password: password) { (token) in
            guard token != nil else {
                showAuthorizingErrorAlert()
                return
            }
            duringSuccessfulAuthorizing(token: token!)
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

extension LoginViewController: OnKeyboardShow {
    @objc func onKeyboardWillShow() {
        UIView.animate(withDuration: Constant.Anim.SHORT) {
            self.textFieldContainerViewYConstraint.constant = -50
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func onKeyboardWillHide() {
        UIView.animate(withDuration: Constant.Anim.SHORT) {
            self.textFieldContainerViewYConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

extension LoginViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
