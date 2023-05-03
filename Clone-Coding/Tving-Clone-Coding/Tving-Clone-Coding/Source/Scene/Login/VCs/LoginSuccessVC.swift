import UIKit

class LoginSuccessVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayuout()
        self.setConfigButton()
    }
    
    private func setLayuout() {
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(loginSuccessView)
        loginSuccessView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    internal func bindDescriptionTitle(description: String) {
        self.loginSuccessView.descriptionLabel.text = "\(description) 님 반가워요!"
    }
    
    private let loginSuccessView = LoginSuccessView()

}
private extension LoginSuccessVC {
    private func setConfigButton() {
        self.loginSuccessView.goToMainButton.addTarget(self,
                                                       action: #selector(didGoToMainButtonTapped),
                                                       for: .touchUpInside)
    }
    
    @objc private func didGoToMainButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
