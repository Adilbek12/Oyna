import UIKit

class TextFieldGroup {

    public var delegate: TextFieldGroupDelegate?
    
    private var textFieldList: [UITextField]
    private var textFieldSizeLimit: Int
    
    private var text: String = ""
    
    init (textFieldList: [UITextField], textFieldSizeLimit: Int) {
        self.textFieldList = textFieldList
        self.textFieldSizeLimit = textFieldSizeLimit
        
        prepareTextFiledList()
    }
    
    private func prepareTextFiledList() {
        if textFieldList.isEmpty {
            return
        }
        
        textFieldList[0].becomeFirstResponder()
        textFieldList.forEach { (textField) in
            textField.isUserInteractionEnabled = true
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        
        let text = textField.text!
        
        if hasLimit(text: text) {
            let index = getIndex(textField: textField)
            if isLastTextField(index: index) {
                textFieldList[index].endEditing(true)
                delegate?.willEndEditing()
            } else {
                textFieldList[index+1].becomeFirstResponder()
            }
        }
    }
    
    private func hasLimit(text: String) -> Bool {
        return text.count == textFieldSizeLimit
    }
    
    private func isLastTextField(index: Int) -> Bool {
        return textFieldList.count == index + 1
    }
    
    private func getIndex(textField: UITextField) -> Int {
        for i in 0 ..< textFieldList.count {
            if textFieldList[i] == textField {
                return i
            }
        }
        return 0
    }
}

protocol TextFieldGroupDelegate {
    func willEndEditing()
}
