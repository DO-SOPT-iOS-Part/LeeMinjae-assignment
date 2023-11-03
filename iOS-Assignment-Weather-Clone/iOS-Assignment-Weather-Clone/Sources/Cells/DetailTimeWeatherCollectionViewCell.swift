//
//  DetailTimeWeatherCollectionViewCell.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/31/23.
//

import UIKit

final class DetailTimeWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailTimeWeatherCollectionViewCell"
    
    // MARK: - UI Components
    let timeViewTimeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .medium(size: 17)
    }
    let timeViewWeatherImage = UIImageView()
    let timeViewTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .medium(size: 22)
    }
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension DetailTimeWeatherCollectionViewCell {
    // UI 세팅
    private func setupUI() {
        self.addSubViews(timeViewTimeLabel, timeViewWeatherImage, timeViewTempLabel)
        
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        timeViewTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        timeViewWeatherImage.snp.makeConstraints { make in
            make.top.equalTo(timeViewTimeLabel.snp.bottom).offset(14)
            make.width.height.equalTo(34)
            make.centerX.equalToSuperview()
        }
        timeViewTempLabel.snp.makeConstraints { make in
            make.top.equalTo(timeViewWeatherImage.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
    }
    
    func bindData(data: TimeWeather) {
        self.timeViewTimeLabel.text = data.time
        setViewState(state: data.weather)
        self.timeViewTempLabel.text = String(data.temp) + "˚"
    }
    
    func setViewState(state: WeatherState) {
        switch state {
        case .cloud:
            timeViewWeatherImage.image = #imageLiteral(resourceName: "CloudIcon")
        case .heavyRain:
            timeViewWeatherImage.image = #imageLiteral(resourceName: "heavyRainIcon")
        case .lightning:
            timeViewWeatherImage.image = #imageLiteral(resourceName: "lightningIcon")
        case .smallRain:
            timeViewWeatherImage.image = #imageLiteral(resourceName: "SmallRainIcon")
        case .sunnyRain:
            timeViewWeatherImage.image = #imageLiteral(resourceName: "sunnyRainIcon")
        }
    }
}

enum WeatherState {
    case cloud
    case heavyRain
    case lightning
    case smallRain
    case sunnyRain
}
