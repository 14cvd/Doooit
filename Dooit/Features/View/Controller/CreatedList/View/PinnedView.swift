//
//  PinnedView.swift
//  Dooit
//
//  Created by cavID on 02.05.24.
//

import UIKit
import SnapKit

final class PinnedView: UIView {
    
    var isPinned:Bool = false {
        didSet{
            image.tintColor = (isPinned) ? .white :  .black
            label.text = (isPinned) ? "Pinned" : "Pin"
            label.textColor = (isPinned) ? .white : .black
            backgroundColor = (isPinned) ? .black : .white
            setNeedsLayout()
        }
        
    }
    
    private lazy var stack : UIStackView = {
    let stack = UIStackView()
        stack.alignment = .center
       return stack
    }()
    
    
    private lazy var image : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "mappin")
        iv.tintColor = .black
    
        return iv
    }()
    
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Pin"
            label.font = UIFont(name: "Graphik", size: 10)
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




private extension PinnedView {
    func config(){
        layer.borderWidth = 1
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(label)
        addSubview(stack)
    }
    
    func configConstraint(){
        layer.cornerRadius = 5
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.size.equalTo(15)
        }
      
        
    }
}
