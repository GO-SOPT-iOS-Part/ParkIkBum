import Foundation
import UIKit

class HomeNavigationView: UIView {
    var profileTappedCompletion: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    private func setLayout() {
        self.addSubViews([logoImageView, profileImageView])
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(11))
            $0.width.equalTo(ScreenUtils.getWidth(100))
            $0.height.equalTo(ScreenUtils.getWidth(25))
        }
        profileImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.logoImageView)
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(9))
            $0.width.height.equalTo(ScreenUtils.getWidth(33))
        }
    }
    
    @objc private func didProfileButtonTapped() {
        guard let completion = profileTappedCompletion else {return}
        completion()
    }
    
    private let logoImageView = UIImageView(image: ImageLiterals.icLogo)
    private lazy var profileImageView = UIImageView(image: ImageLiterals.icProfile).then {
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                       action: #selector(didProfileButtonTapped)))
    }
}
