import UIKit

class MyPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    private func setTableViewConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MyPageTVC.self, forCellReuseIdentifier: MyPageTVC.identifier)
        self.tableView.register(MyPageSectionHeader.self,
                                forHeaderFooterViewReuseIdentifier: MyPageSectionHeader.identifier)
        let myPageHeaderView = MyPageHeaderView(frame: .init(origin: .zero,
                                                             size: .init(width: UIScreen.main.bounds.width,
                                                                         height: 434)))
        self.tableView.tableHeaderView = myPageHeaderView
        myPageHeaderView.didBackButtonTappedCompletion = { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.navigationController?.popViewController(animated: true)
            
        }
        
        self.tableView.tableFooterView = MyPageFooterView(frame: .init(origin: .zero,
                                                                       size: .init(width: UIScreen.main.bounds.width,
                                                                                   height: ScreenUtils.getWidth(55))))
        self.tableView.contentInset = .init(top: 0, left: 0, bottom: 100, right: 0)
    }
    
    private func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .black
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private let tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .black
        $0.separatorStyle = .none
        $0.contentInsetAdjustmentBehavior = .never
    }

}

extension MyPageVC: UITableViewDelegate {}
extension MyPageVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return myPageMokData.data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageMokData.data[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTVC.identifier) as? MyPageTVC else {return UITableViewCell()}
        cell.bindData(title: myPageMokData.data[indexPath.section].data[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageSectionHeader.identifier) as? MyPageSectionHeader else {return UIView()}
            return header
        } else {
            return nil
        }
    }
}
