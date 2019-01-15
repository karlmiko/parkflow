//
//  Owner.swift
//  Parkflow
//
//  Created by Karl Michel Koerich on 2018-04-02.
//  Copyright © 2018 Hamko. All rights reserved.
//

import Foundation

class Owner {
    
    let human: Person
    var spots: [Driveway] = []
    
    init(human: Person){
    
        self.human = human
    }
}
