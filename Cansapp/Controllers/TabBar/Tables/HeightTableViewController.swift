//
//  HeightTableViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 27/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class HeightTableViewController: UITableViewController {

    var vals:[Double] = []
    
    override func viewDidLoad() {
        addValues()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = String("En el segundo \(indexPath.row + 1): se midio \(vals[indexPath.row]) Metros")
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.lightGray
        }else{
            cell.backgroundColor = UIColor.darkGray
            cell.textLabel?.textColor = UIColor.white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(#selector(closeView))
        
    }
    
    func addValues(){
        guard let path = Bundle.main.path(forResource: "prueba", ofType: "json") else {return}
        if vals == []{
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let datos  = jsonResult["prueba"] as? [[String:Double]]{
                    for i in datos{
                        vals.append(i["Altura"]!)
                    }
                }
            }
            catch{
                print("error")
            }
        }
        else{return}
    }
    
    @objc func closeView(){
        dismiss(animated: true, completion: nil)
    }

}
