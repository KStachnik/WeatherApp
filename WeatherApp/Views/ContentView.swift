//
//  ContentView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 17/09/2023.
//

import SwiftUI
import _CoreLocationUI_SwiftUI

struct ContentView: View {
    
    @State var weatherModel: WeatherModel
    @State private var searchText = ""
    @StateObject var locationManager = LocationManager()
    let weatherManager: WeatherManager = WeatherManager()
    
    var body: some View {
        
        ZStack {
            BackgroundView(isDay: $weatherModel.isDay)
            
            VStack {
                
                HStack {
                    SearchTextFieldView(searchText: $searchText, weatherModel: $weatherModel)
                    
                    CurrentLocationButton(locationManager: locationManager, weatherModel: $weatherModel, weatherManager: weatherManager)
                }
                
                CityTextView(cityName: weatherModel.cityName)
                MainWeatherStatusView(dayModel: weatherModel.currentDay, isDay: $weatherModel.isDay)
                
                HStack(spacing: 20) {
                    let days = weatherModel.next5
                    ForEach(days, id: \.id) { day in
                        WeatherDayView(dayModel: day, isDay: $weatherModel.isDay)
                    }
                }
                
                Spacer()
                
                Button {
                    weatherModel.isDay.toggle()
                    
                } label: {
                    WeatherButton(isDay: $weatherModel.isDay,
                                  title: K.weatherButtonText,
                                  textColor: .white,
                                  dayBackgroundColor: .orange,
                                  nightBackgroundColor: .black
                    )
                    
                }
                Spacer()
            }
            
        }
    }
}



//MARK: - ContentView preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weatherModel: WeatherModel(weatherData: SampleWeatherData.weatherDataStruct))
    }
}




