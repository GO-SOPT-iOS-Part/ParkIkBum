import UIKit
import Kingfisher

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
    
    internal func bindData(image: String) {
        guard let url = URL(string: image) else {return}
        self.thumbnailImageView.kf.setImage(with: url)
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
