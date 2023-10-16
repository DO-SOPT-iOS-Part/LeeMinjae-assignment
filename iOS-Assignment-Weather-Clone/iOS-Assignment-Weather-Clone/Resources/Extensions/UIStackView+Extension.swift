//
//  UIStackView+Extension.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import Foundation
import UIKit

extension UIStackView {
    // StackView에서 여러개의 addArrangedSubview 추가하기
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { 
            self.addArrangedSubview($0)
        }
    }
}
