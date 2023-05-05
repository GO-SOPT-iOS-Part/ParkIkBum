import UIKit

class CaroucellCVC: UICollectionViewCell {
    static let identifier: String = "CaroucellCVC"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbnailImageView.image = nil
    }
    
    internal func bindData(image: UIImage) {
        self.thumbnailImageView.image = image
    }
    
    private func setLayout() {
        self.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
}
