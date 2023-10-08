//
//  UIView+Extension.swift
//  sopt33-assignment-Weather
//
//  Created by 민 on 10/8/23.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
