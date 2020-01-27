//
//  ResultViewController.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 13.01.2020.
//  Copyright © 2020 Alexey Meleshkevich. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    var values: Results<Values>!
    
    var tableView = UITableView()
    
    lazy var refresher: UIRefreshControl = {
        let refresherControl = UIRefreshControl()
        refresherControl.tintColor = UIColor.white
        refresherControl.addTarget(self,
                                   action: #selector(requestData),
                                   for: .valueChanged)
        
        return refresherControl
    }()
    
    let cellID = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Results list"
        //
        //        let nib = UINib.init(nibName: cellID, bundle: nil)
        //        self.tableView.register(nib, forCellReuseIdentifier: cellID)
        
        
        
        self.values = realm.objects(Values.self)
        
        setupTableView()
    }
    
    @objc func requestData() {
        
        let taskTime = DispatchTime.now() + .milliseconds(700)
        
        DispatchQueue.main.asyncAfter(deadline: taskTime) {
            self.refresher.endRefreshing()
            self.tableView.reloadData()
        }
        
    }
    
    func setupTableView() {
        self.tableView = UITableView(frame: view.bounds, style: .grouped)
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        self.tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        if #available(iOS 10.0, *) {
        self.tableView.refreshControl = refresher
        } else {
            tableView.addSubview(refresher)
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(tableView)
    }
    
    
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if values.isEmpty == false {
//            return values.count
//        } else {
//            return 0
//        }
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomTableViewCell
        
        let value = self.values[indexPath.row]
        
        cell.amperageLabel.text = String(value.amperage)
        cell.resistanceLabel.text = String(value.resistance)
        cell.resultLabel.text = String(value.result) 
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension ResultViewController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath)
        -> [UITableViewRowAction]? {
            let value = values[indexPath.row]
            let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
                StorageManager.deleteObject(value)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            return [deleteAction]
    }
}
