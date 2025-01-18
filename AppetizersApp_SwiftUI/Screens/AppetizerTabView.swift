//
//  ContentView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetiserListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
