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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Actions

    @IBAction func saveContactAction(sender: UIButton) {
        let data = [
            "To"   : "+6597354745",
            "From" : "+12012414207",
            "Body" : "Hola Pinta"
        ];
        
        Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages", parameters: data, encoding: .URL)
            .authenticate(user: accountSID, password: authToken)
            .responseString { response in
                debugPrint(response)
        }
    }
}

