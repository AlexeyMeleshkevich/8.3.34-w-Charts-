//
//  MainViewController.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 03/11/2019.
//  Copyright © 2019 Alexey Meleshkevich. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
        let taskButton = UIButton(type: .roundedRect)
        let chartButton = UIButton(type: .roundedRect)
        let optionLabel = UILabel()
        let saveToFileButton = UIButton()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.title = "Task"
            
            createTaskButton()
            createChartButton()
            createOptionLabel()
            createSaveToFileButton()
            
            taskButton.addTarget(self,
                                 action: #selector(taskButtonAction(sender:)),
                                 for: .touchUpInside)
            chartButton.addTarget(self,
                                  action: #selector(chartButtonAction(sender:)),
                                  for: .touchUpInside)
            
            }
    
        // MARK: CREATE UI ELEMENTS
        func createOptionLabel(){
            let frame = CGRect(x: 130, y: 250, width: 150, height: 30)
            optionLabel.frame = frame
            
            optionLabel.text = "Choose your option"
            optionLabel.textAlignment = .center
            optionLabel.adjustsFontSizeToFitWidth = true
            
            view.addSubview(optionLabel)
            
        }
        
        func createTaskButton(){
            
            let frame = CGRect(x: 160, y: 300, width: 80, height: 30)
            taskButton.frame = frame
            
            taskButton.setTitle("Calculate result", for: .normal)
            taskButton.setTitleColor(.blue, for: .normal)
            
            taskButton.sizeToFit()
            view.addSubview(taskButton)
            
        }
        
        func createChartButton(){
            let frame = CGRect(x: 160, y: 350, width: 80, height: 30)
            chartButton.frame = frame
            
            chartButton.setTitle("Create chart", for: .normal)
            chartButton.setTitleColor(.blue, for: .normal)
            
            chartButton.sizeToFit()
            view.addSubview(chartButton)
        }
    
        func createSaveToFileButton(){
            let frame = CGRect(x: 160, y: 400, width: 100, height: 40)
            saveToFileButton.frame = frame
            
            saveToFileButton.setTitle("Save to file", for: .normal)
            saveToFileButton.setTitleColor(.blue, for: .normal)
            
            saveToFileButton.sizeToFit()
            view.addSubview(saveToFileButton)
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
    
        // Mark end

    }
