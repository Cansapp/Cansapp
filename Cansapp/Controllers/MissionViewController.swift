//
//  MissionViewController.swift
//  Cansapp
//
//  Created by Fernando Razon on 7/5/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class MissionViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(botoncito))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }


    func setupView(){
        view.backgroundColor = UIColor.white
        navigationItem.title = "Mision"
        
    }
    
    @objc func botoncito(){
        
        let alert = UIAlertController(title: "Great Title", message: "Please input something", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Name Input", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your name"
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)

        
    }
    
}
