import UIKit

class MyPageSectionHeader: UITableViewHeaderFooterView {
    static let identifier: String = "MyPageSectionHeader"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    private func setLayout() {
        self.addSubview(divideView)
        divideView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private var divideView = UIView().then {
        $0.backgroundColor = .tivingGray40
    }


}
