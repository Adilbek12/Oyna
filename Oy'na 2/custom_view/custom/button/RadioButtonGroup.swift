import UIKit

class RadioButtonGroup {
    
    private var activeButtonIndex: Int?
    private var radioButtonList: [RadioButton] = []
    
    init (radioButtonList: RadioButton...) {
        self.radioButtonList = radioButtonList
        setStartActiveButton()
    }
    
    private func setStartActiveButton() {
        if radioButtonList.count > 0 {
            activeButtonIndex = 0
            updateButtons()
        }
    }
    
    public func toActive(button: RadioButton) {
        if !isExist(button: button) {
            return
        }
        
        activeButtonIndex =  radioButtonList.index(of: button)
        updateButtons()
    }
    
    private func isExist(button: RadioButton) -> Bool {
        let result = radioButtonList.index(of: button)
        return result != nil
    }
    
    private func updateButtons() {
        for i in 0 ..< radioButtonList.count {
            if i == activeButtonIndex {
                radioButtonList[i].setActive()
            } else {
                radioButtonList[i].setUnactive()
            }
        }
    }
    
    public func getActiveButton() throws -> RadioButton {
        if activeButtonIndex == nil {
            throw NSException.init(name: NSExceptionName(rawValue: "Active button not extist"), reason: nil, userInfo: nil) as! Error
        }
        
        return radioButtonList[activeButtonIndex!]
    }
}
