//
//  WeatherLocation.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/27/23.
//

import Foundation

struct WeatherLocation: Hashable {
    let location: String
    let weather: String
    let temp: Int
    let maxTemp: Int
    let minTemp: Int
    let weatherSummary: String
    let timeWeatherList: [TimeWeather]
    let tenDaysWeatherList: [TenDaysWeather]
    let indexNumber: Int
}

struct TimeWeather: Hashable {
    let time: String
    let weather: WeatherState
    let temp: Int
}

struct TenDaysWeather: Hashable {
    let date: String
    let weather: WeatherState
    let rainProbability: Int
    let minTemp: Int
    let maxTemp: Int
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
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], 
                    tenDaysWeatherList: [TenDaysWeather(date: "오늘", weather: .sunny, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .cloud, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .heavyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "목", weather: .smallRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "금", weather: .lightning, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "토", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "일", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25)], indexNumber: 0),
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
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], 
                    tenDaysWeatherList: [TenDaysWeather(date: "오늘", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "목", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "금", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "토", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "일", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25)], indexNumber: 1),
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
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], 
                    tenDaysWeatherList: [TenDaysWeather(date: "오늘", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "목", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "금", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "토", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "일", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25)], indexNumber: 2),
    WeatherLocation(location: "서초구",
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
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], 
                    tenDaysWeatherList: [TenDaysWeather(date: "오늘", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "목", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "금", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "토", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "일", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25)], indexNumber: 3),
    WeatherLocation(location: "구로구",
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
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], 
                    tenDaysWeatherList: [TenDaysWeather(date: "오늘", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "목", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "금", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "토", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "일", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25)], indexNumber: 4),
    WeatherLocation(location: "양천구",
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
                                      TimeWeather(time: "18시", weather: .cloud, temp: 18)], 
                    tenDaysWeatherList: [TenDaysWeather(date: "오늘", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "목", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "금", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "토", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "일", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "월", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "화", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25),
                                         TenDaysWeather(date: "수", weather: .sunnyRain, rainProbability: 20, minTemp: 20, maxTemp: 25)], indexNumber: 5)]
