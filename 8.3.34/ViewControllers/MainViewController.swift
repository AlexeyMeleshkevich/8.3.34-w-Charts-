//
//  MainViewController.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 03/11/2019.
//  Copyright © 2019 Alexey Meleshkevich. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    var taskButton = UIButton()
    var chartButton = UIButton()
    var refreshStorageButton = UIButton()
    let optionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Task"
        
        createTaskButton()
        createChartButton()
        createOptionLabel()
        createRefreshStorageButton()
        
        taskButton.addTarget(self,
                             action: #selector(taskButtonAction(sender:)),
                             for: .touchUpInside)
        chartButton.addTarget(self,
                              action: #selector(chartButtonAction(sender:)),
                              for: .touchUpInside)
        refreshStorageButton.addTarget(self,
                                       action: #selector(refreshButtonAction(sender:)),
                                       for: .touchUpInside)
        
    }
    
    // MARK: CREATE UI ELEMENTS
    func createOptionLabel(){
        let frame = CGRect(x: 130, y: 250, width: 150, height: 30)
        optionLabel.frame = frame
        
        optionLabel.text = "Choose your option:"
        optionLabel.textAlignment = .center
        optionLabel.adjustsFontSizeToFitWidth = true
        
        view.addSubview(optionLabel)
        
    }
    
    func createTaskButton(){
        
        let frame = CGRect(x: 130, y: 300, width: 140, height: 30)
        taskButton.frame = frame
        
        taskButton.layer.cornerRadius = taskButton.frame.size.height / 2
        taskButton.setTitle("Calculate result", for: .normal)
        taskButton.setTitleColor(.white, for: .normal)
        taskButton.backgroundColor = UIColor.blue
        
        //taskButton.sizeToFit()
        view.addSubview(taskButton)
        
    }
    
    func createChartButton(){
        let frame = CGRect(x: 130, y: 350, width: 120, height: 30)
        chartButton.frame = frame
        
        chartButton.layer.cornerRadius = chartButton.frame.size.height / 2
        chartButton.setTitle("Create chart", for: .normal)
        chartButton.setTitleColor(.white, for: .normal)
        chartButton.backgroundColor = UIColor.blue
        
        //chartButton.sizeToFit()
        view.addSubview(chartButton)
    }
    
    func createRefreshStorageButton(){
        let frame = CGRect(x: 130, y: 400, width: 110, height: 30)
        refreshStorageButton.frame = frame
        
        refreshStorageButton.layer.cornerRadius = refreshStorageButton.frame.size.height / 2
        refreshStorageButton.setTitle("Refresh file", for: .normal)
        refreshStorageButton.setTitleColor(.white, for: .normal)
        refreshStorageButton.backgroundColor = UIColor.blue
        
        //refreshStorageButton.sizeToFit()
        view.addSubview(refreshStorageButton)
    }
    
    // MARK: BUTTON ACTIONS
    
    @objc func taskButtonAction(sender: Any){
        
        let secondVC = TaskViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    @objc func chartButtonAction(sender: Any){
        
        let thirdVC = ChartViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
        
        
    }
    
    @objc func refreshButtonAction(sender: Any){
        try! realm.write(){
            realm.deleteAll()
            
            let alert = UIAlertController(title: "File cleaned", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true)
        }
    }
}
