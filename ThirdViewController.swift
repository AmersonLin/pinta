//
//  ThirdViewController.swift
//  Pinta trial
//
//  Created by KT Khoo on 7/11/15.
//  Copyright © 2015 KT Khoo. All rights reserved.
//

import UIKit
import MapKit

class ThirdViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var getARideButton: UIButton!
    
    let locationManager = CLLocationManager()
    var location = CLLocationCoordinate2D(
        latitude: 1.30199,
        longitude: 103.85160
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("Location services enabled")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = manager.location!.coordinate
    }
    
    // Mark: Actions
    @IBAction func getARideAction(sender: UIButton) {
        let uber = Uber(pickupLocation: self.location)
        uber.dropoffLocation = CLLocationCoordinate2D(latitude: 1.35463, longitude: 103.76749)
        uber.dropoffNickname = "Hume"
        uber.deepLink()
    }
    

}
