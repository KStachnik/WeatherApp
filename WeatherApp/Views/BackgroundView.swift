//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 22/09/2023.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [!isNight ? .black : .blue, !isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isNight = true
        BackgroundView(isNight: $isNight)
    }
}
