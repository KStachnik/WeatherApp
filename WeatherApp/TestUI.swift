//
//  TestUI.swift
//  WeatherApp
//
//  Created by Krystian Stachnik on 17/09/2023.
//

import SwiftUI

final class Counter: ObservableObject {
    @Published private(set) var ticks = 0
    
    func increase() {
        ticks += 1
    }
}

struct TestUI: View {
    
    @StateObject var counter: Counter
    @State var x: Int = 0
    
    var body: some View {
        VStack {
            Text("Ticks: \(counter.ticks)")
            Text("\(x)")
            Button("+") {
                counter.increase()
                x = counter.ticks
            }
        }
    }
}

struct TestUI_Previews: PreviewProvider {
    static var previews: some View {
        TestUI(counter: Counter())
    }
}
