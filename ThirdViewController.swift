//
//  ThirdViewController.swift
//  Pinta trial
//
//  Created by KT Khoo on 7/11/15.
//  Copyright © 2015 KT Khoo. All rights reserved.
//

import UIKit
import MapKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getUber()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getUber(){
        print("In getUber")
        
        // The only required property - pickupLocation
        let pickupLocation = CLLocationCoordinate2D(latitude: 1.30199, longitude: 103.85160)
        
        // Create an Uber instance
        let uber = Uber(pickupLocation: pickupLocation)
        
        // Set a few optional properties
        uber.pickupNickname = "Code Fellows"
        
        uber.dropoffLocation = CLLocationCoordinate2D(latitude: 1.35463, longitude: 103.76749)
        uber.dropoffNickname = "Hume"
        
        // Let's do it!
        uber.deepLink()
    }

}
