//
//  MainMenuScreen.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 29.11.24.
//

import UIKit

class MainMenuController: UIViewController {
    
    @IBOutlet weak var mainMenuTableView: UITableView!
    let menuManager = MainMenuManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        mainMenuTableView.delegate = self
        mainMenuTableView.dataSource = self
        mainMenuTableView.register(UINib(nibName: "\(MenuControllerCell.self)", bundle: nil), forCellReuseIdentifier: "\(MenuControllerCell.self)")
    }
}

extension MainMenuController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuManager.getMenuItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuControllerCell.self)", for: indexPath) as! MenuControllerCell
        cell.callElement(menuName: menuManager.getMenuItems()[indexPath.row].title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getMenu(model: menuManager.getMenuItems()[indexPath.row].title, cards: "Cards", transfer: "Transfer", profile: "Profile")
        }
    }

extension MainMenuController {
    
    func getMenu(model: String, cards: String, transfer: String, profile: String) {
        switch model {
        case cards:
            if infoCard.cardName.isEmpty {
                let controller = storyboard?.instantiateViewController(withIdentifier: "\(AddCardController.self)") as! AddCardController
                
                navigationController?.show(controller, sender: nil)
            } else {
                let controller = storyboard?.instantiateViewController(identifier: "\(CardsController.self)") as! CardsController
                
                navigationController?.show(controller, sender: nil)
            }
            
        case transfer:
            if !infoCard.cardName.isEmpty {
                let controller = storyboard?.instantiateViewController(withIdentifier: "\(CardsController.self)") as! CardsController
                
                navigationController?.show(controller, sender: nil)
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "You don't have added card to transfer money!", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(errorAlert, animated: true, completion: nil)
            }
            
        case profile:
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(ProfileController.self)") as! ProfileController
            
            navigationController?.show(controller, sender: nil)
            
        default:
            print("No option")
        }
    }
}
