//
//  StartButton.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import SwiftUI

struct StartButton: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var text: String;
    var body: some View {
        Text(text)
            
            .foregroundColor(isDarkMode ? .black : .white)
            .padding()
            .padding(.horizontal)
            .background(isDarkMode ? .white : .black)
            .cornerRadius(30)
        
    }
}

#Preview {
    StartButton(text: "Next")
}
