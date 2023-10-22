//
//  DetailViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/15/23.
//

import UIKit
import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    // MARK: - UI Components
    private let detailVerticalScrollView = UIScrollView()
    private let detailVerticalContentView = UIView()
    private let backgroundImageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "bgCloudImage")
    }
    private let locationLabel = UILabel().then {
        $0.text = "천안시"
        $0.textColor = .white
        $0.font = .light(size: 36)
        $0.textAlignment = .center
    }
    private let tempLabel = UILabel().then {
        $0.text = "21°"
        $0.textColor = .white
        $0.font = .light(size: 102)
        $0.textAlignment = .center
    }
    private let weatherLabel = UILabel().then {
        $0.text = "흐림"
        $0.textColor = .white
        $0.font = .light(size: 24)
        $0.textAlignment = .center
    }
    private let maxMinTempLabel = UILabel().then {
        $0.text = "최고:29° 최저:29°"
        $0.textColor = .white
        $0.font = .light(size: 20)
        $0.textAlignment = .center
    }
    private let timeWeatherView = UIView().then {
        $0.backgroundColor = .white.withAlphaComponent(0.03)
        $0.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    private let weatherSummaryLabel = UILabel().then {
        $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        $0.textColor = .white
        $0.font = .medium(size: 18)
        $0.numberOfLines = 2
    }
    private let lineView = UIView().then {
        $0.backgroundColor = .white.withAlphaComponent(0.25)
    }
    private let detailHorizontalScrollView = UIScrollView()
    private let detailHorizontalContentView = UIView()
    
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
        self.navigationController?.isNavigationBarHidden = true
        detailVerticalScrollView.contentInsetAdjustmentBehavior = .never
        
        self.view.addSubview(detailVerticalScrollView)
        self.detailVerticalScrollView.addSubview(detailVerticalContentView)
        self.detailVerticalContentView.addSubview(backgroundImageView)
        self.backgroundImageView.addSubViews(locationLabel, tempLabel, weatherLabel, maxMinTempLabel, timeWeatherView)
        self.timeWeatherView.addSubViews(weatherSummaryLabel, lineView, detailHorizontalScrollView)
        self.detailHorizontalScrollView.addSubview(detailHorizontalContentView)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        detailVerticalScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        detailVerticalContentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
            make.height.equalTo(1000)
        }
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
        }
        locationLabel.snp.makeConstraints { make in
            make.width.equalTo(133)
            make.height.equalTo(38)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(78)
        }
        tempLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(108)
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).inset(-4)
        }
        weatherLabel.snp.makeConstraints { make in
            make.width.equalTo(45)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).inset(-4)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.width.equalTo(153)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherLabel.snp.bottom).inset(-4)
        }
        timeWeatherView.snp.makeConstraints { make in
            make.top.equalTo(maxMinTempLabel.snp.bottom).inset(-44)
            make.width.equalTo(335)
            make.height.equalTo(212)
            make.centerX.equalToSuperview()
        }
        weatherSummaryLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(45)
            make.top.equalToSuperview().inset(10)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(weatherSummaryLabel.snp.bottom).inset(-10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
        detailHorizontalScrollView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        detailHorizontalContentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
            make.width.equalTo(1000)
        }
    }
    
}
