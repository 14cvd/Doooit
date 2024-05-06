//
//  CategoryView.swift
//  Dooit
//
//  Created by cavID on 02.05.24.
//

import UIKit
import SnapKit

final class CategoryView: UIView {
    var text : String? {
        didSet {
            label.text = text ?? ""
        }
    }
    
    var isSelected: Bool = false {
        didSet{
            labelViews.backgroundColor = isSelected  ? .black : .systemGray3
        }
    }
    private let labelViews: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GraphikLight", size: 12)
        label.textColor = .white
        label.layer.cornerRadius = 2
        label.textAlignment = .center
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



private extension CategoryView {
    func config(){
        addSubview(labelViews)
        labelViews.addSubview(label)
    }
    func configConstraint(){
        labelViews.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        label.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
        }
        
        
    }
}
