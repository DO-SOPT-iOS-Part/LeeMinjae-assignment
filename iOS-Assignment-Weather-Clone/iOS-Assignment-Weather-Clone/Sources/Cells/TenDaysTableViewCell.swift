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
        self.contentView.addSubViews()
        
        self.setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {

    }
    
}


