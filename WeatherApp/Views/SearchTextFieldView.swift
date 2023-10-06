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
    let viewModel = WeatherViewModel()
    
    var body: some View {
        TextField(K.searchTextFieldEntryText, text: $searchText)
            .padding(8)
            .padding(.horizontal, 5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.leading, 30)
            .onSubmit {
                viewModel.weatherTask(for: searchText, $weatherModel)
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
