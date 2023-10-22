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
    var viewControllersArray: [DetailViewController] = [DetailViewController(), DetailViewController()]
    
    // MARK: - UI Components
    private var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private var pageControl = UIPageControl().then {
        $0.backgroundColor = .clear
        $0.layer.addBorder([.top], color: .white, width: 0.4)
    }
    private let mapButton = UIButton().then {
        $0.setImage(UIImage(named: "mapIcon"), for: .normal)
    }
    private let listButton = UIButton().then {
        $0.setImage(UIImage(named: "listIcon"), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        pageVC.dataSource = self
        pageVC.delegate = self
        setupUI()
    }
    
    // MARK: - @IBAction Properties
    @objc func popToMainVC() {
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: - Extensions
extension DetailPageViewController {
    // UI 세팅
    private func setupUI() {
        self.view.addSubViews(pageVC.view, pageControl)
        pageVC.setViewControllers([viewControllersArray.first!], direction: .forward, animated: true)
        pageControl.numberOfPages = viewControllersArray.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        pageVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(82)
            make.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - UIPageViewControllerDelegate/DataSource Extensions
extension DetailPageViewController: UIPageViewControllerDelegate {
    
}

extension DetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = viewController.view.tag
        pageControl.currentPage = index
        index = index + 1
        return viewControllersArray[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = viewController.view.tag
        pageControl.currentPage = index
        index = index - 1
        if index < 0 { return nil }
        return viewControllersArray[index]
    }
    
    
}

