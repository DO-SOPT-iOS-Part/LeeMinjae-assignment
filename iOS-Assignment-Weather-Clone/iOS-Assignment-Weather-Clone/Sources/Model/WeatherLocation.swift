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
