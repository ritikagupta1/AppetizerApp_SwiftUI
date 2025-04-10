//
//  AppetizersApp_SwiftUIApp.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

@main
struct AppetizersApp_SwiftUIApp: App {
    var order: Order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
