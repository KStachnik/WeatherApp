//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 19/09/2023.
//

import Foundation

struct WeatherModel {
    
    let cityName: String
    let currentDay: DayModel
    let next5: [DayModel]
    var isDay: Bool
    
    
    init(weatherData: WeatherData) {
        self.cityName = weatherData.location.name
        self.isDay = (weatherData.current.isDay == 1)
        self.currentDay = DayModel(dayData: weatherData.forecast.forecastday[0])

        var temp: [DayModel] = []
        for i in 1...5 {
            if i < weatherData.forecast.forecastday.count {
                temp.append(DayModel(dayData: weatherData.forecast.forecastday[i]))
            } else {
                break
            }
        }
        
        self.next5 = temp
    }
    
}


