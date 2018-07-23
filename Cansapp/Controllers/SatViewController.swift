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
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView(){
        view.backgroundColor = UIColor.white
        navigationItem.title = "Satelites"
        
    }
    
    

}
