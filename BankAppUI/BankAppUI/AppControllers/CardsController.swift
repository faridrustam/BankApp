//
//  CardsScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 01.12.24.
//

import UIKit

class CardsController: UIViewController {
    
    @IBOutlet private weak var cardListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cards"
        cardListTableView.dataSource = self
        cardListTableView.delegate = self
        cardListTableView.register(UINib(nibName: "\(MenuControllerCell.self)", bundle: nil), forCellReuseIdentifier: "\(MenuControllerCell.self)")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
}

extension CardsController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoCard.cardName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuControllerCell.self)", for: indexPath) as! MenuControllerCell
        cell.callElement(menuName: infoCard.cardName[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(TransferController.self)") as! TransferController
        
        controller.selectedCardIndex = indexPath.row
        
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func addButtonTapped() {
        let controller = storyboard?.instantiateViewController(identifier: "\(AddCardController.self)") as! AddCardController
        
        navigationController?.show(controller, sender: nil)
    }
}
