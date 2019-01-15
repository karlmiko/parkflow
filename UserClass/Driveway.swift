//
//  Driveway.swift
//  Parkflow
//
//  Created by Karl Michel Koerich on 2018-02-03.
//  Copyright © 2018 Hamko. All rights reserved.
//

import Foundation
import MapKit

//Annotation Class
class CustomPointAnnotation: MKPointAnnotation {
    var statusPinImageName: String!
}

class Driveway {
    
    var owner: Owner
    let coordinates: CLLocationCoordinate2D
    var status: Int
    var mapPin: CustomPointAnnotation!
    
    init(owner: Owner, coordinates: CLLocationCoordinate2D, status: Int)
    {
        
        self.owner = owner
        self.coordinates = coordinates
        
        let mapPin = CustomPointAnnotation()
        mapPin.coordinate = coordinates
        mapPin.title = owner.human.first_name + "'s driveway"

        self.mapPin = mapPin
        self.status = 0 //0 UNAVAILABLE
                        //1 AVAILABLE
                        //2 YOUR CAR IS ON IT
        
        mapPin.statusPinImageName = "redPin.png"
    }
    
    func modifyPinStatus (newStatus: Int){
        self.status = newStatus
        let listPNGs = ["redPin.png", "greenPin.png", "bluePin.png"]
        self.mapPin.statusPinImageName = listPNGs[newStatus]
    }
}
