//
//  MainViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import UIKit
import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - UI Components
    private let searchController = UISearchController()
    private let mainContentView = UIView()
    private let mainScrollView = UIScrollView().then() {
        $0.alwaysBounceVertical = true
    }
    private let locationStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    private let locationView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "listCloudImage")
    }
    private let myLocationLabel = UILabel().then {
        $0.text = "My Location"
        $0.textColor = .white
        $0.font = .bold(size: 25)
    }
    private let cityLabel = UILabel().then {
        $0.text = "천안시"
        $0.textColor = .white
        $0.font = .light(size: 16)
    }
    private let weatherLabel = UILabel().then {
        $0.text = "흐림"
        $0.textColor = .white
        $0.font = .light(size: 16)
    }
    private let tempLabel = UILabel().then {
        $0.text = "21°"
        $0.textColor = .white
        $0.font = .medium(size: 53)
    }
    private let maxMinTempLabel = UILabel().then {
        $0.text = "최고:29° 최저:29°"
        $0.textColor = .white
        $0.font = .light(size: 15)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGestureRecognizer()
    }
    
    // MARK: - @IBAction Properties
    @objc func pushToDetailVC(sender: UITapGestureRecognizer) {
        let detailVC = DetailPageViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - Extensions
extension MainViewController {
    // UI 세팅
    private func setupUI() {
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
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainContentView)
        self.mainContentView.addSubview(locationStackView)
        self.locationStackView.addArrangeSubViews(locationView)
        self.locationView.addSubViews(myLocationLabel, cityLabel, weatherLabel, tempLabel, maxMinTempLabel)
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainContentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
        }
        locationStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        locationView.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.centerY.equalToSuperview()
        }
        myLocationLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        cityLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(myLocationLabel.snp.bottom).inset(0)
            make.leading.equalToSuperview().inset(16)
        }
        weatherLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(11)
        }
        tempLabel.snp.makeConstraints { make in
            make.width.equalTo(82)
            make.height.equalTo(63)
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(13)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().inset(11)
            make.trailing.equalToSuperview().inset(13)
        }
    }
    
    // GestureRecognizer 세팅
    private func setupGestureRecognizer() {
        let pushBtn = UITapGestureRecognizer(target: self, action: #selector(pushToDetailVC))
        locationView.isUserInteractionEnabled = true
        locationView.addGestureRecognizer(pushBtn)
    }
    
}
