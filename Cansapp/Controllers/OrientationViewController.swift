//
//  OrientationViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class OrientationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(oriLabel)
        setupView()
        
    }
    
    let oriLabel: UILabel = {
        let label = UILabel()
        label.text = "Orientación"
        label.tintColor = UIColor.black
        label.font = UIFont(name:"OriyaSangamMN", size: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        //Constraints Label
        NSLayoutConstraint.activate([oriLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -10), oriLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), oriLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10), oriLabel.heightAnchor.constraint(equalToConstant: 25)])
    }

}
