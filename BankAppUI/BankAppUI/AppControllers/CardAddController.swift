//
//  AddCardScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 29.11.24.
//

import UIKit


class AddCardController: UIViewController {
    
    @IBOutlet private weak var cardNameTextField: UITextField!
    @IBOutlet private weak var cardNumberTextField: UITextField!
    @IBOutlet private weak var expireDateTextField: UITextField!
    @IBOutlet private weak var cvcTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Card"
        cardNumberTextField.keyboardType = .numberPad
        expireDateTextField.keyboardType = .numberPad
        cvcTextField.keyboardType = .numberPad
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        if let cardName = cardNameTextField.text, !cardName.isEmpty,
           let cardNumber = cardNumberTextField.text, !cardNumber.isEmpty, cardNumber.count == 16,
           let expireDate = expireDateTextField.text, !expireDate.isEmpty, expireDate.count == 4,
           let cvc =  cvcTextField.text, !cvc.isEmpty, cvc.count == 3 {
            appendCardInfo(cardName: cardName, cardNumber: cardNumber, expirationDate: expireDate, cvc: cvc, amount: 1000)
            
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension AddCardController {
    func appendCardInfo(cardName: String, cardNumber: String, expirationDate: String, cvc: String, amount: Int) {
       infoCard.cardName.append(cardName)
       infoCard.cardNumber.append(cardNumber)
       infoCard.expirationDate.append(expirationDate)
       infoCard.cvc.append(cvc)
       infoCard.amount.append(amount)
   }
}
