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
    
    var body: some View {
        LocationButton {
            let locationData = LocationData(locationManager: locationManager)
            
            // to ewentualnie do viewModel przeniesc
            Task {
                do {
                    self.weatherModel = try await WeatherManager().getWeather(latitude: locationData.latitude, longitude: locationData.longitude)
                } catch GHError.invalidURL{
                    print("invalid url")
                } catch GHError.invalidResponse{
                    print("invalid response")
                } catch GHError.invalidData{
                    print("invalid data")
                } catch {
                    print("unexpected error")
                }
            }
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
                title: Text("Error"),
                message: Text(locationManager.errorCode),
                dismissButton: .default(Text("OK")) {
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
