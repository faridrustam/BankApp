//
//  MenuControllerCell.swift
//  BankAppUI
//
//  Created by Farid Rustamov on 03.12.24.
//

import UIKit

class MenuControllerCell: UITableViewCell {
    
    @IBOutlet weak var menuNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func callElement(menuName: String) {
        menuNameLabel.text = menuName
    }
}
