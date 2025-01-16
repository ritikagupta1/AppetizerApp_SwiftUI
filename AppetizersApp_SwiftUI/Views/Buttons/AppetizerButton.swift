//
//  AppetizerButton.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 16/01/25.
//

import SwiftUI

struct AppetizerButton: View {
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    AppetizerButton(title: "Test Title")
}
