//
//  CustomModifiers.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 18/01/25.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonModifier() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
