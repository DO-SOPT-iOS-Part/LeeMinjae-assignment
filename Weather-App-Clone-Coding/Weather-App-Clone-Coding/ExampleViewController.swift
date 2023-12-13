//
//  ExampleViewController.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 12/13/23.
//

import UIKit
import SnapKit

final class ExampleViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let myView = ExampleView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension ExampleViewController {
    func setUI() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network

extension ExampleViewController {
    func getAPI() {
        
    }
}

//extension ViewController: UICollectionViewDelegate {
//
//}
//
//extension ViewController: UICollectionViewDataSource {
//
//}
//
//extension ViewController: UICollectionViewFlowLayout {
//
//}

