//
//  ChartViewController.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 03/11/2019.
//  Copyright © 2019 Alexey Meleshkevich. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ChartViewController: UIViewController {
    
    var enterResistance = UITextField()
    var enterAmperage = UITextField()
    
//    var dataEntries = [ChartDataEntry]()
//    var chartDataBeanArray = [ChartData]()
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateChartData()
//        createResistanceField()
//        createAmperageField()
        
    }
    
    func createResistanceField(){
        let frameText = CGRect(x: 65, y: 200, width: 250, height: 25)
        enterResistance = UITextField(frame: frameText)
        
        enterResistance.placeholder = "enter R start value"
        enterResistance.borderStyle = .roundedRect
        
        view.addSubview(enterResistance)
    }
    
    func createAmperageField(){
        let frameText = CGRect(x: 65, y: 100, width: 250, height: 25)
        enterAmperage = UITextField(frame: frameText)
        enterAmperage.placeholder = "enter I start value"
        enterAmperage.borderStyle = .roundedRect
        view.addSubview(enterAmperage)
    }
//
//    func updateChartData(){
//        let realm = try! Realm()
//        let results = realm.objects(Values.self)
//        let resultsArray = [Double]()
//        results[0].result =
//    }
}
