//
//  AppetizerCellView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct AppetizerCellView: View {
    let appetiser: Appetiser
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetiser.imageUrl)
//                .frame(width: 120, height: 90)
//                .cornerRadius(10)
            
            AsyncImage(url: URL(string: appetiser.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image(.foodPlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetiser.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetiser.price, specifier: "%.2f")")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.secondary)
                    
            }.padding(.leading)
        }
    }
}

#Preview {
    AppetizerCellView(appetiser: MockData.sampleAppetiser)
}
