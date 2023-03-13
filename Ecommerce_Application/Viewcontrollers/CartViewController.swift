//
//  CartViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 11/03/23.
//

import UIKit

class CartViewController: UIViewController {
    var cartArray: [Cart] = []
    
    
    @IBOutlet weak var cartTableView: UITableView!
   
//    func populateCartData(){
//        let cart1 = CartData.init(id: 1, title: "shoes", price: 100, discountedPrice:90)
//        let cart2 = CartData.init(id: 2, title: "books", price: 190, discountedPrice:90)
//        let cart3 = CartData.init(id: 3, title: "pen", price: 10, discountedPrice:9)
//        cartArray.append(cart1)
//        cartArray.append(cart2)
//        cartArray.append(cart2)
//    }
        override func viewDidLoad() {
        super.viewDidLoad()
        title = "SHOP NOW"
       fetchApi(url: "https://dummyjson.com/carts", methodOfHttp: "GET")
      // populateCartData()
       registerXib()
       setTableviewdelegates()
    }
    func registerXib(){
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")

    }
    func setTableviewdelegates(){
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
}
extension CartViewController : UITableViewDataSource , UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.viewController = self
        let carrItem = cartArray[indexPath.row]
        cell.cartNameLabel.text = " Cart \(carrItem.id)"
        cell.productArray = carrItem.products
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return CGFloat(200)
        
    }
}
extension CartViewController {
    func fetchApi(url:String, methodOfHttp:String){
        //Create a URL object
        guard let url = URL(string: url) else {
            return
        }
        // create a URLRequest object and pass it to the dataTask(with:) method.
        var request = URLRequest(url: url)
        request.httpMethod = methodOfHttp
        //create object of urlsession
        let urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            guard let responseData = data else {
              print("Data Nil")
              return
            }
            print(String(data: responseData, encoding: .utf8)!)
             
            let decoder = JSONDecoder()
            let root:Root = try!decoder.decode(Root.self, from: responseData)
            self.cartArray = root.carts
            
            DispatchQueue.main.async {
                self.cartTableView.reloadData()
            }
            
        }
        dataTask.resume()
    }
    }
    
    

