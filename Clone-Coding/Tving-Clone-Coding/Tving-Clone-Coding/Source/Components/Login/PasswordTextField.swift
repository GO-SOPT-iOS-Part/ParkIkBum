import UIKit
import Then
import SnapKit

class PasswordTextField: BaseTextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init() {
        super.init()
        self.setConfig()
        self.setLayout()
        self.getTextFieldData()
    }
    
    private func getTextFieldData() {
        self.textFieldCompletion = { [weak self] textField in
            guard let strongSelf = self else {return}
            if let text = textField.text {
                strongSelf.pwdHiddenButton.isHidden = text.isEmpty
                strongSelf.removeButton.isHidden = text.isEmpty
            }
        }
        self.textFieldDidEndEditCompletion = { [weak self] textfield in
            guard let strongSelf = self else {return}
            strongSelf.pwdHiddenButton.isHidden = true
            strongSelf.removeButton.isHidden = true
        }
        self.textFieldDidStartEditCompletion = { [weak self] textfield in
            guard let strongSelf = self else {return}
            if let text = textfield.text {
                strongSelf.pwdHiddenButton.isHidden = text.isEmpty
                strongSelf.removeButton.isHidden = text.isEmpty
            }
        }
    }
    
    @objc private func didPwdHiddenbuttonTapped() {
        self.isSecureTextEntry = self.pwdHiddenButton.isSelected
        self.pwdHiddenButton.isSelected = !self.pwdHiddenButton.isSelected
    }
    
    //MARK: - config
    private func setConfig() {
        self.backgroundColor = .tivingGray40
        self.isSecureTextEntry = true
        self.layer.cornerRadius = 3
        self.attributedPlaceholder = "비밀번호".setAttributeString(textColor: .tivingGray30,
                                                              font: .pretendedSemiBoldFont(ofSize: 15))
    }
    
    //MARK: - layout
    private func setLayout() {
        self.addSubViews([pwdHiddenButton, removeButton])
        self.pwdHiddenButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ScreenUtils.getWidth(18))
            $0.bottom.equalToSuperview().inset(ScreenUtils.getWidth(14))
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.width.equalTo(ScreenUtils.getWidth(20))
        }
        self.removeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ScreenUtils.getWidth(18))
            $0.bottom.equalToSuperview().inset(ScreenUtils.getWidth(14))
            $0.trailing.equalTo(self.pwdHiddenButton.snp.leading).offset(ScreenUtils.getWidth(-20))
            $0.width.equalTo(ScreenUtils.getWidth(20))
        }
        self.setRightPaddingPoints(ScreenUtils.getWidth(96))
        self.pwdHiddenButton.imageView?.image?.withTintColor(.white)
    }
    
    private lazy var pwdHiddenButton = UIButton().then {
        $0.setImage(ImageLiterals.icEye, for: .selected)
        $0.setImage(ImageLiterals.icEyeSlash, for: .normal)
        $0.addTarget(self,
                     action: #selector(didPwdHiddenbuttonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
}

