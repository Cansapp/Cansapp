//
//  ProjViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class ProjViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //navigationItem.title = MissionViewController.names
        
        let tempe = TempViewController()
        let tempeController = UINavigationController(rootViewController: tempe)
        tempeController.tabBarItem.image = #imageLiteral(resourceName: "temp")
        tempeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "temp_F")
        
        let press = PressureViewController()
        let pressController = UINavigationController(rootViewController: press)
        pressController.tabBarItem.image = #imageLiteral(resourceName: "pres")
        pressController.tabBarItem.selectedImage = #imageLiteral(resourceName: "pres_F")
        
        let altitu = HeightViewController()
        let altituController = UINavigationController(rootViewController: altitu)
        altituController.tabBarItem.image = #imageLiteral(resourceName: "altit")
        altituController.tabBarItem.selectedImage = #imageLiteral(resourceName: "altit_F")
        
        let orienta = OrientationViewController()
        let orientController = UINavigationController(rootViewController: orienta)
        orientController.tabBarItem.image = #imageLiteral(resourceName: "orien")
        orientController.tabBarItem.selectedImage = #imageLiteral(resourceName: "orien_F")
        
        viewControllers = [tempeController, pressController, altituController, orientController]
    }
}
