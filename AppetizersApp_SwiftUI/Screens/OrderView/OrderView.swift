//
//  OrderView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetiser in
                            AppetizerCellView(appetiser: appetiser)
                        }
                        .onDelete(perform: deleteItems)
    //                    .onDelete { indexSet in
    //                        appetisers.remove(atOffsets: indexSet)
    //                    }
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
//                        AppetizerButton(title: "\(order.items.reduce(0, { $0 + $1.price}), specifier: "%.2f") - Place Order")
                        Text("\(order.items.reduce(0, { $0 + $1.price}), specifier: "%.2f") - Place Order")
                    }
//                    .modifier(StandardButtonStyle())
                    .standardButtonModifier()
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(resource: .emptyOrder, message: "You have no items in your order, please add an appetiser!")
                        .offset(y: -50)
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }

    func deleteItems(at offSets: IndexSet) {
        order.deleteItems(at: offSets)
    }
}

#Preview {
    OrderView()
}
