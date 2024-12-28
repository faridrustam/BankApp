//
//  LoginScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 28.11.24.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    let manager = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, !email.isEmpty, email.contains("@"), let password = passwordTextField.text, !password.isEmpty {
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(MainMenuController.self)") as! MainMenuController
            
            manager.setValue(value: true, key: .loggedIn)
            
            navigationController?.show(controller, sender: nil)
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "\(RegisterController.self)") as! RegisterController
        controller.successAction = {
            getInfo in
            self.emailTextField.text = getInfo.email
            self.passwordTextField.text = getInfo.password
        }
        navigationController?.show(controller, sender: nil)
    }
    
    func callElement(email: String, password: String) {
        emailTextField.text = email
        passwordTextField.text = password
    }
}
