//
//  SearchTextFieldViewModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 25/09/2023.
//

import Foundation
import SwiftUI

@MainActor final class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel
    @Published var searchText: String
    @Published var locationManager: LocationManager
    let weatherManager: WeatherManager
    
    //add calculated color etc, ContentView to Screen folder, add alerts
    
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
        Task {
            do {
                let locationData = LocationData(locationManager: locationManager)
                let weather = try await weatherManager.getWeather(latitude: locationData.latitude, longitude: locationData.longitude)
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
