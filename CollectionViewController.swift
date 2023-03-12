//
//  CollectionViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 09/03/23.
//

import UIKit
class CollectionViewController: UIViewController {

    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    var dashboardItemArray : [DashboardItem] =  [ DashboardItem(id: 1, name: "Carts", image: "cart"), DashboardItem(id: 2, name: "Photos", image: "photo"), DashboardItem(id: 3, name: "Comments", image: "comments") , DashboardItem(id: 4, name: "Post", image: "post")]
                                                  
//    //func poulatedata(){
//        let item1 = DashboardItem(id: 1, name: "Cart" , image: "cart")
//        let item2 = DashboardItem(id: 2, name: "Photos", image: "Gallery")
//        let item3 = DashboardItem(id: 3, name: "Comments", image: "comments")
//        let item4 = DashboardItem(id: 4, name: "Post" , image: "post")
//        dashboardItemArray.append(item1)
//        dashboardItemArray.append(item2)
//        dashboardItemArray.append(item3)
//        dashboardItemArray.append(item4)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // poulatedata()
        let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        dashboardCollectionView.register(nib, forCellWithReuseIdentifier: "ListCollectionViewCell")
    
        dashboardCollectionView.delegate = self
        dashboardCollectionView.dataSource = self
    }
}

extension CollectionViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dashboardItemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        let itemInDashboard = dashboardItemArray[indexPath.row]
        cell.itemNameLabel.text = itemInDashboard.name
        cell.imageView.image = UIImage(named: itemInDashboard.image)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (collectionView.frame.size.width - 10) / 2, height: (collectionView.frame.size.height - 20) / 3)
    }
   

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selecteditem = dashboardItemArray[indexPath.row]
        if selecteditem.name == "Carts"{
            let cartViewController = (self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController)
            self.navigationController?.pushViewController(cartViewController, animated: true)
        }
        else if selecteditem.name == "Photos"{
            
        }
        else if selecteditem.name == "Comments"{
            
        }
        else if selecteditem.name == "Post"{
            
        }
        
    }
}
