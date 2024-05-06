//
//  PinnedVC.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import UIKit
import SnapKit

final class PinnedVC: UIViewController {
    private let image : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "Ooops")
        return iv
    }()
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Graphik", size: 20)
        label.textColor = .black
        label.text = "Ooops! No pinned list yet..."
        return label
    }()
    
    
    private let button : UIButton = {
       let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("New List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Graphik", size: 14)
        button.layer.cornerRadius = 10
        let iv = UIImageView()
        iv.image = UIImage(systemName: "plus")
        iv.tintColor = .white
        button.addSubview(iv)
        iv.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(16)
            make.leading.equalToSuperview().inset(12)
        }
        let action = UIAction { _ in
            print("buttom clicked")
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        configureConstraint()

    }

}
private extension PinnedVC {
    func config(){
         view.addSubview(image)
         view.addSubview(titleLabel)
         view.addSubview(button)
     }
    
    func configureConstraint(){
      image.snp.makeConstraints { make in
          make.center.equalToSuperview()
      }
      titleLabel.snp.makeConstraints { make in
          make.centerX.equalToSuperview()
          make.top.equalTo(image.snp.bottom).offset(90)
      }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(28)
            make.height.equalTo(45)
            make.width.equalTo(127)
        }
    }
}
