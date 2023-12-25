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
        setUI()
        setHierarchy()
        setLayout()
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
    private func setUI() {
        self.backgroundColor = .black
    }
    
    private func setHierarchy() {
        contentView.addSubViews(weatherImageView)
        weatherImageView.addSubViews(myLocationLabel, cityLabel, weatherLabel, tempLabel, maxMinTempLabel)
    }
    
    private func setLayout() {
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
    
    func bindData(data: LocationWeather, row: Int) {
        self.myLocationLabel.text = data.name
        self.weatherLabel.text = data.weather[0].main
        self.cityLabel.text = makeTimeZoneToTime(timeZone: Int(data.timezone))
        self.tempLabel.text = String(Int(data.main.temp)) + "˚"
        self.maxMinTempLabel.text = "H:" + String(Int(data.main.tempMax)) + "˚" + " L:" + String(Int(data.main.tempMin)) + "˚"
    }
    
    func makeTimeZoneToTime(timeZone: Int) -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: today)
    }
}
