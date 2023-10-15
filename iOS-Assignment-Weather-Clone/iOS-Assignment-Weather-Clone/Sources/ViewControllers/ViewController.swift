//
//  ViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let searchController = UISearchController()
    
    private let firstLocationView = UIView()
    private let secondLocationView = UIView()
    private let thirdLocationView = UIView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - @IBAction Properties

}

// MARK: - Extensions
extension ViewController {
    // UI 세팅
    private func setupUI() {
        // self.view.addSubViews(searchCityTextField)
        setupLayout()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Weather"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "moreIcon"),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
//        moreButton.snp.makeConstraints { (mb) -> Void in
//            mb.width.height.equalTo(29)
//            mb.top.equalTo(view.safeAreaLayoutGuide).offset(8)
//            mb.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
//        }
    }
    
}
