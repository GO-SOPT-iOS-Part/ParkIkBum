import UIKit

class MakeNickNameView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    private func setLayout() {
        self.backgroundColor = .clear
        self.addSubViews([backGroundView, handleView])
        backGroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height / 2)
        }
        handleView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(ScreenUtils.getWidth(56))
            $0.height.equalTo(ScreenUtils.getWidth(7))
            $0.bottom.equalTo(self.backGroundView.snp.top).inset(ScreenUtils.getWidth(-15))
        }
        backGroundView.addSubViews([titleLabel, nickNameTextField, saveButton])
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ScreenUtils.getWidth(50))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(20))
        }
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(ScreenUtils.getWidth(21))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.height.equalTo(ScreenUtils.getWidth(52))
        }
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaInsets).inset(ScreenUtils.getWidth(20))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(20))
            $0.height.equalTo(ScreenUtils.getWidth(52))
        }
    }
    
    internal let backGroundView = UIView().then {
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    private let handleView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
    }
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = .pretendedMediumFont(ofSize: 23)
    }
    internal let nickNameTextField = BaseTextField().then {
        $0.textColor = .black
        $0.layer.cornerRadius = 3
        $0.backgroundColor = .tivingGray20
    }
    internal let saveButton = UIButton().then {
        $0.backgroundColor = .tivingRed
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .pretendedSemiBoldFont(ofSize: 14)
    }
}
