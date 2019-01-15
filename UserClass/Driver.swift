//
//  Driver.swift
//  Parkflow
//
//  Created by Karl Michel Koerich on 2018-04-02.
//  Copyright © 2018 Hamko. All rights reserved.
//

import Foundation

class Driver {
    
    let human: Person
    var cars: [Car] = []
    
    init(human: Person){
        
        self.human = human
    }
    
    func appendCar (car: Car){
        
        self.cars.append(car)
    }
    
    func deleteCar (car: Car){
        
        self.cars.i
        self.cars.remove(at: )
    }
}
