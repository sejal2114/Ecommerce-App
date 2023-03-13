//
//  CommentsViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import UIKit

class CommentsViewController: UIViewController {
    var jsonDecoder : JSONDecoder?
    var comments = [CommentElement]()
   
    @IBOutlet weak var commentsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
           title = "Comments"
            commentUsingDecoder()
            setProtocol()
            nibRegistration()
        }
    
        func setProtocol(){
            commentsTableView.delegate = self
            commentsTableView.dataSource = self
        }
        func nibRegistration(){
            let uiNibName = UINib(nibName: "CommentTableViewCell", bundle: nil)
            self.commentsTableView.register(uiNibName, forCellReuseIdentifier: "CommentTableViewCell")
        }
        func commentUsingDecoder(){
            let urlstring = "https://dummyjson.com/comments"
            let url = URL(string: urlstring)
            let request = URLRequest(url: url!)
             URLSession.shared.dataTask(with: request){
                data,response,error in
                 print(data as Any)
                if(error == nil){
                    do{
                        self.jsonDecoder = JSONDecoder()
                        let commentResponse = try self.jsonDecoder?.decode(Comment.self, from: data!)
                        self.comments = commentResponse!.comments
                    }
                    catch{
                        print(error)
                    }
                }
                DispatchQueue.main.async {
                    self.commentsTableView.reloadData()
                }
            }
            .resume()
        }
    }
    extension CommentsViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100.0
        }
    }
    extension CommentsViewController:UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return comments.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let CommentTableViewCell = self.commentsTableView.dequeueReusableCell(withIdentifier:"CommentTableViewCell")as!
            CommentTableViewCell
            let eachComment = comments[indexPath.row]
            CommentTableViewCell.commentLabel.text = "\(eachComment.body)"
            
        return CommentTableViewCell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
            let commentDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentDetailsViewController") as! CommentDetailsViewController
            commentDetailsViewController.comment = comments[indexPath.row]
            navigationController?.pushViewController(commentDetailsViewController, animated: true)
        }
    }

