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
    private let timeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 5
    }
    private let firstTimeView = UIView().then {
        let timeViewTimeLabel = UILabel()
        let timeViewWeatherImage = UIImageView()
        let timeViewTempLabel = UILabel()
        
        timeViewTempLabel.text = "Now"
        timeViewTempLabel.font = .light(size: 17)
        timeViewTempLabel.textColor = .white
        timeViewWeatherImage.image = #imageLiteral(resourceName: "sunnyRainIcon")
        timeViewTempLabel.text = "29°"
        timeViewTempLabel.font = .light(size: 22)
        timeViewTempLabel.textColor = .white
    
        $0.addSubViews(timeViewTimeLabel, timeViewWeatherImage, timeViewTempLabel)
        
        timeViewTempLabel.snp.makeConstraints { make in
        }
        timeViewWeatherImage.snp.makeConstraints { make in
        }
        timeViewTempLabel.snp.makeConstraints { make in
        }
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
