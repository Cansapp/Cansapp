//
//  SatViewController.swift
//  Cansapp
//
//  Created by Fernando Razon on 7/5/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import MapKit

class SatViewController: UIViewController {
    
    var mapView: MKMapView!
    var positions: SatPositions?
    let anotation = MKPointAnnotation()
    
    override func loadView() {
        mapView = MKMapView()
        mapView.mapType = .hybrid
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        NyoService.shared.all {data in
            self.positions = data
            
            DispatchQueue.main.async {
                
                //Se marca la posicion actual de la ISS
                let longitude = CLLocationDegrees(exactly: (self.positions?.positions.first?.satlongitude)!)
                let latitude = CLLocationDegrees(exactly: (self.positions?.positions.first?.satlatitude)!)
                self.anotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                self.anotation.title = "Posicion actual"
                self.mapView.addAnnotation(self.anotation)
                self.mapView.centerCoordinate = self.anotation.coordinate
                
                //Se marcan las proximas 100 pocisiones de la ISS
                self.positions?.positions.forEach{ i in
                    let anotation = MKPointAnnotation()
                    let longitude = CLLocationDegrees(exactly: i.satlongitude)
                    let latitude = CLLocationDegrees(exactly: i.satlatitude)
                    anotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                    self.mapView.addAnnotation(anotation)
                }
            }
            
        }
    }
    
    func setupView(){
        navigationItem.title = "Satelites"
        
    }

    
}
