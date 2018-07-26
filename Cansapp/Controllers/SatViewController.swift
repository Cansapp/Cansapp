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
    var loc = UserLoc()
    var positions: [SatPositions] = []
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        mapView.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loc.startReceivingLocationChanges()

        setupView()
        satLocalize()
    }
    
    func setupView(){
        view.backgroundColor = UIColor.white
        navigationItem.title = "Satelites"
    }
    
    func satLocalize(){
        NyoService.shared.all {data in
            self.positions = [data]
        }
        //print(positions.first!)
        
    }

    
}
