//
//  SeriesVideoCVC.swift
//  Tving-Clone-Coding
//
//  Created by 박익범 on 2023/05/05.
//

import UIKit

class SeriesVideoCVC: UICollectionViewCell {
    static let identifier: String = "SeriesVideoCVC"
    
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
        self.titleLabel.text = ""
    }
    
    internal func bindData(image: String,
                           title: String) {
        guard let url = URL(string: image) else {return}
        self.thumbnailImageView.kf.setImage(with: url)
        self.titleLabel.text = title
    }
    
    private func setLayout() {
        self.contentView.addSubViews([thumbnailImageView, titleLabel])
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.thumbnailImageView.snp.bottom).offset(ScreenUtils.getWidth(3))
            $0.leading.equalTo(self.thumbnailImageView.snp.leading)
            $0.bottom.equalToSuperview()
        }
    }
    
    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = ScreenUtils.getWidth(3)
    }
    private let titleLabel = UILabel().then {
        $0.font = .pretendedMediumFont(ofSize: 10)
        $0.textColor = .tivingGray20
    }
}
