//
//  TempViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 10/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//
import UIKit
import Charts

class TempViewController: UIViewController{
    
    var vals:[Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tempLabel)
        view.addSubview(lineChartView)
        view.addSubview(connectBtn)
        view.addSubview(exportBtn)
        view.addSubview(dataBtn)
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
    //LineChart
    let lineChartView: LineChartView = {
        let chart = LineChartView()
        chart.chartDescription?.text = "Temperature Chart"
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    //Boton conectar
    let connectBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Conectar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(runJson), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    //Boton exportar
    let exportBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Exportar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveChart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    //Boton Datos
    let dataBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Datos", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(dataDisplay), for: .touchUpInside)
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
    

    let alertController: UIAlertController = {
        let alert = UIAlertController()
        alert.title = "Grafica Exportada"
        alert.message = "La grafica se ha guardado en la galeria de fotos"
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        return alert
    }()
    
    func addValues(){
        guard let path = Bundle.main.path(forResource: "prueba", ofType: "json") else {return}
        if vals == []{
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let datos  = jsonResult["prueba"] as? [[String:Double]]{
                    for i in datos{
                        vals.append(i["Temperatura"]!)
                    }
                }
            }
            catch{
                print("error")
            }
        }
        else{return}
    }

    
    
    func setupView() {
        //Constraints Label
        NSLayoutConstraint.activate([tempLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -30), tempLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -20), tempLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10), tempLabel.heightAnchor.constraint(equalToConstant: 25)])
        
        NSLayoutConstraint.activate([lineChartView.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10), lineChartView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -8), lineChartView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8), lineChartView.heightAnchor.constraint(equalToConstant: 400)])
        
        //Constraint Boton Conectar
        NSLayoutConstraint.activate([connectBtn.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 15), connectBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -30), connectBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 30), connectBtn.heightAnchor.constraint(equalToConstant: 15)])

        //Constraint Boton Exportar
        NSLayoutConstraint.activate([exportBtn.topAnchor.constraint(equalTo: connectBtn.bottomAnchor, constant: 15), exportBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -30), exportBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 30), exportBtn.heightAnchor.constraint(equalToConstant: 15)])

        //Constraint Boton Datos
        NSLayoutConstraint.activate([dataBtn.topAnchor.constraint(equalTo: exportBtn.bottomAnchor, constant: 15), dataBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -30), dataBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 30), dataBtn.heightAnchor.constraint(equalToConstant: 15)])
        
    }
    

    
    
    @objc func runJson(){
        addValues()
        setChartValues(x: vals.count)
    }
    
    @objc func saveChart(){
        let image = lineChartView.getChartImage(transparent: false)
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func dataDisplay(){
        let first = TempTableViewController()
        present(first, animated: true, completion: nil)
    }
    

}
