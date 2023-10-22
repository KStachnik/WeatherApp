//
//  SearchTextFieldViewModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 25/09/2023.
//

import Foundation
import SwiftUI

final class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel
    @Published var searchText: String
    @Published var locationManager: LocationManager
    let weatherManager: WeatherManager
    
    init() {
        self.weatherModel = WeatherModel(weatherData: SampleWeatherData.weatherDataStruct)
        self.searchText = ""
        self.locationManager = LocationManager()
        self.weatherManager = WeatherManager()
    }
    
    func prepareCityName(for cityName: String) -> String {
        return cityName.replacingOccurrences(of: " ", with: "_")
    }
    
    func weatherTaskForCityName() {
        Task {
            do {
                let weather = try await weatherManager.getWeather(with: prepareCityName(for: searchText))
                DispatchQueue.main.async {
                    self.weatherModel = weather
                    self.searchText = ""
                }
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
    
    func weatherTaskForLocation() {
        locationManager.requestLocation()
        Task {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            if let latitude =
                    locationManager.manager.location?.coordinate.latitude,
               let longitude =
                    locationManager.manager.location?.coordinate.longitude {
                    do {
                        let weather = try await weatherManager.getWeather(latitude: latitude ,longitude: longitude)
                        DispatchQueue.main.async {
                            self.weatherModel = weather
                        }
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
        
    }
    
}
