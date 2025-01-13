//
//  ContentView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetiserListView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            AccountView()
                .tabItem {
                    Text("Account")
                    Image(systemName: "person")
                }
            OrderView()
                .tabItem {
                    Text("Order")
                    Image(systemName: "bag")
                }
        }
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
