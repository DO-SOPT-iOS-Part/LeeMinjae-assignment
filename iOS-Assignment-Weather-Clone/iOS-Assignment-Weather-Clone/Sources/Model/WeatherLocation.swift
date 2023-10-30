//
//  WeatherLocation.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/27/23.
//

import Foundation

struct WeatherLocation {
    let location: String
    let weather: String
    let temp: Int
    let maxTemp: Int
    let minTemp: Int
    let weatherSummary: String
    let timeWeatherList: [TimeWeather]
    let indexNumber: Int
}

struct TimeWeather {
    let time: String
    let weather: WeatherState
    let temp: Int
}

// MARK: - Properties
let dummyLocationData: [WeatherLocation] = [
    WeatherLocation(location: "천안시",
                    weather: "흐림",
                    temp: 18, maxTemp: 18, minTemp: 11,
                    weatherSummary: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                    timeWeatherList: [TimeWeather(time: "Now", weather: .cloud, temp: 18),
                                      TimeWeather(time: "10시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "11시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "12시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "13시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "14시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "15시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "16시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "17시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], indexNumber: 0),
    WeatherLocation(location: "수원시",
                    weather: "흐림",
                    temp: 18, maxTemp: 18, minTemp: 11,
                    weatherSummary: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                    timeWeatherList: [TimeWeather(time: "Now", weather: .cloud, temp: 18),
                                      TimeWeather(time: "10시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "11시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "12시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "13시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "14시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "15시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "16시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "17시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], indexNumber: 1),
    WeatherLocation(location: "광진구",
                    weather: "흐림",
                    temp: 18, maxTemp: 18, minTemp: 11,
                    weatherSummary: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                    timeWeatherList: [TimeWeather(time: "Now", weather: .cloud, temp: 18),
                                      TimeWeather(time: "10시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "11시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "12시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "13시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "14시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "15시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "16시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "17시", weather: .cloud, temp: 18),
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], indexNumber: 2)]
