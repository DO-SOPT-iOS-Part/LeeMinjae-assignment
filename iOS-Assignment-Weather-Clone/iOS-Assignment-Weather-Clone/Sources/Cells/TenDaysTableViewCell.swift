//
//  TenDaysTableViewCell.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 11/5/23.
//

import UIKit
import SnapKit
import Then

final class TenDaysTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "TenDaysTableViewCell"
    
    // MARK: - UI Components
    private let dateLabel = UILabel().then {
        $0.text = "오늘"
        $0.textColor = .white
        $0.font = .medium(size: 22)
    }
    private let weatherImage = UIImageView().then {
        $0.image = UIImage(systemName: "sun.max.fill")
    }
    private let minTempLabel = UILabel().then {
        $0.text = "25˚"
        $0.textColor = .systemGray5
        $0.font = .medium(size: 22)
    }
    private let maxTempLabel = UILabel().then {
        $0.text = "25˚"
        $0.textColor = .white
        $0.font = .medium(size: 22)
    }
    private let rainProbabilityImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "weatherGradintImage")
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

    }
    
}

// MARK: - Extensions
extension TenDaysTableViewCell {
    // UI 세팅
    private func setupUI() {
        self.contentView.addSubViews(dateLabel,
                                     weatherImage,
                                     minTempLabel,
                                     rainProbabilityImage,
                                     maxTempLabel)
        
        self.setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(14)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(45)
        }
        weatherImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(28)
            make.leading.equalTo(dateLabel.snp.trailing).offset(30)
        }
        minTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(14)
            make.leading.equalTo(weatherImage.snp.trailing).offset(15)
        }
        rainProbabilityImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(minTempLabel.snp.trailing).offset(6)
            make.width.equalTo(108)
        }
        maxTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(14)
            make.leading.equalTo(rainProbabilityImage.snp.trailing).offset(5)
        }
    }
    
}
