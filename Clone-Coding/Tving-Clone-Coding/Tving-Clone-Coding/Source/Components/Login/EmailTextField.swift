import UIKit
import Then
import SnapKit

class EmailTextField: BaseTextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
        self.setEmailConfig()
        self.setConifg()
        self.getTextFieldData()
    }
    
    private func getTextFieldData() {
        self.textFieldCompletion = { [weak self] textField in
            guard let strongSelf = self else {return}
            if let text = textField.text {
                strongSelf.removeButton.isHidden = text.isEmpty
            }
        }
        self.textFieldDidEndEditCompletion = { [weak self] textfield in
            guard let strongSelf = self else {return}
            strongSelf.removeButton.isHidden = true
        }
        
        self.textFieldDidStartEditCompletion = { [weak self] textfield in
            guard let strongSelf = self else {return}
            if let text = textfield.text {
                strongSelf.removeButton.isHidden = text.isEmpty
            }
        }
    }
    
    //MARK: - config
    private func setConifg() {
        self.backgroundColor = .tivingGray40
        self.layer.cornerRadius = 3
    }
    
    private func setEmailConfig() {
        self.setConifg()
        self.setRemoveButtonLayout()
        self.attributedPlaceholder = "아이디".setAttributeString(textColor: .tivingGray30,
                                                              font: .pretendedSemiBoldFont(ofSize: 15))
    }
}

