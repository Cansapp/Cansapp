//
//  PressureViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class PressureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(presLabel)
        setupView()
        
    }
    
    let presLabel: UILabel = {
        let label = UILabel()
        label.text = "Presión"
        label.tintColor = UIColor.black
        label.font = UIFont(name:"OriyaSangamMN", size: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        //Constraints Label
        NSLayoutConstraint.activate([presLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -10), presLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), presLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10), presLabel.heightAnchor.constraint(equalToConstant: 25)])
    }
    
}
