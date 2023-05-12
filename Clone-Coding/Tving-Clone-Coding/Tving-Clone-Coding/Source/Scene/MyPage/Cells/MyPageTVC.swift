import UIKit
import SnapKit
import Then

class MyPageTVC: UITableViewCell {
    static let identifier: String = "MyPageTVC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
    }
    
    internal func bindData(title: String) {
        self.titleLabel.text = title
    }
    
    private func setLayout() {
        self.contentView.backgroundColor = .black
        self.contentView.addSubViews([titleLabel, arrowButton])
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(ScreenUtils.getWidth(17))
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(18))
            $0.trailing.equalTo(self.arrowButton.snp.leading)
        }
        arrowButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(ScreenUtils.getWidth(18))
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(ScreenUtils.getWidth(18))
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .pretendedMediumFont(ofSize: 15)
        $0.textColor = .tivingGray20
    }
    
    private lazy var arrowButton = UIButton().then {
        $0.setImage(ImageLiterals.icArrow, for: .normal)
    }


}
