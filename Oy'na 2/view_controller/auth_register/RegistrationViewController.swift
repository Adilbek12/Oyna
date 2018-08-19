import UIKit
import Foundation

class RegistrationViewController: UIViewController {

    @IBOutlet weak var textFieldContainer: UIVisualEffectView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    
    @IBOutlet weak var genderMenButton: RadioButton!
    @IBOutlet weak var genderWomenButton: RadioButton!
    
    private var radioButtonGroup: RadioButtonGroup!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var sendCodeButton: UIButton!
    
    private let apiAuthorization = ApiAuthorization.init()
    private var alertHelper: AlertHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startKeyboardListining()
        radioButtonGroup = RadioButtonGroup.init(radioButtonList: genderMenButton, genderWomenButton)
        alertHelper = AlertHelper(parentView: self.view)
    }
    
    @IBAction func onClickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSendCodeButton(_ sender: UIButton) {
        tryToRegistrateUser()
    }
    
    private func tryToRegistrateUser() {
        let registrationUser = getRegistrationUser()
        
        if valid(registrationUser: registrationUser) {
            regisration(user: registrationUser)
        } else {
            showWrongInputDataAlert()
        }
    }
    
    private func getRegistrationUser() -> RegisrationUser {
        let registrationUser = RegisrationUser()
        registrationUser.name = nameTextField.text
        registrationUser.surname = surnameTextField.text
        registrationUser.cityId = getCityIdBy(name: cityTextField.text)
        registrationUser.birthDate = getDateFrom(text: birthDateTextField.text)
        registrationUser.phoneNumber = phoneNumberTextField.text
        return registrationUser
    }
    
    private func getCityIdBy(name: String?) -> Int? { // **
        if let cityName = name {
            return cityName == "" ? 1 : 0
        } else {
            return nil
        }
    }
    
    private func getDateFrom(text: String?) -> Date? { // **
        return Date()
    }
    
    private func regisration(user: RegisrationUser) {
        apiAuthorization.registration(user: user) { (token) in
            guard token != nil else {
                showTokenErrorAlert()
                return
            }
            duringSuccessfulRegistration()
        }
    }
    
    private func valid(registrationUser: RegisrationUser) -> Bool {
        return true
    }
    
    private func showWrongInputDataAlert() {
        alertHelper.showWrongMessageWith(text: "Wrong data !!!")
    }
    
    private func showTokenErrorAlert() {
        alertHelper.showWrongMessageWith(text: "teaasdzxc")
    }
    
    private func duringSuccessfulRegistration() {
        
    }
    
    @IBAction func onClickGenderButton(_ sender: RadioButton) {
        radioButtonGroup.toActive(button: sender)
    }
}

extension RegistrationViewController: KeyboardDeletgate {
    @objc func onKeyboardWillShow(_ notification: NSNotification) {
        appnedKeyboardHeightFor(scrollView: scrollView, parentView: view, notification: notification)
    }
    
    @objc func onKeyboardWillHide(_ notification: NSNotification) {
        removeKeyboardHeightFor(scrollView: scrollView)
    }
}

extension RegistrationViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
