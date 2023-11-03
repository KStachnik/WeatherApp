//
//  GetWeather.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 19/09/2023.
//

import Foundation

final class WeatherManager {
    static let shared = WeatherManager()
    private let tempEndpoint = "https://api.weatherapi.com/v1/forecast.json?key=\(K.apiKey)&days=6&aqi=no&alerts=no&lan=en"
    
    private init() {}
    
    func getWeather(with parameter: String) async throws -> WeatherModel {
        
        let endpoint = tempEndpoint + "&q=" + parameter
        
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            
            return WeatherModel(weatherData: weatherData)
        } catch {
            throw GHError.invalidData
        }
    }
    
    func getWeather(latitude: Double, longitude: Double) async throws -> WeatherModel {
        let parameter = "\(latitude),\(longitude)"
        return try await getWeather(with: parameter)
    }
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case errorWhileRecivingLocation
}
