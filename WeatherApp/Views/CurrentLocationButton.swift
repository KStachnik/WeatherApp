//
//  CurrentLocationView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI
import _CoreLocationUI_SwiftUI

struct CurrentLocationButton: View {
    
    @ObservedObject var locationManager: LocationManager
    @Binding var weatherModel: WeatherModel
    let weatherManager: WeatherManager
    let viewModel = WeatherViewModel()

    var body: some View {
        LocationButton {
            let locationData = LocationData(locationManager: locationManager)
            
            viewModel.weatherTask(for: locationData, $weatherModel)
        }
        .foregroundColor(weatherModel.isDay ? .orange : .black)
        .cornerRadius(10)
        .labelStyle(.iconOnly)
        .tint(Color(.systemGray6))
        .buttonStyle(.bordered)
        .padding(.top)
        .padding(.trailing)
        .alert(isPresented: $locationManager.isError) {
            Alert(
                title: Text(K.locationErrorTitleText),
                message: Text(locationManager.errorCode.description),
                dismissButton: .default(Text(K.locationErrorDismissText)) {
                    locationManager.resetError()
                }
            )
        }
    }
}


struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var locationManager = LocationManager()
        @State var weatherModel = WeatherModel(weatherData: SampleWeatherData.weatherDataStruct)
        let weatherManager = WeatherManager()
        
        CurrentLocationButton(locationManager: locationManager, weatherModel: $weatherModel, weatherManager: weatherManager)
    }
}
