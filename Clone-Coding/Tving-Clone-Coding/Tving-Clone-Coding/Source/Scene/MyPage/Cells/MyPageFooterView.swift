import UIKit

class MyPageFooterView: UITableViewHeaderFooterView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    private func setLayout() {
        self.addSubview(logoutButton)
        logoutButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(8))
            $0.height.equalTo(ScreenUtils.getWidth(55))
            $0.top.bottom.equalToSuperview()
        }
    }
    
    private let logoutButton = UIButton().then {
        $0.layer.borderColor = UIColor.tivingGray40.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.tivingGray30, for: .normal)
        $0.titleLabel?.font = .pretendedMediumFont(ofSize: 14)
    }


}
