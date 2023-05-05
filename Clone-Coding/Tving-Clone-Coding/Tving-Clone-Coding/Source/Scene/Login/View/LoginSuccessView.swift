import UIKit

class LoginSuccessView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        self.addSubViews([logoImageView, descriptionLabel, goToMainButton])
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(ScreenUtils.getWidth(14))
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(ScreenUtils.getHeight(211))
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.logoImageView.snp.bottom).offset(ScreenUtils.getWidth(67))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(74))
        }
        
        goToMainButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaInsets).inset(ScreenUtils.getWidth(28))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.height.equalTo(ScreenUtils.getWidth(52))
        }
    }
    
    private let logoImageView = UIImageView(image: UIImage(named: "logoTiving"))
    internal let descriptionLabel = UILabel().then {
        $0.font = .pretendeBoldFont(ofSize: 23)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    internal lazy var goToMainButton = UIButton().then {
        $0.backgroundColor = .tivingRed
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
        $0.layer.cornerRadius = 3
    }
}

