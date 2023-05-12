//
//  LiveChannelCVC.swift
//  Tving-Clone-Coding
//
//  Created by 박익범 on 2023/05/05.
//

import UIKit

class LiveChannelCVC: UICollectionViewCell {
    static let identifier: String = "LiveChannelCVC"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayout()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbnailImageview.image = nil
        self.rankNumLabel.text = ""
        self.makersLabel.text = ""
        self.titleLabel.text = ""
        self.ratingLabel.text = ""
    }
    
    internal func bindData(image: UIImage,
                           rank: Int,
                           makers: String,
                           title: String,
                           rating: Float) {
        self.titleLabel.text = title
        self.thumbnailImageview.image = image
        self.rankNumLabel.text = "\(rank)"
        self.makersLabel.text = makers
        self.ratingLabel.text = "\(rating)%"
    }
    
    private func setLayout() {
        self.addSubViews([thumbnailImageview, rankNumLabel, stackView])
        thumbnailImageview.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        thumbnailImageview.clipsToBounds = true
        rankNumLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(6))
            $0.top.equalTo(self.thumbnailImageview.snp.bottom).offset(ScreenUtils.getWidth(8))
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(self.thumbnailImageview.snp.bottom).offset(ScreenUtils.getWidth(11))
            $0.leading.equalTo(self.rankNumLabel.snp.trailing).offset(ScreenUtils.getWidth(2))
            $0.trailing.equalTo(self.thumbnailImageview.snp.trailing)
            $0.bottom.equalToSuperview()
        }
        stackView.addArrangeSubviews([makersLabel, titleLabel, ratingLabel])
    }
    
    private let thumbnailImageview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 3
    }
    private let rankNumLabel = UILabel().then {
        $0.font = .pretendeBoldFont(ofSize: 19)
        $0.textColor = .white
    }
    private let stackView = UIStackView().then {
        $0.alignment = .leading
        $0.spacing = 0
        $0.distribution = .fillEqually
        $0.axis = .vertical
    }
    private let makersLabel = UILabel().then {
        $0.font = .pretendedRegularFont(ofSize: 10)
        $0.textColor = .white
    }
    private let titleLabel = UILabel().then {
        $0.font = .pretendedRegularFont(ofSize: 10)
        $0.textColor = .tivingGray20
    }
    private let ratingLabel = UILabel().then {
        $0.font = .pretendedRegularFont(ofSize: 10)
        $0.textColor = .tivingGray20
    }
    
    
}
