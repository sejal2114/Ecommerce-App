//
//  postTableViewCell.swift
//  Ecommerce_Application
//
//  Created by Sejal on 14/03/23.
//

import UIKit

class postTableViewCell: UITableViewCell {

    @IBOutlet weak var postUserid: UILabel!
    
    @IBOutlet weak var postbodyLabel: UILabel!
    
    @IBOutlet weak var postTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
