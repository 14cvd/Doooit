//
//  CreatedListVC.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import UIKit

final class CreatedListVC: UIViewController {
    var coordinator: CreatedListCoordinator?
   private lazy var leftIcon : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "arrow.left")
        iv.tintColor = .black
        iv.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
       iv.isUserInteractionEnabled = true
       let gestuer = UITapGestureRecognizer(target: self, action: #selector(backButton))
        iv.addGestureRecognizer(gestuer)
        return iv
        
    }()
    
    
    
    private lazy var rightView: UIView = {
        let view = UIView()
        let stack = UIStackView()
        let iv = UIImageView()
        iv.image = UIImage(systemName: "mappin")
        iv.tintColor = .white
        let label = UILabel()
        stack.backgroundColor = .black
        label.text = "Pinned"
        label.textColor = .white
        label.font = UIFont(name: "Graphik", size: 10)
        stack.addArrangedSubview(iv)
        stack.addArrangedSubview(label)
        
        view.addSubview(stack)
       
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        return view
    }()
    
    
    
    
    @objc func backButton(){
        print("bla bla bla ")
        coordinator?.navigationPop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        navigationController?.isNavigationBarHidden = true
        config()
        configConstraint()
       
  
    }
}


private extension CreatedListVC {
    func config(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftIcon)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightView )
    }
    func configConstraint(){
        rightView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(62)
        }
    }
    
}




final class rightView :UIView {
    let stack = UIStackView()
    let iv = UIImageView()
    iv.image = UIImage(systemName: "mappin")
    iv.tintColor = .white
    let label = UILabel()
    stack.backgroundColor = .black
    label.text = "Pinned"
    label.textColor = .white
    label.font = UIFont(name: "Graphik", size: 10)
    stack.addArrangedSubview(iv)
    stack.addArrangedSubview(label)
    
    view.addSubview(stack)
   
    stack.snp.makeConstraints { make in
        make.center.equalToSuperview()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


