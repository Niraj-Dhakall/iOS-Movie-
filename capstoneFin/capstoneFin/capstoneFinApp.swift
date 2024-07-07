//
//  capstoneFinApp.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import SwiftUI

@main
struct capstoneFinApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
            
            
        }
    }
}


