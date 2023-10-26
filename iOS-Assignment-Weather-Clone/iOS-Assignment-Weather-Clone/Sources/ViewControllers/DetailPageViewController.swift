//
//  PageViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/17/23.
//

import UIKit
import SnapKit
import Then

class DetailPageViewController: UIViewController {
    
    // MARK: - Properties
    var viewControllersArray: [DetailViewController] = []
    
    // MARK: - UI Components
    var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let toolbar = UIToolbar()
    private let mapButton = UIButton().then {
        $0.setImage(UIImage(named: "mapIcon"), for: .normal)
    }
    private let listButton = UIButton().then {
        $0.setImage(UIImage(named: "listIcon"), for: .normal)
    }
    private var pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = .white
        $0.backgroundColor = .clear
        $0.setIndicatorImage(UIImage(named: "arrowIcon"), forPage: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageVC.dataSource = self
        pageVC.delegate = self
        setupUI()
    }
    
    // MARK: - @IBAction Properties
    @objc func popToMainVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func pageControltapped(_ sender: UIPageControl) {
        pageVC.setViewControllers([viewControllersArray[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
}

// MARK: - Extensions
extension DetailPageViewController {
    // UI 세팅
    private func setupUI() {
        self.view.addSubViews(pageVC.view, toolbar)
        
        setupLayout()
        setupToolBar()
        setupTargets()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        toolbar.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.height.equalTo(30)
        }
        addChild(pageVC)
        pageVC.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(toolbar.snp.top)
        }
        
    }
    
    private func setupPageVC(index: Int) {
        pageVC.setViewControllers([viewControllersArray[index]], direction: .forward, animated: true)
        pageVC.didMove(toParent: self)
        pageControl.currentPage = viewControllersArray[index].view.tag
    }
    
    private func setupToolBar() {
        toolbar.backgroundColor = .red
        toolbar.tintColor = .white
        toolbar.layer.addBorder([.top], color: .white, width: 1)
        
        let leftButton = UIBarButtonItem(customView: mapButton)
        let rightButton = UIBarButtonItem(customView: listButton)
        let pageControl = UIBarButtonItem(customView: pageControl)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.setItems([leftButton, flexibleSpace, pageControl, rightButton], animated: true)
    }
    
    private func setupTargets() {
        listButton.addTarget(self, action: #selector(popToMainVC(_:)), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControltapped(_:)), for: .valueChanged)
        
    }
}

// MARK: - UIPageViewController Delegate
extension DetailPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        
        if let vc = pageViewController.viewControllers?.first {
            pageControl.currentPage = vc.view.tag
        }
    }
}

// MARK: - UIPageViewController DataSource
extension DetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewController.viewControllers?.first?.view.tag else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 || viewControllersArray.count <= previousIndex { return nil }
        
        return viewControllersArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewController.viewControllers?.first?.view.tag else { return nil }
        let nextIndex = index + 1
        if viewControllersArray.count <= nextIndex { return nil }
        
        return viewControllersArray[nextIndex]
    }
    
}
