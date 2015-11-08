//
//  SecondViewController.swift
//  Pinta trial
//
//  Created by KT Khoo on 7/11/15.
//  Copyright © 2015 KT Khoo. All rights reserved.
//

import UIKit
import Parse
import Alamofire

class SecondViewController: UIViewController {
    let appSID = "AP216038b9197542ef5686812586ab7a62"
    let accountSID = "AC8d58d550ead8c29830c9bf8d8153b76f"
    let authToken = "35097306a265deb5af3c137f5a5a3f1d"


    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var numberTextField: UITextField!

    @IBOutlet weak var saveContactButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        sendMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sendMessage(){
        let data = [
            "To"   : "+6597354745",
            "From" : "+12012414207",
            "Body" : "Hola Pinta"
        ];

        Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages", parameters: data, encoding: .URL)
            .authenticate(user: accountSID, password: authToken)
            .responseString { response in
                debugPrint(response)

//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
        }
    }

    // MARK: Actions

    @IBAction func saveContactAction(sender: UIButton) {
        var contact = PFObject(className: "GameScore")
        contact.setObject(nameTextField.text, forKey: "name")
        contact.setObject(numberTextField.text, forKey: "number")
        gameScore.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if success {
                NSLog("Object created with id: (gameScore.objectId)")
            } else {
                NSLog("%@", error)
            }
        }

        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }

        print("Save button clicked")
    }
}

