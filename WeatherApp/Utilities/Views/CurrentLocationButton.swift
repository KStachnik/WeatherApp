//
//  CurrentLocationView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI
import CoreLocationUI

struct CurrentLocationButton: View {
    @EnvironmentObject var viewModel: WeatherViewModel

    var body: some View {
        LocationButton {
            viewModel.weatherTaskForLocation()
        }
        .background(Color(.white))
        .foregroundColor(viewModel.weatherModel.isDay ? .orange : .black)
        .cornerRadius(10)
        .labelStyle(.iconOnly)
        .tint(Color(.white))
        .buttonStyle(.bordered)
        .padding(.top)
        .padding(.trailing)
    }
}


struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationButton()
    }
}
