//
//  CityTextView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct CityTextView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        Text(viewModel.weatherModel.cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
        CityTextView()
    }
}
