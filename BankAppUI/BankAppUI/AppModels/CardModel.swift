//
//  CardModel.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 03.12.24.
//

import Foundation

struct CardModel {
    var cardName: [String]
    var cardNumber: [String]
    var expirationDate: [String]
    var cvc: [String]
    var amount: [Int]
}

var infoCard = CardModel(cardName: [], cardNumber: [], expirationDate: [], cvc: [], amount: [])
