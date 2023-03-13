//
//  ViewController.swift
//  Ecommerce_Application

import UIKit
class ViewController: UIViewController {
    
    var users: [String:String] = ["Sejal": "Pass1","Mayuri": "Pass2","Rohan": "Pass3"]
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        let username = userNameText.text!
        let password = passwordTextField.text!
        
        
        if users.keys.contains(username) {
            if password == users[username] {
                let listController = storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
                listController.username = username
                self.navigationController?.pushViewController(listController, animated: true)
            }
        } else {
            print("user is not registered")
        }
        
    }
    
    @IBAction func showAlertPopup(_ sender: Any)  {
        // create the alert
        let alert = UIAlertController(title: "Alert title", message: "Alert message?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "button 1", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "button 2", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "button 3", style: UIAlertAction.Style.default, handler: { action in
            
            // do something like...
            self.singleButtonAlert()
            
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    func singleButtonAlert(){
        let alert = UIAlertController(title: "Alert title", message: "Alert message?",preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


    




