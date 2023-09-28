//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 19/09/2023.
//

import Foundation

struct WeatherData: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Location: Codable {
    let name: String
    let localtime: String
}

struct Current: Codable {
    let tempC: Double
    let isDay: Int
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let date: String
    let hour: [Hour]
}

struct Hour: Codable {
    let tempC: Double
    let isDay: Int
    let condition: Condition
}

struct Condition: Codable {
    let code: Int
}

struct SampleWeatherData {
    static let conditionStruct = Condition(code: 1000)
    static let hourStruct = Hour(tempC: 0.0, isDay: 1, condition: conditionStruct)
    static let forecastDayStruct = ForecastDay(date: "2020-09-11", hour: [hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct,hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct,hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct, hourStruct,hourStruct, hourStruct])
    static let forecastStruct = Forecast(forecastday: [forecastDayStruct, forecastDayStruct, forecastDayStruct, forecastDayStruct, forecastDayStruct, forecastDayStruct])
    static let currentStruct = Current(tempC: 0.0, isDay: 1)
    static let locationStruct = Location(name: "", localtime: "2020-09-11 10:10")
    static let weatherDataStruct = WeatherData(location: locationStruct, current: currentStruct, forecast: forecastStruct)
    
}
