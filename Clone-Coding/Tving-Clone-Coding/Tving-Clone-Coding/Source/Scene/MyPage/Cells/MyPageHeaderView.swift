import UIKit

class MyPageHeaderView: UITableViewHeaderFooterView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setLabelConfig()
        self.setLayout()
    }
    
    private func setLabelConfig() {
        self.infoLabel.do {
            let firstString = NSAttributedString(string: "이용권을 구매하고 ")
            let tvnImage = NSAttributedString(attachment: self.tvnSubscription)
            let jtbcImage = NSAttributedString(attachment: self.jtvcSubscription)
            let secondString = NSAttributedString(string: "등 인기 TV프로그램과 다양한 영화 콘텐츠를 자유롭게 시청하세요!")
            $0.labelWithImg(composition: firstString, tvnImage, jtbcImage, secondString, spacing: 5)
        }
    }
    
    
    private func setLayout() {
        self.contentView.backgroundColor = .black
        self.contentView.addSubViews([backButton, notiButton, settingButton, profileImageView, nickNameLabel, changeProfileButton, playerContentView, purchaseTicketContentView])
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(ScreenUtils.getWidth(24))
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(self.backButton)
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(25))
            $0.width.height.equalTo(ScreenUtils.getWidth(33))
        }
        
        notiButton.snp.makeConstraints {
            $0.centerY.equalTo(self.backButton)
            $0.trailing.equalTo(self.settingButton.snp.leading)
            $0.width.height.equalTo(ScreenUtils.getWidth(33))
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.backButton.snp.bottom).offset(ScreenUtils.getWidth(35))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(24))
            $0.width.height.equalTo(ScreenUtils.getWidth(74))
        }
        nickNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.profileImageView)
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(ScreenUtils.getWidth(22))
            $0.trailing.equalTo(self.changeProfileButton.snp.leading)
        }
        changeProfileButton.snp.makeConstraints {
            $0.centerY.equalTo(self.profileImageView)
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(23))
            $0.width.equalTo(ScreenUtils.getWidth(70))
            $0.height.equalTo(ScreenUtils.getWidth(25))
        }
        
        playerContentView.snp.makeConstraints {
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(ScreenUtils.getWidth(30))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(10))
            $0.height.equalTo(ScreenUtils.getWidth(92))
        }
        playerContentView.addSubViews([myPlayerButton, currentMyplayerLabel, tivingCashButton, currentCash])
        myPlayerButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ScreenUtils.getWidth(18))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(11))
            $0.height.equalTo(ScreenUtils.getWidth(25))
            $0.width.equalTo(ScreenUtils.getWidth(100))
        }
        currentMyplayerLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.myPlayerButton)
            $0.leading.equalTo(self.myPlayerButton.snp.trailing)
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(13))
        }
        tivingCashButton.snp.makeConstraints {
            $0.top.equalTo(self.myPlayerButton.snp.bottom).offset(ScreenUtils.getWidth(20))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(11))
            $0.bottom.equalToSuperview().inset(ScreenUtils.getWidth(16))
            $0.height.equalTo(ScreenUtils.getWidth(25))
            $0.width.equalTo(ScreenUtils.getWidth(80))
        }
        currentCash.snp.makeConstraints {
            $0.centerY.equalTo(self.tivingCashButton)
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(11))
            $0.leading.equalTo(self.tivingCashButton.snp.trailing)
        }
        
        
        purchaseTicketContentView.addSubViews([infoLabel, arrowButton])
        purchaseTicketContentView.snp.makeConstraints {
            $0.top.equalTo(self.playerContentView.snp.bottom).offset(ScreenUtils.getWidth(12))
            $0.leading.trailing.equalToSuperview().inset(ScreenUtils.getWidth(10))
            $0.height.equalTo(ScreenUtils.getWidth(60))
            $0.bottom.equalToSuperview().inset(ScreenUtils.getWidth(24))
        }
        infoLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(ScreenUtils.getWidth(11))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(18))
            $0.trailing.equalTo(self.arrowButton.snp.leading).inset(ScreenUtils.getWidth(-44))
        }
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(13))
            $0.width.height.equalTo(ScreenUtils.getWidth(18))
        }
        
    }
    
    private let backButton = UIButton().then {
        $0.setImage(ImageLiterals.icBack, for: .normal)
    }
    private let notiButton = UIButton().then {
        $0.setImage(ImageLiterals.icNoti, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFill
    }
    private let settingButton = UIButton().then {
        $0.setImage(ImageLiterals.icSetting, for: .normal)
    }
    
    private let profileImageView = UIImageView(image: ImageLiterals.icProfile)
    private let nickNameLabel = UILabel().then {
        $0.font = .pretendedMediumFont(ofSize: 17)
        $0.textColor = .white
        $0.text = "ikbum"
    }
    private let changeProfileButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendedMediumFont(ofSize: 10)
        $0.layer.cornerRadius = 2
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
    }
    
    //이용권
    private let playerContentView = UIView().then {
        $0.backgroundColor = .tivingGray50
        $0.layer.cornerRadius = 3
    }
    private let myPlayerButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.setImage(ImageLiterals.icTicket, for: .normal)
        $0.setTitle("  나의 이용권", for: .normal)
        $0.setTitleColor(.tivingGray30, for: .normal)
        $0.titleLabel?.font = .pretendedMediumFont(ofSize: 13)
    }
    private let currentMyplayerLabel = UILabel().then {
        $0.text = "사용중인 이용권이 없습니다."
        $0.font = .pretendedMediumFont(ofSize: 13)
        $0.textColor = .tivingGray30
        $0.textAlignment = .right
    }
    private let tivingCashButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.setImage(ImageLiterals.icCash, for: .normal)
        $0.setTitle("  티빙캐시", for: .normal)
        $0.setTitleColor(.tivingGray30, for: .normal)
        $0.titleLabel?.font = .pretendedMediumFont(ofSize: 13)
        $0.imageView?.contentMode = .scaleAspectFill
    }
    private let currentCash = UILabel().then {
        $0.text = "0"
        $0.font = .pretendedMediumFont(ofSize: 13)
        $0.textColor = .white
        $0.textAlignment = .right
    }
    
    //이용권 구매 안내
    private let purchaseTicketContentView = UIView().then {
        $0.backgroundColor = .tivingGray50
        $0.layer.cornerRadius = 3
    }
    private let tvnSubscription = NSTextAttachment(image: ImageLiterals.icTvN)
    private let jtvcSubscription = NSTextAttachment(image: ImageLiterals.icJtvc)
    private let infoLabel = UILabel().then {
        $0.font = .pretendedSemiBoldFont(ofSize: 12)
        $0.textColor = .tivingGray20
        $0.numberOfLines = 0
    }
    private let arrowButton = UIButton().then {
        $0.setImage(ImageLiterals.icArrow, for: .normal)
    }

}
