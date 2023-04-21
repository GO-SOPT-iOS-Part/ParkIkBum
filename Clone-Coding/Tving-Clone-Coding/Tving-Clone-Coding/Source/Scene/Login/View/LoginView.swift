import UIKit
import SnapKit
import Then

class LoginView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    private func setLayout() {
        self.addSubViews([navigationView, titleLabel, emailTextField, passwordTextField, loginButton, findIdButton, divideView, findPasswordButton, registerButton, makeNickNameButton])
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(ScreenUtils.getWidth(50))
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.navigationView.snp.bottom).offset(ScreenUtils.getWidth(10))
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(ScreenUtils.getWidth(31))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.height.equalTo(ScreenUtils.getWidth(52))
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(ScreenUtils.getWidth(7))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.height.equalTo(ScreenUtils.getWidth(52))
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(ScreenUtils.getWidth(21))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.height.equalTo(ScreenUtils.getWidth(52))
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom).offset(ScreenUtils.getWidth(36))
            $0.centerX.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(ScreenUtils.getWidth(12))
        }
        findIdButton.snp.makeConstraints {
            $0.trailing.equalTo(self.divideView.snp.leading).inset(ScreenUtils.getWidth(-33))
            $0.width.equalTo(ScreenUtils.getWidth(80))
            $0.centerY.equalTo(divideView)
        }
        findPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(self.divideView.snp.trailing).offset(ScreenUtils.getWidth(33))
            $0.width.equalTo(ScreenUtils.getWidth(80))
            $0.centerY.equalTo(divideView)
        }
        registerButton.snp.makeConstraints {
            $0.top.equalTo(self.findPasswordButton.snp.bottom).offset(ScreenUtils.getWidth(28))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(51))
            $0.trailing.equalTo(makeNickNameButton.snp.leading).inset(ScreenUtils.getWidth(-17))
        }
        makeNickNameButton.snp.makeConstraints {
            $0.centerY.equalTo(self.registerButton)
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(50))
        }
    }
    
    private let navigationView = NavigationView()
    private let titleLabel = UILabel().then {
        $0.font = .pretendedMediumFont(ofSize: 23)
        $0.textColor = .white
        $0.text = "TVING ID 로그인"
    }
    
    private let emailTextField = EmailTextField()
    private let passwordTextField = PasswordTextField()
    private let loginButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.layer.borderColor = UIColor.tivingGray40.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
    }
    private let findIdButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.tivingGray10, for: .normal)
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
    }
    private let divideView = UIView().then {
        $0.backgroundColor = .tivingGray40
    }
    private let findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.tivingGray10, for: .normal)
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
    }
    
    private let registerButton = UIButton().then {
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
        $0.setTitleColor(.tivingGray30, for: .normal)
    }
    
    private let makeNickNameButton = UIButton().then {
        $0.setTitle("닉네임 만들러 가기", for: .normal)
        $0.setTitleColor(.tivingGray20, for: .normal)
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
        $0.setUnderline()
    }
    
    
}
