//
//  ProfileScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 02.12.24.
//

import UIKit

class ProfileController: UIViewController {
    
    var manager = UserDefaultsManager()
    
    @IBOutlet private weak var fullnameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var birthDateLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        if let fullname = manager.getValue(key: .fullname), let email = manager.getValue(key: .email), let birthDate = manager.getValue(key: .birthdate), let phoneNumber = manager.getValue(key: .phoneNumber) {
            fullnameLabel.text = "Fullname: \(fullname)"
            emailLabel.text = "Email: \(email)"
            birthDateLabel.text = "Birthdate: \(birthDate)"
            phoneNumberLabel.text = "Phone number: \(phoneNumber)"
        }
    }
}
