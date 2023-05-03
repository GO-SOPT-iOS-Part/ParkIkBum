import UIKit

protocol GetNickNameDelegate {
    func getNickName(nickName: String)
}


class MakeNickNameVC: UIViewController {
    private var viewTranslation: CGPoint = .init(x: 0, y: 0)
    private var viewVelocity: CGPoint = .init(x: 0, y: 0)
    var delegate: GetNickNameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.addGestureInView()
        self.addSaveButtonTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.playMakeBackgroundAnimation()
    }

    private func setLayout() {
        self.view.backgroundColor = .clear
        self.view.addSubview(makeNickNameView)
        makeNickNameView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private let makeNickNameView = MakeNickNameView()
}
private extension MakeNickNameVC {
    private func addSaveButtonTarget() {
        self.makeNickNameView.saveButton.addTarget(self,
                                                   action: #selector(didSaveButtonTapped),
                                                   for: .touchUpInside)
    }
    
    @objc private func didSaveButtonTapped() {
        self.view.backgroundColor = .clear
        if let nickName = self.makeNickNameView.nickNameTextField.text {
            self.delegate?.getNickName(nickName: nickName)
        }
        self.dismiss(animated: true)
    }
    
}

private extension MakeNickNameVC {
    private func playRemoveBackgroundAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = .clear
        }
    }
    
    private func playMakeBackgroundAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = .black.withAlphaComponent(0.5)
        }
    }
    
    private func addGestureInView() {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didMove(_:)))
        self.makeNickNameView.addGestureRecognizer(gesture)
    }
    
    @objc private func didMove(_ sender: UIPanGestureRecognizer) {
        viewTranslation = sender.translation(in: self.makeNickNameView)
        viewVelocity = sender.translation(in: self.makeNickNameView)
        print(self.viewVelocity)
        switch sender.state {
        case .changed:
            if viewTranslation.y > 0 {
                self.makeNickNameView.transform = CGAffineTransform(translationX: 0, y: viewTranslation.y)
            }
        case .ended:
            if viewTranslation.y < self.makeNickNameView.frame.height / 4 {
                UIView.animate(withDuration: 0.3, delay: 0) {
                    self.makeNickNameView.transform = .identity
                }
            } else {
                self.dismiss(animated: false)
            }
        default:
            break
        }
    }
    
}
