//
//  UserLoc.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 24/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class UserLoc {
    
    let locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
    func startReceivingLocationChanges() {
        
        //Se revisa si se ha dado autorizacion
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
        
        // Se inicia a consumir el servicio
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0  // In meters.
        locationManager.startUpdatingLocation()
        let lat = locationManager.location?.coordinate.latitude
        let lon = locationManager.location?.coordinate.longitude
        let alt = locationManager.location?.altitude
        
        print("Lat: \(String(describing: lat)) lon: \(String(describing: lon)) alt: \(String(describing: alt)) ")
        //print(alt!)
        locationManager.stopUpdatingLocation()
    }
    
}
