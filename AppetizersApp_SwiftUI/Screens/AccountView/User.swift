//
//  User.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 16/01/25.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDay: Date = Date()
    
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
