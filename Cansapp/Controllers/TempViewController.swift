//
//  TempViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//
import UIKit
import Charts

class TempViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tempLabel)
        setupView()
    }
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Temperatura"
        label.tintColor = UIColor.black
        label.font = UIFont(name:"OriyaSangamMN", size: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        //Constraints Label
        NSLayoutConstraint.activate([tempLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -30), tempLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), tempLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10), tempLabel.heightAnchor.constraint(equalToConstant: 25)])
    }

}
