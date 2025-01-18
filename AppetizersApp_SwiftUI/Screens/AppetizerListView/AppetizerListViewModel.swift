//
//  AppetizerListViewModel.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 12/01/25.
//

import Foundation
@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetisers: [Appetiser] = []
    @Published var alertItem: AlertItem?
    @Published var selectedAppetiser: Appetiser? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView: Bool = false
    
    @Published var isLoading = false
    
    var blurRadius: CGFloat {
        isShowingDetailView ? 20: 0
    }
    
    var isListDisabled: Bool {
        isShowingDetailView ? true: false
    }
    
//    func getAppetisers() {
//        isLoading = true
//        NetworkManager.shared.getAppetisers { result in
//            DispatchQueue.main.async { [weak self] in
//                guard let self = self else {
//                    return
//                }
//                isLoading = false
//                switch result {
//                case .success(let appetisers):
//                    self.appetisers = appetisers
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertItemContext.invalidData
//                    case .invalidURL:
//                        alertItem = AlertItemContext.invalidURL
//                    case .invalidResponse:
//                        alertItem = AlertItemContext.invalidResponse
//                    case .unableToComplete:
//                        alertItem = AlertItemContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetisers() {
        isLoading = true
        Task {
            do {
                appetisers = try await NetworkManager.shared.getAppetisers()
                isLoading = false
            } catch {
                if let apError = error as? AppetiserError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertItemContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertItemContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertItemContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertItemContext.unableToComplete
                    }
                } else {
                    alertItem = AlertItemContext.unableToComplete
                }
                
                isLoading = false
            }
        }
    }
}
