//
//  SearchTextFieldViewModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 25/09/2023.
//

import Foundation
import SwiftUI

struct WeatherViewModel {
    func prepareCityName(for cityName: String) -> String {
        return cityName.replacingOccurrences(of: " ", with: "_")
    }
    
    func weatherTask(for cityName: String, _ weatherModel: Binding<WeatherModel>) {
        Task {
            do {
                let weather = try await WeatherManager().getWeather(with: prepareCityName(for: cityName))
                weatherModel.wrappedValue = weather
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
    
    func weatherTask(for locationData: LocationData, _ weatherModel: Binding<WeatherModel>) {
        Task {
            do {
                let weather = try await WeatherManager().getWeather(latitude: locationData.latitude, longitude: locationData.longitude)
                weatherModel.wrappedValue = weather
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
