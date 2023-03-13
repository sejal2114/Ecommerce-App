//
//  ProductDetailsViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 12/03/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discounLabel: UILabel!
    var product : Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedProduct = product {
            title = selectedProduct.title
            titleLabel.text = selectedProduct.title
            priceLabel.text = " Price: \( selectedProduct.price)"
            discounLabel.text = "Discounted Price :\(selectedProduct.discountPercentage)"
            }
        }
        
    }


