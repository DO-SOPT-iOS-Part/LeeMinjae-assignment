//
//  DetailTimeWeatherView.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/22/23.
//

import UIKit
import SnapKit
import Then

class DetailTimeWeatherView: UIView {
    
    // MARK: - UI Components
    let timeViewTimeLabel = UILabel().then {
        $0.text = "0시"
        $0.textColor = .white
        $0.font = .medium(size: 17)
    }
    let timeViewWeatherImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "sunnyRainIcon")
    }
    let timeViewTempLabel = UILabel().then {
        $0.text = "21°"
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
    
    // MARK: - UI, Layout Setting
    private func setupUI() {
        self.addSubViews(timeViewTimeLabel, timeViewWeatherImage, timeViewTempLabel)
        
        setupLayout()
    }
    
    private func setupLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(122)
            $0.width.equalTo(44)
        }
        
        timeViewTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        timeViewWeatherImage.snp.makeConstraints {
            $0.top.equalTo(timeViewTimeLabel.snp.bottom).offset(14)
            $0.width.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        
        timeViewTempLabel.snp.makeConstraints {
            $0.top.equalTo(timeViewWeatherImage.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
