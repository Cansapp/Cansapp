//
//  OrientationViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import Charts

class OrientationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(oriLabel)
        view.addSubview(lineChartView)
        view.addSubview(connectBtn)
        setupView()
        
    }
    
    let lineChartView: LineChartView = {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    let oriLabel: UILabel = {
        let label = UILabel()
        label.text = "Orientación"
        label.tintColor = UIColor.black
        label.font = UIFont(name:"OriyaSangamMN", size: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let connectBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Conectar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.cyan
        button.addTarget(self, action: #selector(runJson), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    
    
    
    
    
    //Funcion inicializar grafica
    func setChartValues(_ count : Int = 20){
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count))+3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let set1 = LineChartDataSet(values: values, label: "Metros")
        let data = LineChartData(dataSet: set1)
        
        lineChartView.data = data
    }


    
    func setupView() {
        //Constraints Label
        NSLayoutConstraint.activate([oriLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -30), oriLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), oriLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10), oriLabel.heightAnchor.constraint(equalToConstant: 25)])
        //Constraint vista Grafica
        NSLayoutConstraint.activate([lineChartView.topAnchor.constraint(equalTo: oriLabel.bottomAnchor, constant: 30), lineChartView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -8), lineChartView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8), lineChartView.heightAnchor.constraint(equalToConstant: 400)])
        
        //Constraint Boton
        NSLayoutConstraint.activate([connectBtn.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 15), connectBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -30), connectBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 30), connectBtn.heightAnchor.constraint(equalToConstant: 25)])
    }
    
    @objc func runJson(){
        let count = Int(arc4random_uniform(20)+3)
        setChartValues(count)
    }

}



