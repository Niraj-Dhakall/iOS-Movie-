//
//  ContentView.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack {
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                NavigationLink(destination: MovieViews().navigationBarBackButtonHidden(true)) {
                    StartButton(text: "Let's Go!")
                        .fontWeight(.heavy)
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                    
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
