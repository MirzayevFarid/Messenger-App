//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {
    
    

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.textColor = UIColor.black
        passwordTextfield.textColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
        
            if error != nil{
                
                self.emailTextfield.textColor = UIColor.red
                self.passwordTextfield.textColor = UIColor.red
                
                SVProgressHUD.dismiss()
                
                print(error!)
            }else{
                print("LOGIN SUCCESSFULLY!")
                
                self.emailTextfield.textColor = UIColor.green
                self.passwordTextfield.textColor = UIColor.green
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    


    
}  
