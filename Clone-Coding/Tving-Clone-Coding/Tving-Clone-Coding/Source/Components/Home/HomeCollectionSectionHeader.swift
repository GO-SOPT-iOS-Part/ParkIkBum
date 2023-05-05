import UIKit
import SnapKit
import Then

class HomeCollectionSectionHeaderView: UICollectionReusableView {
    static let identifier: String = "HomeCollectionSectionHeaderView"
    var didButtonTappedCompeletion: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
        self.showAllButton.setTitle("", for: .normal)
    }
    
    internal func bindData(title: String) {
        self.titleLabel.text = title
    }
    
    @objc private func didShowAllButtonTapped() {
        guard let completion = didButtonTappedCompeletion else {return}
        completion()
    }
    
    private func setLayout() {
        self.addSubViews([titleLabel, showAllButton])
        titleLabel.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        showAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(5))
            $0.centerY.equalToSuperview()
            $0.width.equalTo(ScreenUtils.getWidth(54))
            $0.height.equalTo(ScreenUtils.getWidth(20))
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .pretendedSemiBoldFont(ofSize: 15)
        $0.textColor = .white
        $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
    }
    private lazy var showAllButton = UIButton().then {
        $0.setTitle("전체보기 >", for: .normal)
        $0.setTitleColor(.tivingGray30, for: .normal)
        $0.titleLabel?.font = .pretendedMediumFont(ofSize: 12)
        $0.addTarget(self,
                     action: #selector(self.didShowAllButtonTapped),
                     for: .touchUpInside)
    }
}
