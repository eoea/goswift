//
//  ContentView.swift
//  goswift
//
//  Created by Emile Antat on 29/05/2025.
//

import SwiftUI
import CalcKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            print("DBUGR: Go Add Library:")
            print(Add(10, 10))
            print("DBUGR: Go Subtract Library:")
            print(Subtract(10, 5))
        }
    }
}

#Preview {
    ContentView()
}
