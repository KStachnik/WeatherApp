//
//  ContentView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 17/09/2023.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    @StateObject var viewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView(isDay: $viewModel.weatherModel.isDay)
            
            VStack {
                HStack {
                    SearchTextFieldView()
                    CurrentLocationButton()
                }
                
                CityTextView()
                MainWeatherStatusView(dayModel: viewModel.weatherModel.currentDay,
                                      isDay: $viewModel.weatherModel.isDay)
                
                HStack(spacing: 20) {
                    ForEach(viewModel.weatherModel.next5, id: \.id) { day in
                        WeatherDayView(dayModel: day,
                                       isDay: $viewModel.weatherModel.isDay)
                    }
                }
                
                Spacer()
                
                WeatherButton(isDay: $viewModel.weatherModel.isDay,
                              title: K.weatherButtonText,
                              textColor: .white,
                              dayBackgroundColor: .orange,
                              nightBackgroundColor: .black
                )
                
                Spacer()
            }
        }
        .environmentObject(viewModel)
        .onAppear {
            viewModel.locationManager.requestLocation()
        }
    }
       
}



//MARK: - ContentView preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




