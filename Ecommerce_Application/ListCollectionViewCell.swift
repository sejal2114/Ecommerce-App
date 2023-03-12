//
//  ListCollectionViewCell.swift
//  Ecommerce_Application
//
//  Created by Sejal on 09/03/23.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
    }

}
