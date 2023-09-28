//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 17/09/2023.
//

import SwiftUI

struct WeatherButton: View {
    
    @Binding var isDay: Bool
    
    var title: String
    var textColor: Color
    var dayBackgroundColor: Color
    var nightBackgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(isDay ? dayBackgroundColor : nightBackgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(isDay: .constant(false),
                      title: "Test Title",
                      textColor: .white,
                      dayBackgroundColor: .orange,
                      nightBackgroundColor: .blue
                    )
    }
}
