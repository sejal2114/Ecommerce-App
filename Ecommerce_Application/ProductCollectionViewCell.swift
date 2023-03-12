//
//  ProductCollectionViewCell.swift
//  Ecommerce_Application
//
//  Created by Sejal on 11/03/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
   
    @IBOutlet weak var discountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
