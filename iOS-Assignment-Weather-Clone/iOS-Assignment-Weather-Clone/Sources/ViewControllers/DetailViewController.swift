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
    private let detailVerticalScrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
    }
    private let backgroundImageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "bgCloudImage")
        $0.contentMode = .scaleAspectFill
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
    private let detailHorizontalScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        
    }
    private let timeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 22
    }
    lazy var nowWeatherView = DetailTimeWeatherView(time: "Now", state: .cloud, temp: 20)
    lazy var firstWeatherView = DetailTimeWeatherView(time: "10시", state: .cloud, temp: 20)
    lazy var secondWeatherView = DetailTimeWeatherView(time: "11시", state: .cloud, temp: 20)
    lazy var thirdWeatherView = DetailTimeWeatherView(time: "12시", state: .cloud, temp: 20)
    lazy var fourthWeatherView = DetailTimeWeatherView(time: "13시", state: .cloud, temp: 20)
    lazy var fifthWeatherView = DetailTimeWeatherView(time: "14시", state: .cloud, temp: 20)
    lazy var sixthWeatherView = DetailTimeWeatherView(time: "15시", state: .cloud, temp: 20)
    lazy var seventhWeatherView = DetailTimeWeatherView(time: "16시", state: .cloud, temp: 20)
    lazy var eighthWeatherView = DetailTimeWeatherView(time: "17시", state: .cloud, temp: 20)
    lazy var ninthWeatherView = DetailTimeWeatherView(time: "18시", state: .cloud, temp: 20)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
}

// MARK: - Extensions
extension DetailViewController {
    // UI 세팅
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        detailVerticalScrollView.contentInsetAdjustmentBehavior = .never

        self.view.addSubViews(backgroundImageView, detailVerticalScrollView)
        self.detailVerticalScrollView.addSubViews(locationLabel, tempLabel, weatherLabel, maxMinTempLabel, timeWeatherView)
        self.timeWeatherView.addSubViews(weatherSummaryLabel, lineView, detailHorizontalScrollView)
        self.detailHorizontalScrollView.addSubViews(timeStackView)
        self.timeStackView.addArrangeSubViews(nowWeatherView, firstWeatherView, secondWeatherView, thirdWeatherView, fourthWeatherView, fifthWeatherView, sixthWeatherView, seventhWeatherView, eighthWeatherView, ninthWeatherView)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        detailVerticalScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(78)
        }
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).inset(-4)
        }
        weatherLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).inset(-4)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherLabel.snp.bottom).inset(-4)
        }
        timeWeatherView.snp.makeConstraints { make in
            make.top.equalTo(maxMinTempLabel.snp.bottom).inset(-44)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(212)
            make.centerX.equalToSuperview()
        }
        weatherSummaryLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(10)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(weatherSummaryLabel.snp.bottom).inset(-10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
        detailHorizontalScrollView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        timeStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
