//
//  WeatherDayView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct WeatherDayView: View {
    let dayModel: DayModel
    @Binding var isDay: Bool
    
    var body: some View {
        VStack {
            Text(dayModel.name)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: isDay ? dayModel.dayWeatherConditionIcon : dayModel.nightWeatherConditionIcon)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(isDay ? dayModel.dayTemp : dayModel.nightTemp)°")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        
       let dayModel: DayModel = DayModel(dayData: SampleWeatherData.forecastStruct.forecastday[0])
        @State var isDay: Bool = true
        
        WeatherDayView(dayModel: dayModel, isDay: $isDay)
    }
}
