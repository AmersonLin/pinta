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
    let locationManager = CLLocationManager()

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
        print("Received location update")
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        getUber(locValue)
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }

    func getUber(pickupLocation: CLLocationCoordinate2D){
        let uber = Uber(pickupLocation: pickupLocation)
        
        uber.dropoffLocation = CLLocationCoordinate2D(latitude: 1.35463, longitude: 103.76749)
        uber.dropoffNickname = "Hume"
    
        uber.deepLink()
    }
    

}
