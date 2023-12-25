//
//  PageViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/17/23.
//

import UIKit
import SnapKit
import Then

final class DetailPageViewController: UIViewController {
    
    // MARK: - Properties
    lazy var viewControllersArray: [DetailViewController] = [DetailViewController()]
    
    // MARK: - UI Components
    let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setPageVCConfig()
    }    
}

// MARK: - Extensions
extension DetailPageViewController {
    // UI 세팅
    private func setupUI() {        
        self.navigationController?.isNavigationBarHidden = true

        self.view.addSubViews(pageVC.view)
        addChild(pageVC)
        
        self.setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        pageVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // 페이지 뷰컨 세팅
    private func setPageVCConfig() {
        // pageVC.dataSource = self
        pageVC.delegate = self
    }
}

// MARK: - UIPageViewController DataSource
// extension DetailPageViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let index = viewControllersArray.firstIndex(of: viewController as? DetailViewController ?? uiviewcon) else { return nil }
//        let previousIndex = index - 1
//        if previousIndex < 0 { return nil }
//        return viewControllersArray[previousIndex]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let index = viewControllersArray.firstIndex(of: viewController as! DetailViewController) else { return nil }
//        let nextIndex = index + 1
//        if nextIndex < 0 { return nil }
//        return viewControllersArray[nextIndex]
//    }
//    
// }

// MARK: - UIPageViewController Delegate
extension DetailPageViewController: UIPageViewControllerDelegate {}
