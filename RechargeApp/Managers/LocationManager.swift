//
//  LocationManager.swift
//  RechargeApp
//
//  Created by Anamika Deb on 15/7/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate{
    static let sharedLocation = LocationManager()
    
    private override init() { }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    var manager = CLLocationManager()

    var latValue : Double = 0
    var longValue : Double = 0

    func getCurrentLocation() {
//        if (CLLocationManager.locationServicesEnabled())
//        {
//            
//        }
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) { // Updated to current array syntax [AnyObject] rather than AnyObject[]
        print("locations = \(locations)")
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        latValue = locValue.latitude
        longValue = locValue.longitude
    }
}
