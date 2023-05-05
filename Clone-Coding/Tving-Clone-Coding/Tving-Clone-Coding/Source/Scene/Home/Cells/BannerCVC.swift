//
//  BannerCVC.swift
//  Tving-Clone-Coding
//
//  Created by 박익범 on 2023/05/05.
//

import UIKit

class BannerCVC: UICollectionViewCell {
    static let identifier: String = "BannerCVC"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayout()
    }
    private func setLayout() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    private let imageView = UIImageView(image: ImageLiterals.banner)
}
