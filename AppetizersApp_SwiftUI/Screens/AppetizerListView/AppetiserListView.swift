//
//  AppetizerListView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct AppetiserListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetisers, id: \.id) { appetiser in
                    AppetizerCellView(appetiser: appetiser)
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Appetizers")
            }.onAppear{
                viewModel.getAppetisers()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AppetiserListView()
}
