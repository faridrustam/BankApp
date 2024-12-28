//
//  Profile Model.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 29.11.24.
//

import Foundation

struct MainMenuModel {
    let title: String
}

class MainMenuManager {
    func getMenuItems() -> [MainMenuModel] {
        return [.init(title: "Cards"), .init(title: "Transfer"), .init(title: "Profile")]
    }
}
