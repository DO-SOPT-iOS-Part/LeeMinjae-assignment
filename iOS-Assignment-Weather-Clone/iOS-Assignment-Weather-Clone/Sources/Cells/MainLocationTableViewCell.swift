//
//  MainLocationTableViewCell.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/30/23.
//

import UIKit
import SnapKit
import Then

final class MainLocationTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "MainLocationTableViewCell"
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }
    
}

// MARK: - Extensions
extension MainLocationTableViewCell {
    // UI 세팅
    private func setupUI() {
        self.contentView.addSubViews(weatherImageView)
        weatherImageView.addSubViews(myLocationLabel, cityLabel, weatherLabel, tempLabel, maxMinTempLabel)
        
        self.setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.backgroundColor = .black
        
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
    
    func bindData(data: WeatherLocation, row: Int) {
        self.weatherLabel.text = data.weather
        self.cityLabel.text = data.location
        self.tempLabel.text = String(data.temp) + "˚"
        self.maxMinTempLabel.text = "최고:" + String(data.maxTemp) + "˚" + " 최저:" + String(data.minTemp) + "˚"
        self.indexNumber = row
    }
}

