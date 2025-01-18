//
//  AccountViewModel.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 16/01/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("userDetails") private var userData: Data? // for user default storage
    
    @Published var user: User = User() // for UI usage
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else {
            DispatchQueue.main.async {
                self.alertItem = AlertItemContext.invalidForm
            }
            return false
        }
        
        guard user.email.isValidEmail else {
            DispatchQueue.main.async {
                self.alertItem = AlertItemContext.invalidEmail
            }
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do {
            let encodeData = try JSONEncoder().encode(user)
            userData = encodeData
            alertItem = AlertItemContext.userSavedSuccessfully
        } catch {
            alertItem = AlertItemContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData else {
            return
        }
        do {
            let decodedUser = try JSONDecoder().decode(User.self, from: userData)
            user = decodedUser
        } catch {
            alertItem = AlertItemContext.invalidUserData
        }
    }
}
