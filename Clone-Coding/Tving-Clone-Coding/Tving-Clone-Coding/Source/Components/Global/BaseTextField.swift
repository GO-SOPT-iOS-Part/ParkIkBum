import UIKit

class BaseTextField: UITextField {
    internal var textFieldCompletion: ((UITextField) -> Void)?
    internal var textFieldDidStartEditCompletion: ((UITextField) -> Void)?
    internal var textFieldDidEndEditCompletion: ((UITextField) -> Void)?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        self.delegate = self
        self.addTarget(self,
                       action: #selector(self.textFieldDidEditing(_:)),
                       for: .editingChanged)
        self.setPaddingConfig()
        self.setConfig()
    }
    
    private func setConfig() {
        self.textColor = .tivingGray20
    }
    
    private func changeBorderColor(color: CGColor,
                                   width: CGFloat) {
        self.layer.borderColor = color
        self.layer.borderWidth = width
    }
    
    private func removeText() {
        self.text = ""
    }
    
    @objc private func didRemoveButtonClicked() {
        self.removeText()
        self.removeButton.isHidden = true
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        guard let completion = textFieldCompletion else {return}
        completion(textField)
    }
    
    private func setPaddingConfig() {
        self.setLeftPaddingPoints(22)
        self.setRightPaddingPoints(ScreenUtils.getWidth(60))
    }
    
    //MARK: - Layout
    internal func setRemoveButtonLayout() {
        self.addSubview(removeButton)
        removeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ScreenUtils.getWidth(14))
            $0.bottom.equalToSuperview().inset(ScreenUtils.getWidth(18))
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.width.equalTo(ScreenUtils.getWidth(20))
        }
    }
    
    internal lazy var removeButton = UIButton().then {
        $0.setImage(ImageLiterals.icXCircle, for: .normal)
        $0.addTarget(self,
                     action: #selector(didRemoveButtonClicked),
                     for: .touchUpInside)
        $0.isHidden = true
    }
    
}

extension BaseTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.changeBorderColor(color: UIColor.tivingGray20.cgColor, width: 1.0)
        guard let completion = self.textFieldDidStartEditCompletion else {return}
        completion(textField)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.changeBorderColor(color: UIColor.clear.cgColor, width: 0)
        guard let completion = self.textFieldDidEndEditCompletion else {return}
        completion(textField)
    }
}
