import UIKit

class CheckCodeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var textFieldList: [UITextField]!
    
    private var textFiledGroup: TextFieldGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTextFiledGroup()
    }

    private func initTextFiledGroup() {
        

        textFiledGroup = TextFieldGroup.init(textFieldList: textFieldList, textFieldSizeLimit: 1)
        textFiledGroup.delegate = self
    }
    
    @IBAction func onClickBackButton(_ sender: ButtonBack) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension CheckCodeViewController: TextFieldGroupDelegate {
    func willEndEditing() {
    }
}

extension CheckCodeViewController: KeyboardDeletgate {
    @objc func onKeyboardWillShow(_ notification: NSNotification) {
        appnedKeyboardHeightFor(scrollView: scrollView, parentView: view, notification: notification)
    }
    
    @objc func onKeyboardWillHide(_ notification: NSNotification) {
        removeKeyboardHeightFor(scrollView: scrollView)
    }
}

extension CheckCodeViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
