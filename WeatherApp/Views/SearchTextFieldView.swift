//
//  SearchTextFieldView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct SearchTextFieldView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        TextField(K.searchTextFieldEntryText, text: $viewModel.searchText)
            .padding(8)
            .padding(.horizontal, 5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.leading, 30)
            .onSubmit {
                viewModel.weatherTaskForCityName()
            }
            .padding(.top)
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView()
    }
}
