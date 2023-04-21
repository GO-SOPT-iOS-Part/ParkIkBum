import UIKit
import SnapKit
import Then

class LoginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
    
    private func setLayout() {
        self.navigationController?.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
    
    private func setViewConfig() {
    }
    
    private let loginView = LoginView()
}
