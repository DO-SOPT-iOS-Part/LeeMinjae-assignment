//
//  MainLocationView.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/27/23.
//

import UIKit
import SnapKit

class MainLocationView: UIView {
    
    // MARK: - Properties
    var indexNumber: Int = 0
    
    // MARK: - UI Components
    private let weatherImageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "listCloudImage")
    }
    private let myLocationLabel = UILabel().then {
        $0.text = "My Location"
        $0.textColor = .white
        $0.font = .bold(size: 25)
    }
    private let cityLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .light(size: 16)
    }
    private let weatherLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .light(size: 16)
    }
    private let tempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .medium(size: 53)
    }
    private let maxMinTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .light(size: 15)
    }
    
    // MARK: - View Life Cycle
    init(city: String, weather: String, temp: Int, maxTemp: Int, minTemp: Int, indexNum: Int) {
        super.init(frame: CGRect())
        weatherLabel.text = weather
        cityLabel.text = city
        tempLabel.text = String(temp) + "˚"
        maxMinTempLabel.text = "최고:" + String(maxTemp) + "˚" + " 최저:" + String(minTemp) + "˚"
        self.indexNumber = indexNum
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension MainLocationView {
    // UI 세팅
    private func setupUI() {
        self.addSubViews(weatherImageView)
        weatherImageView.addSubViews(myLocationLabel, cityLabel, weatherLabel, tempLabel, maxMinTempLabel)
            
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
        }
        weatherImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myLocationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(myLocationLabel.snp.bottom).inset(0)
            make.leading.equalToSuperview().inset(16)
        }
        weatherLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(11)
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(13)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.trailing.equalToSuperview().inset(13)
        }
    }
    
}

