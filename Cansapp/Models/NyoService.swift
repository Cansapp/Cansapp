//
//  NyoService.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 23/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation
import CoreLocation

class NyoService {
    
    var locationManager = CLLocationManager()
    
    func startReceivingVisitChanges() {
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            return
        }
        
        if !CLLocationManager.locationServicesEnabled() {
            // This service is not available.
            return
        }
    }

    
}
