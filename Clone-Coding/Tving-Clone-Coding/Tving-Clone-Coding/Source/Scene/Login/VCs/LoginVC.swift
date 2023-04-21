import UIKit
import SnapKit
import Then

class LoginVC: UIViewController {
    private var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.isLoginEnable()
    }
    
    private func setLayout() {
        self.navigationController?.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
    private let loginView = LoginView()
}

private extension LoginVC {
    private func isLoginEnable() {
        var validEmail: Bool = false
        var validPassword: Bool = false
        
        self.loginView.emailTextField.textFieldCompletion = { [weak self] textfield in
            if let email = textfield.text {
                guard let strongSelf = self else {return}
                strongSelf.email = email
                validEmail = email.isValidEmail()
            }
            self?.didChangeLoginButtonState(emailState: validEmail,
                                            passwordState: validPassword)
        }
        
        self.loginView.passwordTextField.textFieldCompletion = { [weak self] textfield in
            if let password = textfield.text {
                validPassword = password.count > 8 ? true: false
            }
            self?.didChangeLoginButtonState(emailState: validEmail,
                                            passwordState: validPassword)
        }
    }
    
    private func didChangeLoginButtonState(emailState: Bool,
                                           passwordState: Bool) {
        if emailState && passwordState {
            self.loginView.loginButton.backgroundColor = .tivingRed
            self.loginView.loginButton.addTarget(self,
                                                 action: #selector(didLoginButtonTapped),
                                                 for: .touchUpInside)
        } else {
            self.loginView.loginButton.backgroundColor = .clear
            self.loginView.loginButton.removeTarget(self,
                                                    action: #selector(didLoginButtonTapped),
                                                    for: .touchUpInside)
        }
    }
    
    @objc private func didLoginButtonTapped() {
        if let navigationController = self.navigationController {
            let successVC = LoginSuccessVC()
            successVC.bindDescriptionTitle(description: self.email)
            navigationController.pushViewController(successVC,
                                                    animated: true)
        }
    }
    
    
}
