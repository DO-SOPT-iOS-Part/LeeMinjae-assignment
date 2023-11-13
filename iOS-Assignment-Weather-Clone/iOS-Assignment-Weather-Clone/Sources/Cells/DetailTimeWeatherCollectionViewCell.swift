//
//  DetailTimeWeatherCollectionViewCell.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/31/23.
//

import UIKit
import SnapKit
import Then

final class DetailTimeWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailTimeWeatherCollectionViewCell"
    
    // MARK: - UI Components
    private let timeViewTimeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .medium(size: 17)
    }
    private let timeViewWeatherImage = UIImageView().then {
        $0.tintColor = .white
    }
    private let timeViewTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .medium(size: 22)
    }
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension DetailTimeWeatherCollectionViewCell {
    // UI 세팅
    private func setupUI() {
        self.contentView.addSubViews(timeViewTimeLabel, 
                                     timeViewWeatherImage,
                                     timeViewTempLabel)
        self.setupLayout()
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
        self.setViewState(state: data.weather)
        self.timeViewTempLabel.text = String(data.temp) + "˚"
    }
    
    func setViewState(state: WeatherState) {
        switch state {
        case .sunny:
            timeViewWeatherImage.image = UIImage(systemName: "sun.max.fill")
        case .cloud:
            timeViewWeatherImage.image = UIImage(systemName: "cloud.moon.fill")
        case .heavyRain:
            timeViewWeatherImage.image = UIImage(systemName: "cloud.heavyrain.fill")
        case .lightning:
            timeViewWeatherImage.image = UIImage(systemName: "cloud.bolt.fill")
        case .smallRain:
            timeViewWeatherImage.image = UIImage(systemName: "cloud.rain.fill")
        case .sunnyRain:
            timeViewWeatherImage.image = UIImage(systemName: "cloud.sun.rain.fill")
        }
    }
}
