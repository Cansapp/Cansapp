//
//  MissionViewController.swift
//  Cansapp
//
//  Created by Fernando Razon on 7/5/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class MissionViewController: UITableViewController {
    
    public var names:[String] = ["Cansat UNAM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(misionAlert))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        setupView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Bórrame") { (action, sourceView, completionHandler) in
            /*Se borra del modelo y del tableVIew*/
            self.names.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
        deleteAction.image = UIImage(named: "trash")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])        
        return swipeConfiguration
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(#selector(handleNextProy))
    
    }

    func setupView(){
        view.backgroundColor = UIColor.white
        navigationItem.title = "Misión"
    }
    
    @objc func misionAlert() {
        let alert = UIAlertController(title: "Proyecto Nuevo", message: "Ingresa el nombre del Proyecto", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "Crear Proyecto", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            textField.tintColor = UIColor.black
            if textField.text == ""{
                print("error")
            }else{
            self.names.append(textField.text!)
                self.tableView.reloadData()}
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Nombre del Proyecto"
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleNextProy(){
        let first = ProjViewController()
        //
        self.navigationController?.pushViewController(first, animated: true)
    }
    
}
