//
//  MainVC.swift
//  Dooit
//
//  Created by cavID on 30.04.24.
//

import UIKit
import SnapKit

final class MainVC: UIViewController {
    var coordinator : MainCoordinator? {
        didSet {
            print("\(coordinator!)")
        }
    }
    private var selectedIndex : Int = 0
    private var viewControllers = [UIViewController]()
    private lazy var pageViewController : UIPageViewController = {
        let pvc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pvc.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        pvc.dataSource = self
        pvc.delegate = self
        addChild(pvc)
        pvc.didMove(toParent: self)
        return pvc
    }()
    private let leftNavigationIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "LeftImage")
        return iv
    }()
    private let leftNavigationTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Graphik", size: 20)
        label.text = "Dooit"
        label.textColor = .black
        return label
    }()
    private lazy var  rightNavigationIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "magnifyingglass")
        iv.tintColor = .black
        iv.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(searchAction))
        iv.addGestureRecognizer(gesture)
        iv.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        return iv
    }()
    
    private lazy var segmentedController : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All List", "Pinned"])
        let defaultAttribute : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor:UIColor(named: "SubTitleLabelColor")!,
                                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        let selectedAttribute : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]
        
        sc.setTitleTextAttributes(defaultAttribute , for: .normal)
        sc.setTitleTextAttributes(selectedAttribute, for: .selected)
        sc.selectedSegmentIndex = selectedIndex
        sc.selectedSegmentTintColor = .black
        sc.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        return sc
    }()
    
    @objc func changeValue(_ sender : UISegmentedControl){
        
        let direction: UIPageViewController.NavigationDirection
        if selectedIndex < sender.selectedSegmentIndex {
            direction = .reverse
        } else {
            direction = .forward
        }
        selectedIndex = sender.selectedSegmentIndex
        pageViewController.setViewControllers([viewControllers[sender.selectedSegmentIndex]], direction: direction, animated: true, completion: nil)
    }
    
    public init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        configureNavigationBar()
        configureConstraint()
    }
}
private extension MainVC {
    func config(){
        view.addSubview(pageViewController.view)
        view.addSubview(segmentedController)
        
    }
    func configureNavigationBar(){
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: leftNavigationIcon) , UIBarButtonItem(customView: leftNavigationTitle)]
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavigationIcon)
    }
    
    @objc private func searchAction() {
        print("search Action")
        coordinator?.showSearchView()
    }
    func configureConstraint(){
        segmentedController.snp.makeConstraints { make in
            make.height.equalTo(47)
            make.width.equalTo(327)
            make.top.equalTo(additionalSafeAreaInsets.bottom).offset(120)
            make.centerX.equalToSuperview()
        }
    }
}

extension MainVC : UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = index + 1
        
        print("nextIndex : \(nextIndex)")
        
        segmentedController.selectedSegmentIndex = index
        guard nextIndex < viewControllers.count else {
            return nil
        }
        return viewControllers[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = index - 1
        print("previousIndex : \(previousIndex)")
        guard previousIndex >= 0 else {
            return nil
        }
        return viewControllers[previousIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        segmentedController.selectedSegmentIndex = selectedIndex
    }
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let newIndex = viewControllers.firstIndex(of: pendingViewControllers.first!) {
            selectedIndex = newIndex
        }
    }
}
