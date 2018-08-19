import UIKit

class CreatePasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickNextButton(_ sender: UIButton) {
    }
}

extension CreatePasswordViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
