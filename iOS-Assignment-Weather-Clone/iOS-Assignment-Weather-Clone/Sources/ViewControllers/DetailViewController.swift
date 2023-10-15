//
//  DetailViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/15/23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    // private let weatherLabel = UILabel()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - @IBAction Properties
    
    
}

// MARK: - Extensions
extension DetailViewController {
    // UI 세팅
    private func setupUI() {
        // rself.view.addSubViews(<#Views#>)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        //        exampleView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            exampleView.topAnchor.constraint(equalTo: view.topAnchor),
        //            exampleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //            exampleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //            exampleView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        //        ])
    }
    
}

