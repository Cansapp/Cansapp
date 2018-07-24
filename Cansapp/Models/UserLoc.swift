//
//  UserLoc.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 24/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation
import CoreLocation

class UserLoc {
    
    let locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
    func startReceivingLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            print("No authorization")
            return
        }
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            // Location services is not available.
            print("No enable")
            return
        }
        // Configure and start the service.
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0  // In meters.
        locationManager.startUpdatingLocation()
        let location = locationManager.location
        let alt = location?.altitude
        print("Localizacion: \(location!) Altura: \(String(describing: alt))")
        //print(alt!)
        locationManager.stopUpdatingLocation()
    }
    
}
