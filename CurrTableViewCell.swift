//
//  CurrTableViewCell.swift
//  CurrencyConverter
//
//  Created by Sara Lipowsky on 5/6/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

class CurrTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
        
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
