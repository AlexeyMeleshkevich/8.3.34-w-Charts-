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
        
        self.title = "Tasks"
        
        setUI()
        
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
    
    func setUI() {
        
        createTaskButton()
        createChartButton()
        createOptionLabel()
        createRefreshStorageButton()
        
    }
    func createOptionLabel(){
        //        let frame = CGRect(x: 130, y: 250, width: 150, height: 30)
        //        optionLabel.frame = frame
        
        optionLabel.text = "Choose your option:"
        optionLabel.textAlignment = .center
        optionLabel.adjustsFontSizeToFitWidth = true
        
        view.addSubview(optionLabel)
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            optionLabel.heightAnchor.constraint(equalToConstant: 30),
            optionLabel.widthAnchor.constraint(equalToConstant: 150),
            optionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
    }
    
    func createTaskButton(){
        
        //        let frame = CGRect(x: 0, y: 0, width: 0, height: 30)
        //        taskButton.frame = frame
        
        let height = 30
        
        taskButton.layer.cornerRadius = CGFloat(height / 2)
        taskButton.setTitle("Calculate result", for: .normal)
        taskButton.setTitleColor(.white, for: .normal)
        taskButton.backgroundColor = UIColor(red: 20.0 / 255.0, green: 78.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
        
        //taskButton.sizeToFit()
        view.addSubview(taskButton)
        
        taskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 240),
            taskButton.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            taskButton.widthAnchor.constraint(equalToConstant: 140),
            taskButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
    }
    
    func createChartButton(){
        //        let frame = CGRect(x: 130, y: 350, width: 120, height: 30)
        //        chartButton.frame = frame
        
        let height = 30
        
        chartButton.layer.cornerRadius = CGFloat(height / 2)
        chartButton.setTitle("Create chart", for: .normal)
        chartButton.setTitleColor(.white, for: .normal)
        chartButton.backgroundColor = UIColor(red: 20.0 / 255.0, green: 78.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
        
        //chartButton.sizeToFit()
        view.addSubview(chartButton)
        
        chartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chartButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 290),
            chartButton.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            chartButton.widthAnchor.constraint(equalToConstant: 140),
            chartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    func createRefreshStorageButton(){
        //        let frame = CGRect(x: 130, y: 400, width: 110, height: 30)
        //        refreshStorageButton.frame = frame
        let height = 30
        
        refreshStorageButton.layer.cornerRadius = CGFloat(height / 2)
        refreshStorageButton.setTitle("Refresh file", for: .normal)
        refreshStorageButton.setTitleColor(.white, for: .normal)
        refreshStorageButton.backgroundColor = UIColor(red: 20.0 / 255.0, green: 78.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
        
        //refreshStorageButton.sizeToFit()
        view.addSubview(refreshStorageButton)
        
        refreshStorageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            refreshStorageButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 340),
            refreshStorageButton.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            refreshStorageButton.widthAnchor.constraint(equalToConstant: 140),
            refreshStorageButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
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
