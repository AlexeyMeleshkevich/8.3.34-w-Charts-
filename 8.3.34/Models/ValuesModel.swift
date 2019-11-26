//
//  taskValuesModel.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 04/11/2019.
//  Copyright © 2019 Alexey Meleshkevich. All rights reserved.
//

import RealmSwift

@objcMembers
class Values: Object {
    
    dynamic var resistance: Double = 0.0
    dynamic var amperage: Double = 0.0
    dynamic var result: Double = 0.0
    
    convenience init(resistance: Double, amperage: Double, result: Double){
        self.init()
        
        self.resistance = resistance
        self.amperage = amperage
        self.result = result
    }
}
