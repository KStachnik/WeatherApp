//
//  SearchTextFieldViewModel.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 25/09/2023.
//

import Foundation

struct SearchTextFieldViewModel {
    
    func prepareCityName(for cityName: String) -> String {
        return cityName.replacingOccurrences(of: " ", with: "_")
    }
    
}
