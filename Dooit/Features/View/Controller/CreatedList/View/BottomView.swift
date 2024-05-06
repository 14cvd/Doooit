//
//  BottomView.swift
//  Dooit
//
//  Created by cavID on 02.05.24.
//

import UIKit

final class BottomView: UIView {
//    var isSelectedLabel : Bool = false
    var isSelectedLabel: Bool = false {
            didSet {
                // Stack içindeki tüm CategoryView nesnelerinin isSelected özelliğini güncelle
                for case let categoryView as CategoryView in stack.arrangedSubviews {
                    categoryView.isSelected = isSelectedLabel
                }
            }
        }
    private let  seperatorView:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "SeperatorColor")
        return view
    }()
    private lazy var bottomView : UIView = {
        let view = UIView()
        return view
    }()
    
    
    private lazy var stack:UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillEqually
        for item in Category.allValues {
            print(type(of: item))
            var c = CategoryView()
            c.text = item.rawValue
            c.isUserInteractionEnabled = true
            let gesture =  UITapGestureRecognizer(target: self, action: #selector(selectedLabel))
            c.addGestureRecognizer(gesture)
            print(c.addGestureRecognizer(gesture))
            stack.addArrangedSubview(c)
            
        }
        return stack
    }()
    @objc func selectedLabel(){
        print(isSelectedLabel)
        isSelectedLabel = !isSelectedLabel
    }
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Choose a label "
        label.font = UIFont(name: "Graphik", size: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension  BottomView {
    func config(){
        addSubview(bottomView)
        bottomView.addSubview(seperatorView)
        bottomView.addSubview(titleLabel)
        bottomView.addSubview(stack)
    }
    
    func configConstraint(){
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(28)
            make.leading.equalToSuperview()
        }
        bottomView.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalToSuperview()
        }
        seperatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(2)
        }
        stack.snp.makeConstraints { make in
            make.centerX.equalTo(bottomView)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(28)
            make.width.equalTo(bottomView.snp.width)
        }
        
    }
}
