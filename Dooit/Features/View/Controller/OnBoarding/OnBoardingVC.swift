//
//  OnBoardingVC.swift
//  Dooit
//
//  Created by cavID on 30.04.24.
//

import UIKit
import SnapKit

final class OnBoardingVC: UIViewController {
    var coordinator : RootCoordinator?
    private let iconImage : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "Icon")
        
        return iv
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Graphik", size: 40)
        label.text = "Dooit"
        label.textColor = .white
        return label
    }()
    private let subTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Graphik", size: 19)
        label.textAlignment = .center
        label.text = "Write what you need to do. Everyday"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "SubTitleLabelColor")
        return label
    }()
    private lazy var  stack : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.addArrangedSubview(iconImage)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subTitleLabel)
        return stack
    }()
    
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Graphik", size: 16)
        button.layer.cornerRadius = 20
        let action = UIAction { _ in
            self.coordinator?.showMainView()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        config()
        configConstraint()
    }
}

private extension OnBoardingVC {
    func config(){
        view.addSubview(stack)
        view.addSubview(button)
    }
    func configConstraint(){
        stack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(93)
            make.trailing.equalTo(-93)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.bottom.equalTo(additionalSafeAreaInsets).offset(-70)
            make.leading.equalTo(88)
            make.trailing.equalTo(-88)
        }
    }
}
