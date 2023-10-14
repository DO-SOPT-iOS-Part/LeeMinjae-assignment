//
//  UIView+Extension.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import Foundation
import UIKit

extension UIView {
    // 여러개의 addSubView 추가하기
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
