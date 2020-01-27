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
    
    
    var values: Results<Values>!
    var lineChartView = LineChartView()
    
    // MARK: - user set
    var labelResistance = UILabel()
    var labelAmperage = UILabel()
    var enterAmperageField = UITextField()
    var enterResistanceField = UITextField()
    var resistanceStepLabel = UILabel()
    var amperageStepLabel = UILabel()
    let resistanceStepper = UIStepper()
    let amperageStepper = UIStepper()
    
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Chart"
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //createAmperageLabel(sender: labelAmperage)
        //createAmperageStepLabel(sender: amperageStepLabel)
        //createEnterAmperageLabel(sender: enterAmperageField)
        //createAmperageStepper(sender: amperageStepper)
        //amperageStepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        
        //createResistanceLabel(sender: labelResistance)
        //createResistanceStepLabel(sender: resistanceStepLabel)
        //createEnterResistanceField(sender: enterResistanceField)
        
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        configureLineChart()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: String(describing: ChartViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLineChart(){
        lineChartView = LineChartView(frame: containerView.frame)
        lineChartView.backgroundColor = UIColor.white
        containerView.backgroundColor = UIColor.clear
        values = realm.objects(Values.self)
        var dataSet1 = [ChartDataEntry]()
        for i in 0..<values.count {
            dataSet1.append(ChartDataEntry(x: Double(i), y: values[i].result))
            print(values[i].result)
        }
        let dataForChart = LineChartDataSet(entries: dataSet1, label: "Data set 1")
        let data = LineChartData(dataSet: dataForChart)
        self.lineChartView.data = data
        containerView.addSubview(lineChartView)
        
    }
    // MARK: - set Resistance fields
    func createResistanceStepLabel(sender: UILabel){
        let frame = CGRect(x: 200, y: 600, width: 30, height: 20)
        sender.frame = frame
        sender.text = "1"
        self.view.addSubview(sender)
    }
    
    func createResistanceLabel(sender: UILabel){
        let frame = CGRect(x: 100, y: 600, width: 30, height: 20)
        sender.frame = frame
        sender.text = "R ="
        self.view.addSubview(sender)
    }
    
    func createEnterResistanceField(sender: UITextField){
        let frame = CGRect(x: 150, y: 600, width: 40, height: 20)
        sender.frame = frame
        sender.placeholder = "enter start R"
        sender.borderStyle = .roundedRect
        self.view.addSubview(sender)
    }
    
    func createResistanceStepper(sender: UIStepper){
        
    }
    // MARK: - set Amperage fields
    func createAmperageLabel(sender: UILabel){
        let frame = CGRect(x: 100, y: 500, width: 30, height: 20)
        sender.frame = frame
        sender.text = "I ="
        self.view.addSubview(sender)
    }
    
    func createAmperageStepLabel(sender: UILabel){
           let frame = CGRect(x: 200, y: 500, width: 30, height: 20)
           sender.frame = frame
           sender.text = "1"
           self.view.addSubview(sender)
       }
    
    func createEnterAmperageLabel(sender: UITextField){
        let frame = CGRect(x: 150, y: 500, width: 40, height: 20)
        sender.frame = frame
        sender.placeholder = "enter start I"
        sender.borderStyle = .roundedRect
        self.view.addSubview(sender)
    }
    
    func createAmperageStepper(sender: UIStepper){
        let frame = CGRect(x: 250, y: 500, width: 40, height: 20)
        sender.frame = frame
        self.view.addSubview(sender)
    }
    
}


