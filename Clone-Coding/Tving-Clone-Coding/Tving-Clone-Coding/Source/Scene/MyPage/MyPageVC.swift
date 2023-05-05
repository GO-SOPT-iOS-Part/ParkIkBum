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
        self.tableView.tableHeaderView = MyPageHeaderView(frame: .init(origin: .zero,
                                                                       size: .init(width: UIScreen.main.bounds.width,
                                                                                   height: 434)))
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
}
