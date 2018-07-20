//
//  PressureViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import Charts

class PressureViewController: UIViewController {
    
    var vals:[Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(presLabel)
        view.addSubview(lineChartView)
        view.addSubview(connectBtn)
        setupView()
        
        guard let path = Bundle.main.path(forResource: "prueba", ofType: "json") else {return}
        //let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let datos  = jsonResult["prueba"] as? [[String:Double]]{
                //Do Stuff
                for i in datos{
                    vals.append(i["Presion"]!)
                }
            }
        }
        catch{
            print("error")
        }
    
        
    }
    
    let presLabel: UILabel = {
        let label = UILabel()
        label.text = "Presion"
        label.tintColor = UIColor.black
        label.font = UIFont(name:"OriyaSangamMN", size: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineChartView: LineChartView = {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    let connectBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Conectar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(runJson), for: .touchUpInside)
        button.backgroundColor = UIColor.cyan
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    //Funcion inicializar grafica
    func setChartValues(x: Int){
        let array: [(Int, Double)] = vals.enumerated().map { ($0, $1) }
        let values = array.map { x, y in
            return ChartDataEntry(x: Double(x), y: y)
        }
        let set1 = LineChartDataSet(values: values, label: "ºC")
        set1.colors = [UIColor.red]
        let data = LineChartData(dataSet: set1)
        lineChartView.data = data
    }
    
    func setupView() {
        //Constraints Label
        NSLayoutConstraint.activate([presLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -30), presLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), presLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 20), presLabel.heightAnchor.constraint(equalToConstant: 25)])
        
        //Constraint vista Grafica
        NSLayoutConstraint.activate([lineChartView.topAnchor.constraint(equalTo: presLabel.bottomAnchor, constant: 30), lineChartView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -8), lineChartView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8), lineChartView.heightAnchor.constraint(equalToConstant: 400)])
        
        //Constraint Boton
        NSLayoutConstraint.activate([connectBtn.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 15), connectBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -30), connectBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 30), connectBtn.heightAnchor.constraint(equalToConstant: 25)])
    }
    
    @objc func runJson(){
        setChartValues(x: vals.count)
    }
    
}
