//
//  CheckBoxView.swift
//  Dooit
//
//  Created by cavID on 03.05.24.
//

import UIKit
import SnapKit

class CheckBoxView: UIView {
    var isSelected:Bool = false {
        didSet{
            checkBoxView.image = isSelected ? UIImage(systemName: "checkmark.square") :  UIImage(systemName: "square")
        }
    }
    private lazy var checkBoxView : UIImageView = {
        let iv = UIImageView()
        iv.image =  UIImage(systemName: "square")
        iv.tintColor = .black
        return iv
         
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(checkBoxView)
        checkBoxView.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
