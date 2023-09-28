//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 19/09/2023.
//

import Foundation

struct WeatherModel {
    var isDay: Bool
    var cityName: String
    var next5: [DayModel] = []
    var temperature: String
    //change those 2 below
    var xd: String
    var xdd: String
    
    init(weatherData: WeatherData) {
        self.isDay = (weatherData.current.isDay == 1)
        self.cityName = weatherData.location.name
        self.temperature = String(format: "%.2f", weatherData.current.tempC)
        
        self.xd = "cloud.sun.fill"
        self.xdd = "moon.stars.fill"
        
        
        for i in 0...4 {
            if i < weatherData.forecast.forecastday.count {
                next5.append(DayModel(dayData: weatherData.forecast.forecastday[i]))
            }
        }
    }
    
}


