//
//  TransferScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 01.12.24.
//

import UIKit

class TransferController: UIViewController {
    
    @IBOutlet private weak var transferCardTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var totalAmountLabel: UILabel!
    
    var selectedCardIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transfer"
        transferCardTextField.keyboardType = .phonePad
        amountTextField.keyboardType = .phonePad
        
        if let index = selectedCardIndex {
            totalAmountLabel.text = "Total Amount: \(infoCard.amount[index]) ₼"
        }
    }
    
    @IBAction func transferbuttonTapped(_ sender: Any) {
        
        guard let cardNumber = transferCardTextField.text, !cardNumber.isEmpty, cardNumber.count == 16, let amount = amountTextField.text, !amount.isEmpty, let intAmount = Int(amount), let index = selectedCardIndex else {
            showAlert(title: "Error", message: "Please select a card and enter an amount.")
            return
        }
        if infoCard.amount[index] >= intAmount {
            infoCard.amount[index] -= intAmount
            
            totalAmountLabel.text = "Total Amount: \(infoCard.amount[index]) ₼"
            
            showAlert(title: "Success", message: "\(intAmount) ₼ has been transferred successfully.")
        } else {
            showAlert(title: "Error", message: "You don't have enough funds in your balance!")
        }
    }
}

extension TransferController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
