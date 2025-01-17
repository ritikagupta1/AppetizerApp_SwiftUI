//
//  Alert.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 13/01/25.
//

import SwiftUI
struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertItemContext {
    // MARK: NETWORK ALERTS
    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to server,Please contact support if the issue persists"),
        dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server.Please contact support, or try again later"),
        dismissButton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid.Please contact support"),
        dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete the request, Please check your network connection"),
        dismissButton: .default(Text("Ok")))
    
    // MARK: ACCOUNT ALERTS
    
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please ensure all fields in the form have been filled out."),
        dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please ensure your email is correct"),
        dismissButton: .default(Text("Ok")))
    
    // MARK: USER DETAILS ALERT
    
    static let userSavedSuccessfully = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Your profile has been successfully saved"),
        dismissButton: .default(Text("Ok")))

    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saving/retrieving your profile"),
        dismissButton: .default(Text("Ok")))
    
}
