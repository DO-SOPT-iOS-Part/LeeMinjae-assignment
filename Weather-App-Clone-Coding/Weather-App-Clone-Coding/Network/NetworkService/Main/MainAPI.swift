//
//  MainAPI.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 12/6/23.
//

import Foundation
import Moya

final class MainAPI {
    
    static let shared = MainAPI()
    var mainProvider = MoyaProvider<MainService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }
    
    func getLocationWeather(location: String, 
                            completion: @escaping (NetworkResult<Any>) -> Void) {
        mainProvider.request(.getLocationWeather(location: location)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeLocationWeatherStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - JudgeStatus methods
    private func judgeLocationWeatherStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LocationWeather.self, from: data) else { return .pathErr }
        switch statusCode {
        case 200:
            return .success(decodedData)
        case 400..<500:
            return .requestErr(decodedData)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

}
