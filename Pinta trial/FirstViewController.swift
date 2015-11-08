//
//  FirstViewController.swift
//  Pinta trial
//
//  Created by KT Khoo on 7/11/15.
//  Copyright © 2015 KT Khoo. All rights reserved.
//

import UIKit
import Parse

class FirstViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var messageLabel: UILabel!
    
    
    
    @IBAction func loginVerifyButton(sender: AnyObject) {
        
        func userSignUp() {
            
        }
        
        let usrEntered = usernameTextField.text
        let pwdEntered = passwordTextField.text
        let emlEntered = emailTextField.text
        
        if usrEntered != "" && pwdEntered != "" && emlEntered != "" {
            userSignUp()
        } else {
            self.messageLabel.text = "All Fields Required"
        }
        
        let user = PFUser()
        user.username = usrEntered
        user.password = pwdEntered
        user.email = emlEntered
        user.signUpInBackgroundWithBlock {
            (succeeded, error) -> Void in
            if error == nil {
                self.messageLabel.text = "User Signed Up";
            } else {
                self.messageLabel.text = "All Fields Required"
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

