//
//  ViewControllerTableViewCell.swift
//  CurrencyApp_Chris_1
//
//  Created by CampusUser on 5/8/17.
//  Copyright © 2017 Fullerton. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var theRate: UILabel!
    @IBOutlet weak var finalExchangeValue: UILabel!
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
