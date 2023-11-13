//
//  GetLocationWeatherService.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 11/13/23.
//

import Foundation

class GetLocationWeatherService {
    static let shared = GetLocationWeatherService()
    private init() {}
    
    // URLSession에 넣어줄 URLRequest를 만드는 부분
    func makeRequest(location: String, unit: String, id: String) -> URLRequest {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(location)&units=\(unit)&appid=\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func PostRegisterData(location: String, unit: String, id: String) async throws -> LocationWeather? {
        do {
            let request = self.makeRequest(location: location, unit: unit, id: id)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkResult.responseError
            }
            dump(response)
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }
        
    }
    
    private func parseUserInfoData(data: Data) -> LocationWeather? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(LocationWeather.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkResult(rawValue: errorCode)
        ?? NetworkResult.unknownError
    }
    
}
