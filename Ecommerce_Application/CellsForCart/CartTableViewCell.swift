//
//  CartTableViewCell.swift
//  Ecommerce_Application
//
//  Created by Sejal on 11/03/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartNameLabel: UILabel!
    @IBOutlet weak var productcollectionView: UICollectionView!
    var productArray: [Product] = []
    var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)

        productcollectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        productcollectionView.delegate = self
        productcollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
extension CartTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productcollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let productItem = productArray[indexPath.row]
        cell.titleLabel.text = productItem.title
        if let image = RandomData().getRandomUIImage() {
            cell.productImageView.image = image
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 50, height:50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selecteditem = productArray[indexPath.row]
        let ProductDetailsViewController = (viewController?.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController)
        ProductDetailsViewController.product = selecteditem
        viewController?.navigationController?.pushViewController(ProductDetailsViewController, animated: true)
        
    }
    
}

