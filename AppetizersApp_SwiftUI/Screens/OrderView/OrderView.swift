//
//  OrderView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct OrderView: View {
    @State var appetisers: [Appetiser] = MockData.appetisers
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(appetisers) { appetiser in
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
                        AppetizerButton(title: "$99.99 - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                
                if appetisers.isEmpty {
                    EmptyState(resource: .emptyOrder, message: "You have no items in your order, please add an appetiser!")
                        .offset(y: -50)
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }

    func deleteItems(at offSets: IndexSet) {
        self.appetisers.remove(atOffsets: offSets)
    }
}

#Preview {
    OrderView(appetisers: MockData.appetisers)
}
