//
//  SearchTextFieldView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct SearchTextFieldView: View {
    
    @Binding var searchText: String
    @Binding var weatherModel: WeatherModel
    
    var body: some View {
        TextField("City name:", text: $searchText)
            .padding(8)
            .padding(.horizontal, 5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.leading, 30)
            .onSubmit {
                Task {
                    do {
                        let parameter = "&q=\(searchText)"
                        let response = try await WeatherManager().getWeather(with: parameter)
                        searchText = ""
                        weatherModel = response
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
            .padding(.top)
    }
    
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        
        @State var searchText: String = ""
        @State var weatherModel: WeatherModel = WeatherModel(weatherData: SampleWeatherData.weatherDataStruct)
        
        SearchTextFieldView(searchText: $searchText, weatherModel: $weatherModel)
        
    }
}
