//
//  BCountryTableViewCell.swift
//  budfox
//
//  Created by Vladimir Psyukalov on 18.09.17.
//  Copyright © 2017 YOUROCK INC. All rights reserved.
//

import UIKit

class BCountryTableViewCell: UITableViewCell {
    
    static let identifier: String = "BCountryTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    var name: String {
        set (value) {
            self.nameLabel.text = value
        }
        get {
            return self.nameLabel.text!
        }
    }
    
    var code: String {
        set (value) {
            self.codeLabel.text = value
        }
        get {
            return self.codeLabel.text!
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
