//
//  AppetizerListViewModel.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 12/01/25.
//

import Foundation
class AppetizerListViewModel: ObservableObject {
    @Published var appetisers: [Appetiser] = []
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
    
    func getAppetisers() {
        isLoading = true
        NetworkManager.shared.getAppetisers { result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                isLoading = false
                switch result {
                case .success(let appetisers):
                    self.appetisers = appetisers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertItemContext.invalidData
                    case .invalidURL:
                        alertItem = AlertItemContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertItemContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertItemContext.unableToComplete
                    }
                }
            }
        }
    }
}
