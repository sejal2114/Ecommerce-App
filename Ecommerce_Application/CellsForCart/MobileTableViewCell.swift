//
//  MobileTableViewCell.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import UIKit

class MobileTableViewCell: UITableViewCell {

    @IBOutlet weak var mobilepriceLabel: UILabel!
    @IBOutlet weak var mobileTitleLabel: UILabel!
    @IBOutlet weak var mobileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
