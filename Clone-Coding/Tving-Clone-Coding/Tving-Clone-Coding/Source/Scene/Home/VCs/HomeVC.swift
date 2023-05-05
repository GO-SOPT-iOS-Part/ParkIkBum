import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setCollectionViewConfig()
        self.setCollectionViewLayout()
    }
    
    
    private func setCollectionViewConfig() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(HomeCaroucellCVC.self,
                                     forCellWithReuseIdentifier: HomeCaroucellCVC.identifier)
        self.collectionView.register(LiveChannelCVC.self,
                                     forCellWithReuseIdentifier: LiveChannelCVC.identifier)
        self.collectionView.register(BannerCVC.self,
                                     forCellWithReuseIdentifier: BannerCVC.identifier)
        self.collectionView.register(SeriesVideoCVC.self,
                                     forCellWithReuseIdentifier: SeriesVideoCVC.identifier)
        self.collectionView.register(HomeCollectionSectionHeaderView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: HomeCollectionSectionHeaderView.identifier)
        
    }
    
    private func setCollectionViewLayout() {
        self.collectionView.setCollectionViewLayout(getLayout(), animated: false)
    }
    
    private func pushToMyPageView() {
        let myPageVC = MyPageVC()
        self.navigationController?.pushViewController(myPageVC, animated: true)
    }
    
    private func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubViews([collectionView, navigationView])
        collectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(ScreenUtils.getWidth(94))
        }
        self.navigationView.profileTappedCompletion = { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.pushToMyPageView()
        }
    }
    
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.backgroundColor = UIColor.black
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
    private let navigationView = HomeNavigationView()
    
    func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(ScreenUtils.getWidth(498))
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = .init(top: 0, leading: 0, bottom: 40, trailing: 0)
                return section
            case 1, 3, 5:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 8)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.3),
                    heightDimension: .fractionalHeight(0.2)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(ScreenUtils.getWidth(30)))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.contentInsets = .init(top: 20, leading: 12, bottom: 14, trailing: 0)
                
                section.boundarySupplementaryItems = [sectionHeader]
                section.orthogonalScrollingBehavior = .continuous
                return section
                
            case 2:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 8)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.4),
                    heightDimension: .estimated(133)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(ScreenUtils.getWidth(30)))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.contentInsets = .init(top: 20, leading: 12, bottom: 10, trailing: 0)
                section.boundarySupplementaryItems = [sectionHeader]
                section.orthogonalScrollingBehavior = .continuous

                return section
                
            default:
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(58)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 49, leading: 0, bottom: 38, trailing: 0)
                return section
            }
        }
    }
}

extension HomeVC: UICollectionViewDelegate {
    
}
extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeMokData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: HomeCollectionSectionHeaderView.identifier,
                                                                           for: indexPath) as? HomeCollectionSectionHeaderView else {return UICollectionReusableView()}
        header.bindData(title: homeMokData.data[indexPath.section].sectionTitle)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return homeMokData.data[section].data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let caroucell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCaroucellCVC.identifier, for: indexPath) as? HomeCaroucellCVC else {return UICollectionViewCell()}
        guard let seriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesVideoCVC.identifier, for: indexPath) as? SeriesVideoCVC else {return UICollectionViewCell()}
        guard let liveChanelCell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveChannelCVC.identifier, for: indexPath) as? LiveChannelCVC else {return UICollectionViewCell()}
        guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVC.identifier, for: indexPath) as? BannerCVC else {return UICollectionViewCell()}
        
        let data = homeMokData.data[indexPath.section].data[indexPath.row]
        switch indexPath.section {
        case 0:
            caroucell.bindData(data: homeMokData.data[indexPath.section].data)
            return caroucell
        case 1, 3, 5:
            seriesCell.bindData(image: data.image,
                                title: data.title)
            return seriesCell
        case 2:
            if let rank = data.rank, let maker = data.maker, let rating = data.rating {
                liveChanelCell.bindData(image: data.image,
                                        rank: rank,
                                        makers: maker,
                                        title: data.title,
                                        rating: rating)
            }
            return liveChanelCell
        default:
            return bannerCell
        }
    }
    
}
