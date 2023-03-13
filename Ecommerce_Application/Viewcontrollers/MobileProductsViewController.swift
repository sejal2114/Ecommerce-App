//
//  MobileProductsViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import UIKit
import SDWebImage

class MobileProductsViewController: UIViewController {
    var mobileArray : [Mobile] = []
    @IBOutlet weak var MobileDataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mobiles"

         fetchApi(url:"https://dummyjson.com/products/category/smartphones", methodOfHttp: "GET")
        setTableDelegates()
        registerNib()
        }
        func setTableDelegates(){
            MobileDataTableView.delegate = self
            MobileDataTableView.dataSource = self
        }
        func registerNib(){
            let uiNibName = UINib(nibName: "MobileTableViewCell", bundle: nil)
            self.MobileDataTableView.register(uiNibName, forCellReuseIdentifier: "MobileTableViewCell")
        }
        
    }
extension MobileProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return mobileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let mobileCell = self.MobileDataTableView.dequeueReusableCell(withIdentifier:"MobileTableViewCell")as!
        MobileTableViewCell
        let eachMobile = mobileArray[indexPath.row]
        mobileCell.mobileTitleLabel.text = eachMobile.title
        mobileCell.mobilepriceLabel.text = "Price: \( eachMobile.price)"
        let url = URL(string: eachMobile.thumbnail)
        mobileCell.mobileImageView.sd_setImage(with: url)
        return mobileCell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
}
extension MobileProductsViewController {
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
            let dataRoot:MobileData = try!decoder.decode(MobileData.self, from: responseData)
            self.mobileArray = dataRoot.products
            
            DispatchQueue.main.async {
                self.MobileDataTableView.reloadData()
            }
            
        }
        dataTask.resume()
    }
    
}

