//
//  SatViewController.swift
//  Cansapp
//
//  Created by Fernando Razon on 7/5/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import MapKit

class SatViewController: UIViewController, MKMapViewDelegate {
    
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
        mapView.delegate = self
        var locations: [CLLocationCoordinate2D] = []
        
        setupView()
        
        NyoService.shared.all { data in
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
                    let longitude = CLLocationDegrees(exactly: i.satlongitude)
                    let latitude = CLLocationDegrees(exactly: i.satlatitude)
                    let coord = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                    locations.append(coord)
                }
                let pol = MKPolyline(coordinates:locations, count: 300)
                self.mapView.add(pol)
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var locations: [CLLocationCoordinate2D] = []
        
        NyoService.shared.all { data in
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
                    let longitude = CLLocationDegrees(exactly: i.satlongitude)
                    let latitude = CLLocationDegrees(exactly: i.satlatitude)
                    let coord = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                    locations.append(coord)
                }
                let pol = MKPolyline(coordinates:locations, count: 300)
                self.mapView.add(pol)
                
                //Hacer delay cada segundo los proximos 300 segundos
                _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
                    for i in 1...298{
                        self.mapView.removeAnnotation(self.anotation)
                        self.anotation.coordinate = locations[i]
                        self.anotation.title = "Posicion actual"
                        self.mapView.addAnnotation(self.anotation)
                    }
                    
                }
                
            }
            
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.yellow
            renderer.lineWidth = 3
            return renderer
        }
        
        return MKOverlayRenderer()
    }
    
    func setupView(){
        navigationItem.title = "Satelites"
    }
    
    
}

