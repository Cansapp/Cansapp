//
//  MissionViewController.swift
//  Cansapp
//
//  Created by Fernando Razon on 7/5/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class MissionViewController: UITableViewController {
    
    var names:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(botoncito))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        setupView()
    }


    func setupView(){
        view.backgroundColor = UIColor.white
        navigationItem.title = "Mision"
        
    }
    
    @objc func botoncito() {
        
        let alert = UIAlertController(title: "Great Title", message: "Please input something", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Name Input", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            textField.tintColor = UIColor.black
            self.names.append(textField.text!)
            print(self.names)
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your name"
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

    
}
