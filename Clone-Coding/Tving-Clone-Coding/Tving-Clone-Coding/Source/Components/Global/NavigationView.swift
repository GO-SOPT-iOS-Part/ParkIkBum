import UIKit
import Then
import SnapKit

class NavigationView: UIView {
    var navigationController: UINavigationController?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(navigationController: UINavigationController) {
        super.init(frame: .zero)
        self.navigationController = navigationController
    }
    
    private func setLayout() {
        self.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(ScreenUtils.getWidth(24))
            $0.width.height.equalTo(ScreenUtils.getWidth(24))
        }
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(ImageLiterals.icBack, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFill
        $0.addTarget(self,
                     action: #selector(didBackButtonTapped),
                     for: .touchUpInside)
    }
    
    @objc private func didBackButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

