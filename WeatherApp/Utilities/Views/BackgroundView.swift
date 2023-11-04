//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var isDay: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isDay ? .blue : .black, isDay ? .white : .gray]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(isDay: .constant(true))
    }
}
