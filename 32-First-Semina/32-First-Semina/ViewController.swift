//
//  ViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 김승찬 on 2023/01/16.
//

import UIKit

final class ViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "솝트에 오신 여러분 환영합니다!"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

private extension ViewController {
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat]) {
            self.nameLabel.transform = .init(rotationAngle: .pi).concatenating(CGAffineTransform.init(scaleX: 2, y: 2))
        }
        
    }
}
