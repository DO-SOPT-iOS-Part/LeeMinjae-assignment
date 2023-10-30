//
//  UIFont+Extension.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/16/23.
//

import UIKit

// MARK: - 폰트 명을 열거형으로 선언

enum AppFontName: String {
    
    case regularFont = "SFPro-Regular"
    case mediumFont = "SFPro-Medium"
    case boldFont = "SFPro-Bold"
    case thinFont = "SFPro-Thin"
    case lightFont = "SFPro-Light"
    
    var name: String {
        return self.rawValue
    }
}

extension UIFont {

    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
    }

    class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
    }

    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
    }
    
    class func light(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightFont.rawValue, size: size)!
    }
    
    class func thin(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.thinFont.rawValue, size: size)!
    }
}
