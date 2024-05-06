//
//  CustomCratedCell.swift
//  Dooit
//
//  Created by cavID on 03.05.24.
//

import UIKit

class CustomCratedCell: UITableViewCell {
    var isSelectedCheckBox : Bool = false

    static let id : String = "\(CustomCratedCell.self)"
    private let imageV : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "text.justify")
        iv.tintColor = .black
        return iv
    }()
    
    private lazy var checkBox : CheckBoxView = {
        let checkBox = CheckBoxView()
        checkBox.isUserInteractionEnabled = true
        let gesture  = UITapGestureRecognizer(target: self, action: #selector(changeCheckBox))
        checkBox.addGestureRecognizer(gesture)
        return checkBox
    }()
    
    
    @objc func changeCheckBox(){
        checkBox.isSelected = !checkBox.isSelected
    }
    private lazy var subTitleLabel : UITextField = {
        let tf = UITextField()
        tf.placeholder = "To-do"
        tf.font = UIFont(name: "Graphik", size: 20)
        tf.textColor = .systemGray3
        tf.delegate = self
      
//        tf.lineBreakMode = .byWordWrapping
        return tf
    }()
    
    private lazy var  stack : UIStackView = {
       let stack = UIStackView()
        stack.addArrangedSubview(imageV)
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(subTitleLabel)
//        stack.backgroundColor = .green
        stack.spacing = 10
        stack.alignment = .leading

        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
        configConstraint()
//        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



private extension CustomCratedCell {
    func config(){
        contentView.addSubview(stack)
    }
    func configConstraint(){

        
        stack.snp.makeConstraints { make in
                  make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
              }
              
              // ImageView boyutunu belirtin
              imageV.snp.makeConstraints { make in
                  make.size.equalTo(20)
              }
              
              // CheckBox boyutunu belirtin
              checkBox.snp.makeConstraints { make in
                  make.size.equalTo(CGSize(width: 20, height: 20))
              }
        
    }
}

extension CustomCratedCell : UITextFieldDelegate {
    
  
    
    
}
