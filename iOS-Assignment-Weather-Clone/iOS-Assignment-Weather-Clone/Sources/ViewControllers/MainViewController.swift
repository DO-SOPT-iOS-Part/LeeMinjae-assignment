//
//  MainViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI Components
    private let searchController = UISearchController()
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let mainContentView = UIView()
    
    private let locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    private let locationView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "listCloudImage")
        return imageView
    }()
    
    private let myLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "My Location"
        label.textColor = .white
        label.font = UIFont(name: "SFPro-Heavy", size: 25)
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "천안시"
        label.textColor = .white
        
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.textColor = .white
        
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.textColor = .white
        
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.text = "최고:29° 최저:29°"
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGestureRecognizer()
    }
    
    // MARK: - @IBAction Properties
    @objc func pushToDetailVC(sender: UITapGestureRecognizer) {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - Extensions
extension MainViewController {
    // UI 세팅
    private func setupUI() {
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainContentView)
        self.mainContentView.addSubview(locationStackView)
        self.locationStackView.addArrangeSubViews(locationView)
        self.locationView.addSubViews(myLocationLabel, cityLabel, weatherLabel, tempLabel, maxMinTempLabel)
        
        // navigationBar Setting
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.title = "Weather"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "moreIcon"),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
        
        setupLayout()
        
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mainScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     mainScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     mainScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     mainScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        
        mainContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mainContentView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor),
                                     mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor),
                                     mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.leadingAnchor),
                                     mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.trailingAnchor),
                                     mainContentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor)])
        
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([locationStackView.topAnchor.constraint(equalTo: self.mainContentView.topAnchor),
                                     locationStackView.bottomAnchor.constraint(equalTo: self.mainContentView.bottomAnchor),
                                     locationStackView.leadingAnchor.constraint(equalTo: self.mainContentView.leadingAnchor),
                                     locationStackView.trailingAnchor.constraint(equalTo: self.mainContentView.trailingAnchor),
                                     locationStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)])
        
        locationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([locationView.leadingAnchor.constraint(equalTo: self.locationStackView.leadingAnchor, constant: 20),
                                     locationView.trailingAnchor.constraint(equalTo: self.locationStackView.trailingAnchor, constant: -50),
                                     locationView.heightAnchor.constraint(equalToConstant: 117)])
        
        myLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([myLocationLabel.topAnchor.constraint(equalTo: self.locationView.topAnchor, constant: 10),
                                     myLocationLabel.leadingAnchor.constraint(equalTo: self.locationView.leadingAnchor, constant: 16),
                                     myLocationLabel.widthAnchor.constraint(equalToConstant: 96),
                                     myLocationLabel.heightAnchor.constraint(equalToConstant: 30)])
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cityLabel.topAnchor.constraint(equalTo: self.myLocationLabel.bottomAnchor, constant: 0),
                                     cityLabel.leadingAnchor.constraint(equalTo: self.locationView.leadingAnchor, constant: 16),
                                     cityLabel.widthAnchor.constraint(equalToConstant: 60),
                                     cityLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([weatherLabel.bottomAnchor.constraint(equalTo: self.locationView.bottomAnchor, constant: -11),
                                     weatherLabel.leadingAnchor.constraint(equalTo: self.locationView.leadingAnchor, constant: 16),
                                     weatherLabel.widthAnchor.constraint(equalToConstant: 30),
                                     weatherLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tempLabel.topAnchor.constraint(equalTo: self.locationView.topAnchor, constant: 4),
                                     tempLabel.trailingAnchor.constraint(equalTo: self.locationView.trailingAnchor, constant: -13),
                                     tempLabel.widthAnchor.constraint(equalToConstant: 82),
                                     tempLabel.heightAnchor.constraint(equalToConstant: 63)])
        
        maxMinTempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([maxMinTempLabel.bottomAnchor.constraint(equalTo: self.locationView.bottomAnchor, constant: -11),
                                     maxMinTempLabel.trailingAnchor.constraint(equalTo: self.locationView.trailingAnchor, constant: -19),
                                     maxMinTempLabel.widthAnchor.constraint(equalToConstant: 120),
                                     maxMinTempLabel.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    // GestureRecognizer 세팅
    private func setupGestureRecognizer() {
        let pushBtn = UITapGestureRecognizer(target: self, action: #selector(pushToDetailVC))
        locationView.isUserInteractionEnabled = true
        locationView.addGestureRecognizer(pushBtn)
    }
    
}
