//
//  RegisterScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 28.11.24.
//

import UIKit

class RegisterController: UIViewController {
    
    var successAction: ((ProfileModel) -> Void)?
    var manager = UserDefaultsManager()
    
    @IBOutlet private weak var fullnameTextField: UITextField!
    @IBOutlet private weak var birthDateTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        emailTextField.keyboardType = .emailAddress
        phoneNumberTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if let fullname = fullnameTextField.text, !fullname.isEmpty,
           let birthDate = birthDateTextField.text, !birthDate.isEmpty, birthDate.contains(where: \.isNumber),
           let email = emailTextField.text, !email.isEmpty, email.contains("@"),
           let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty, phoneNumber.contains(where: \.isNumber),
           let password = passwordTextField.text, !password.isEmpty {
            
            let getInfo = ProfileModel(fullname: fullname, birthDate: birthDate, email: email, phoneNumber: phoneNumber, password: password)
            
            manager.setValue(value: fullname, key: .fullname)
            manager.setValue(value: birthDate, key: .birthdate)
            manager.setValue(value: email, key: .email)
            manager.setValue(value: phoneNumber, key: .phoneNumber)
            
            successAction?(getInfo)
            
            navigationController?.popViewController(animated: true)
        }
    }
}
