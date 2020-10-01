//
//  TableViewCell.swift
//  Death Note
//
//  Created by Macbook Pro on 10/1/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var titluLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name : (String, String, String)? {
        didSet {
            if let n = name {
                titluLabel?.text = n.0
                descriptionLabel?.text = n.1
                dateLabel?.text = n.2
            }
        }
    }

}
