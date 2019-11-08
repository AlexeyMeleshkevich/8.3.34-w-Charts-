//
//  taskModel.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 04/11/2019.
//  Copyright © 2019 Alexey Meleshkevich. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveData(values: Values){
        try! realm.write{
            realm.add(values)
        }
        
    }
}
