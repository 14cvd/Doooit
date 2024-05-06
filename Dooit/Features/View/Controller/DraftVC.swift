//
//  DraftVC.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import UIKit
import SnapKit

final class DraftVC: UIViewController {
    
    
    
    private lazy var listItemView : UIView  = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBlue
        let stack = UIStackView()
        stack.axis = .vertical
        let label = UILabel()
        label.text = "Daily To-do’s"
        label.font = UIFont(name: "Graphik", size: 20)
        stack.addArrangedSubview(label)
        let horizontalStack = UIStackView()
        let littleLabel1 = UILabel()
        littleLabel1.text = "Other"
    
        let littleLabel2 = UILabel()
        littleLabel2.text = "Other2"

        stack.spacing = 10
        horizontalStack.addArrangedSubview(littleLabel1)
        horizontalStack.addArrangedSubview(littleLabel2)

        stack.addArrangedSubview(horizontalStack)
        view.addSubview(stack)
       
        stack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
           
        }
        return view
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        configConstraint()

    
    }
}

private extension DraftVC {
    func config(){
        view.addSubview(listItemView)
    }
    func configConstraint(){
        listItemView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(86)
            make.width.equalTo(327)
        }
    }
}
