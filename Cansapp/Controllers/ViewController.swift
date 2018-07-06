//
//  ViewController.swift
//  Cansapp
//
//  Created by d182_fernando_r on 30/06/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //Label superior
    let satLabel: UILabel = {
        let label = UILabel()
        label.text = "CansApp"
        label.font = UIFont(name:"OriyaSangamMN", size: 40.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Boton Satelite
    let satButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Satelites", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        //button.addTarget(self, action: #selector(handleNextSat), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    //Boton Proyecto
    let proyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mision", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        //button.addTarget(self, action: #selector(handleNextProy), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()

    //Imagen Satelite
    let satImage: UIImageView = {
        let imagen = UIImageView(image: #imageLiteral(resourceName: "satIcon"))
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFit
        return imagen
    }()
    
    //Se agregan constraints
    func setupView(){
        
         view.backgroundColor = UIColor.white
        
        view.addSubview(satLabel)
        view.addSubview(satButton)
        view.addSubview(proyButton)
        view.addSubview(satImage)
        
        //Constraints Label
        NSLayoutConstraint.activate([satLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20), satLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), satLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10), satLabel.heightAnchor.constraint(equalToConstant: 45)])
        
        //Constraints Imagen
        NSLayoutConstraint.activate([satImage.topAnchor.constraint(equalTo: satLabel.bottomAnchor, constant: 30),satImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -50), satImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 50),satImage.heightAnchor.constraint(equalToConstant: 200)])
        
        //Boton de abajo alv
        NSLayoutConstraint.activate([proyButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100), proyButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 90), proyButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -90), proyButton.heightAnchor.constraint(equalToConstant: 45)])
        
        //Boton de arriba
        NSLayoutConstraint.activate([satButton.bottomAnchor.constraint(equalTo: proyButton.topAnchor, constant: -20), satButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 90), satButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -90), satButton.heightAnchor.constraint(equalToConstant: 45)])
        
    }
    
    
    
    
    
    
    
}

