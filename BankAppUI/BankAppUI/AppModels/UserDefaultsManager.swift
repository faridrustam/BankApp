//
//  UserDefaults.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 30.11.24.
//

import Foundation

class UserDefaultsManager {
    
    enum UserDefaultsTypes: String, CaseIterable  {
        case loggedIn = "isLoggedIn"
        case fullname = "addedFullname"
        case email = "addedEmail"
        case birthdate = "addedBirthdate"
        case phoneNumber = "addedPhoneNumber"
    }
    
    func setValue(value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func getValue(key: UserDefaultsTypes) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
}
