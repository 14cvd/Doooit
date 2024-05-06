//
//  CreatedListVC.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import UIKit

final class CreatedListVC: UIViewController {
    var isPinned:Bool = false
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
    
    private lazy var rightView: PinnedView = {
        let view = PinnedView()
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(pinnedFunc))
        
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    
    @objc func pinnedFunc(){
        print(isPinned)
        isPinned = !isPinned
        rightView.isPinned = isPinned
        
    }
    private lazy var bottomView: BottomView = BottomView()
    private lazy var titleLabel : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Title"
        tf.textColor = .black
        tf.font = UIFont(name: "Graphik", size: 24)
        tf.delegate = self
        return tf
    }()
    
    @objc func backButton(){
        coordinator?.navigationPop()
    }
    
    
    private lazy var customTableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .red
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        tv.register(CustomCratedCell.self, forCellReuseIdentifier: CustomCratedCell.id)
        tv.reloadData()
        return tv
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        configConstraint()
        
        
    }
}


private extension CreatedListVC {
    func config(){
        
        
        view.addSubview(titleLabel)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftIcon)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightView )
        view.addSubview(customTableView)
        
        view.addSubview(bottomView)
    }
    func configConstraint(){
        
        
        rightView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(62)
        }
        bottomView.snp.makeConstraints { make in
            make.bottom.equalTo(additionalSafeAreaInsets).offset(-200)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.top.equalTo(110)
        }
        
        customTableView.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(bottomView).offset(-18)
            make.trailing.equalTo(-25)
            
        }
    }
}


extension CreatedListVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCratedCell.id, for: indexPath) as? CustomCratedCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        print(indexPath.row)
        return cell
    }
}

extension CreatedListVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Klavyeyi kapat
        print("Girilen metin: \(textField.text ?? "")") // Girilen metni göster
        return true
        
    }
}



