//
//  CommentDetailsViewController.swift
//  Ecommerce_Application
//
//  Created by Sejal on 13/03/23.
//

import UIKit

class CommentDetailsViewController: UIViewController {
    var comment: CommentElement?
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let commentData = comment {
            title = commentData.user.username

            userLabel.text = " \(commentData.user.id)"
            userNameLabel.text = commentData.user.username
        }
    
    }
    

   


}
