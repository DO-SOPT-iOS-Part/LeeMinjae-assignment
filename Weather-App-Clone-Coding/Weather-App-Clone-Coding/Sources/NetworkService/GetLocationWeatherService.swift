//
//  GetLocationWeatherService.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 11/13/23.
//

import Foundation
import Alamofire

struct GetLocationWeatherService {
    static let shared = GetLocationWeatherService()

    func getLocationWeatherInfo(location: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URL(string: Const.URL.baseURL+"?q=\(location)&units=metric&appid=e1ef1ff15bdd3d275708f7d5e3df93ad")!
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default)
        dataRequest.responseData { DataResponse in
            switch DataResponse.result {
            case .success:
                guard let statusCode = DataResponse.response?.statusCode else { return }
                guard let value = DataResponse.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LocationWeather.self, from: data) else { return .pathErr}
        return .success(decodedData)
    }
    
    // URLSession에 넣어줄 URLRequest를 만드는 부분
//    func makeRequest(location: String, unit: String, id: String) -> URLRequest {
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        return request
//    }
//    
//    func PostRegisterData(location: String, unit: String, id: String) async throws -> LocationWeather? {
//        do {
//            let request = self.makeRequest(location: location, unit: unit, id: id)
//            let (data, response) = try await URLSession.shared.data(for: request)
//            dump(request)
//            guard let httpResponse = response as? HTTPURLResponse else {
//                throw NetworkResult.responseError
//            }
//            dump(response)
//            return parseUserInfoData(data: data)
//        } catch {
//            throw error
//        }
//        
//    }
//    
//    private func parseUserInfoData(data: Data) -> LocationWeather? {
//        do {
//            let jsonDecoder = JSONDecoder()
//            let result = try jsonDecoder.decode(LocationWeather.self, from: data)
//            return result
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//    
//    private func configureHTTPError(errorCode: Int) -> Error {
//        return NetworkResult(rawValue: errorCode)
//        ?? NetworkResult.unknownError
//    }
    
}
