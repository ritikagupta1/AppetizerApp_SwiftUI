//
//  Order.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 17/01/25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetiser] = []
    
    func add(_ appetiser: Appetiser) {
        items.append(appetiser)
    }
    
    func deleteItems(at offSet: IndexSet) {
        items.remove(atOffsets: offSet)
    }
}
