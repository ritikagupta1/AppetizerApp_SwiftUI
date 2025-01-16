//
//  AppetizerDetailView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 15/01/25.
//

import SwiftUI

struct AppetizerDetailView: View {
    var appetiser: Appetiser
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetiser.imageUrl)
                .frame(width: 300, height: 225)
                
            VStack {
                Text(appetiser.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                
                Text(appetiser.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(
                        title: "Calories",
                        value: appetiser.calories)
                    NutritionInfo(
                        title: "Carbs",
                        value: appetiser.carbs)
                    NutritionInfo(
                        title: "Protein",
                        value: appetiser.protein)
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                AppetizerButton(title: "$ \(appetiser.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailView = false
            } label: {
                XDismissButton()
            }
        }
    }
}

#Preview {
    AppetizerDetailView(appetiser: MockData.sampleAppetiser, isShowingDetailView: .constant(false))
}

struct NutritionInfo: View {
    var title: String
    var value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            
            Text("\(value)")
                .italic()
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
        
    }
}
