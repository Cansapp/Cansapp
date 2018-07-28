//
//  PdfViewController.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 23/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import PDFKit

class PdfViewController: UIViewController {
    
    let pdfView: PDFView = {
    let pdf1 = PDFView()
    pdf1.translatesAutoresizingMaskIntoConstraints = false
    return pdf1
}()

    override func viewDidLoad() {
        view.addSubview(pdfView)
        if let path = Bundle.main.path(forResource: "tutorial", ofType: "pdf"){
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)){
                pdfView.displayMode = .singlePageContinuous
                pdfView.autoScales = true
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
            }
        }
        setupView()
        super.viewDidLoad()
    }
    
    func setupView() {
        navigationItem.title = "Guia"
        
        //Constraints PDFView
        NSLayoutConstraint.activate([pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        

    }
    
}
