//
//  PostViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    var postArray : [Post] = []
    
        @IBOutlet weak var MobileDataTableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "Blogs"
            fetchApi(url:"https://dummyjson.com/posts", methodOfHttp: "GET")
            setTableDelegates()
            registerNib()
            }
            func setTableDelegates(){
                postTableView.delegate = self
                postTableView.dataSource = self
            }
            func registerNib(){
                let uiNibName = UINib(nibName: "postTableViewCell", bundle: nil)
                self.postTableView.register(uiNibName, forCellReuseIdentifier: "postTableViewCell")
            }
            
        }
    extension PostViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
             let postCell = self.postTableView.dequeueReusableCell(withIdentifier:"postTableViewCell")as!
            postTableViewCell
            let eachPost = postArray[indexPath.row]
            postCell.postUserid.text = "Blog no. \(eachPost.id)"
            postCell.postTitleLabel.text = eachPost.title
            postCell.postbodyLabel.text = eachPost.body
            return postCell
            }
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 150
//
//        }
        
    }
    extension PostViewController {
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
                let postRoot:PostData = try!decoder.decode(PostData.self, from: responseData)
                self.postArray = postRoot.posts
                
                DispatchQueue.main.async {
                    self.postTableView.reloadData()
                }
                
            }
            dataTask.resume()
        }
        
    }

