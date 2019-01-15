//
//  Car.swift
//  Parkflow
//
//  Created by Karl Michel Koerich on 2018-04-02.
//  Copyright © 2018 Hamko. All rights reserved.
//

import Foundation

class Car {
    
    let driver: Driver
    let model: String
    let plate: String
    let document: String
    
    init(driver: Driver, model: String, plate: String, document: String){
        
        self.driver = driver
        self.model = model
        self.plate = plate
        self.document = document
    }
}
