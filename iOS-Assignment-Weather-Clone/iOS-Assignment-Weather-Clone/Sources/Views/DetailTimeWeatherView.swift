//
//  DetailTimeWeatherView.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/22/23.
//

import UIKit
import SnapKit
import Then

enum WeatherState {
    case cloud
    case heavyRain
    case lightning
    case smallRain
    case sunnyRain
}

final class DetailTimeWeatherView: UIView {
    
    // MARK: - UI Components
    let timeViewTimeLabel = UILabel().then {
        $0.text = "0시"
        $0.textColor = .white
        $0.font = .medium(size: 17)
    }
    let timeViewWeatherImage = UIImageView()
    let timeViewTempLabel = UILabel().then {
        $0.text = "21°"
        $0.textColor = .white
        $0.font = .medium(size: 22)
    }
    
    // MARK: - View Life Cycle
    init(time: String = "", state: WeatherState, temp: Int) {
        super.init(frame: .zero)
        timeViewTimeLabel.text = time
        setViewState(state: state)
        timeViewTempLabel.text = String(temp) + "˚"
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailTimeWeatherView {
    // UI 세팅
    func setupUI() {
        self.addSubViews(timeViewTimeLabel, timeViewWeatherImage, timeViewTempLabel)
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    func setupLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(122)
            $0.width.equalTo(44)
        }
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
