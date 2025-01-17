//
//  EmptyState.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 16/01/25.
//

import SwiftUI

struct EmptyState: View {
    var resource: ImageResource
    var message: String
    
    var body: some View {
        VStack {
            Image(resource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
            
            Text(message)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding()
        }
    }
}

#Preview {
    EmptyState(resource: .emptyOrder,
               message: "This is a test message.\nI am making it a little long to test")
}
