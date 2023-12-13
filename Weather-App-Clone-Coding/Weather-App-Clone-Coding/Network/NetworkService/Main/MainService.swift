//
//  MainService.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 12/6/23.
//

import Foundation
import Moya

enum MainService {
    /// 개별 네트워크 통신을 enum으로 설정해준다.
    case getLocationWeather(location: String)
}

extension MainService: TargetType {
    
    /// 이번 서버 통신의 기본이 될 base URL
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    /// 서버의 base URL 뒤에 추가될 Path URL
    var path: String {
        switch self {
        case .getLocationWeather:
            return ""
        }
    }
    
    /// HTTP Method (GET, POST, PUT, DELETE 등...)
    var method: Moya.Method {
        switch self {
        case .getLocationWeather:
            return .get
        }
    }
    
    ///  request에 사용되는 파라미터(requestData, requestParameters 등) 설정
    var task: Task {
        switch self {
        case .getLocationWeather(let location):
            return .requestParameters(parameters: [
                "units": "metric",
                "lang": "kr",
                "q": location,
                "appid": "e1ef1ff15bdd3d275708f7d5e3df93ad"
            ], encoding: URLEncoding.queryString)
        }
    }
    
    /// HTTP headers
    var headers: [String : String]? {
        switch self {
        case .getLocationWeather:
            return nil
        }
    }
}
