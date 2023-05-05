//
//  HomeCaroucellCVC.swift
//  Tving-Clone-Coding
//
//  Created by 박익범 on 2023/05/05.
//

import UIKit

class HomeCaroucellCVC: UICollectionViewCell {
    private var data: [dataClass]?
    static let identifier: String = "HomeCaroucellCVC"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setLayuout()
        self.setCollectionViewConfig()
        setCollectionLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.setContentOffset(.init(x: UIScreen.main.bounds.width + 1,
                                              y: self.collectionView.contentOffset.y),
                                        animated: false)
    }
    
    
    internal func bindData(data: [dataClass]) {
        self.data = self.setCaroucellData(data: data)
        self.pageController.numberOfPages = data.count
    }
    
    private func setCaroucellData(data: [dataClass]) -> [dataClass] {
        var copyData = data
        copyData.append(data[0])
        copyData.insert(data[data.count - 1], at: 0)
        return copyData
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(CaroucellCVC.self,
                                     forCellWithReuseIdentifier: CaroucellCVC.identifier)
    }
    
    private func setCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: UIScreen.main.bounds.width,
                                height: ScreenUtils.getWidth(449))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func setLayuout() {
        self.addSubViews([self.collectionView, pageController])
        collectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        pageController.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(ScreenUtils.getWidth(-40))
            $0.bottom.equalToSuperview()
        }
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.contentInsetAdjustmentBehavior = .never
        $0.backgroundColor = .black
        $0.isPagingEnabled = true
    }
    private let pageController = UIPageControl().then {
        $0.transform = .init(scaleX: 0.5, y: 0.5)
        $0.currentPageIndicatorTintColor = .white
        $0.pageIndicatorTintColor = .tivingGray30
        $0.backgroundColor = .clear
    }
}
extension HomeCaroucellCVC: UICollectionViewDelegate {}
extension HomeCaroucellCVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = data {
            return data.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CaroucellCVC.identifier, for: indexPath) as? CaroucellCVC else {return UICollectionViewCell()}
        if let data = data {
            cell.bindData(image: data[indexPath.row].image)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let data = data {
            if scrollView.contentOffset.x == 0 {
                scrollView.setContentOffset(.init(x: UIScreen.main.bounds.width * CGFloat(data.count - 2), y: 0), animated: false)
            }
            else if scrollView.contentOffset.x == UIScreen.main.bounds.width * CGFloat(data.count - 1) {
                scrollView.setContentOffset(.init(x: UIScreen.main.bounds.width, y: 0), animated: false)
            }
        }
        
        if let indexPath = self.collectionView.indexPathForItem(at: .init(x: scrollView.contentOffset.x + (UIScreen.main.bounds.width / 2),
                                                                          y: UIScreen.main.bounds.height / 2)){
            print(indexPath)
            let row = indexPath.row - 1
            self.pageController.currentPage = row
        }
        
    }
}

