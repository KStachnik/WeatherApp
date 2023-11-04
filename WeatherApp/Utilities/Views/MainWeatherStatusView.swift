//
//  MainWeatherStatusView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct MainWeatherStatusView: View {
    let dayModel: DayModel
    @Binding var isDay: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isDay ? dayModel.dayWeatherConditionIcon : dayModel.nightWeatherConditionIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(isDay ? dayModel.dayTemp : dayModel.nightTemp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct MainWeatherStatusView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dayModel: DayModel = DayModel(dayData: SampleWeatherData.forecastStruct.forecastday[0])
        @State var isDay: Bool = true
        
        MainWeatherStatusView(dayModel: dayModel, isDay: $isDay)
        
    }
}
