import UIKit

class ExampleViewController: UIViewController {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private let fistNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "첫 사람의 이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "두번째 사람의 이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.style()
    }

    
    func presentToSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .overFullScreen
        
        guard let firstName = self.fistNameTextField.text else {return}
        guard let secondName = self.secondNameTextField.text else {return}
        
        secondViewController.dataBind(firstName: firstName,
                                      secondName: secondName)
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        let secondViewController = SecondViewController()
        guard let firstName = self.fistNameTextField.text else {return}
        guard let secondName = self.secondNameTextField.text else {return}
        
        secondViewController.dataBind(firstName: firstName,
                                      secondName: secondName)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        pushToSecondViewController()
    }
    
}
private extension ExampleViewController {
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [nameLabel, fistNameTextField,
         presentButton, pushButton, secondNameTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([fistNameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     fistNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     fistNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     fistNameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([secondNameTextField.topAnchor.constraint(equalTo: fistNameTextField.bottomAnchor, constant: 20),
                                     secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     secondNameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}
