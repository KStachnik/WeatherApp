//
//  DayModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 20/09/2023.
//

import Foundation

struct DayModel {
    var name: String = ""
    var dayTemp: String = "0.0"
    var nightTemp: String = "0.0"
    var dayWeatherConditionIcon: String = "" // got to be a String (sf symbol name)
    var nightWeatherConditionIcon: Int = 0
    
    init(dayData: ForecastDay) {
        
        let tempDayData = calculateWeatherConditions(day: dayData, for: true)
        let tempNightData = calculateWeatherConditions(day: dayData, for: false)
        
        self.name = calculateDay(date: dayData.date)
        self.dayTemp = String(format: "%.1f", tempDayData.1)
        self.nightTemp = String(format: "%.1f", tempNightData.1)
        self.dayWeatherConditionIcon = {
            switch(tempDayData.0) {
                case 1:
                    return "xpp"
                default:
                    return "cloud.sun.fill"
                
            }
        }()
        self.nightWeatherConditionIcon = tempNightData.0
    }
    
    func calculateDay(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let data: Date? = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "EEEEEE"
        
        if let safeData = data {
            let dayOfTheWeekString = dateFormatter.string(from: safeData)
            return dayOfTheWeekString
        }
        
        return ""
    }
    
    
    func calculateWeatherConditions(day: ForecastDay, for isDay: Bool) -> (Int, Double) {
        let hours = day.hour
        var conditionArray: [Int] = []
        var tempArray: [Double] = []
        
        for hour in hours {
            if (hour.isDay == 1) == isDay {
                conditionArray.append(hour.condition.code)
                tempArray.append(hour.tempC)
            }
        }
        
        let mappedConditionArray = conditionArray.map { ($0, 1) }
        let countedConditionArray = Dictionary(mappedConditionArray, uniquingKeysWith: +)
        let mostFrequentCondition = countedConditionArray.max(by:{$0.key < $1.key})?.key
        
        let countedTempArray: Int = tempArray.count
        let tempSum = tempArray.reduce(0, +)
        let avgTemp = tempSum/Double(countedTempArray)
        
        if let condition = mostFrequentCondition {
            return (condition, avgTemp)
        }
        
        return (0, 0.0)
    }
}
