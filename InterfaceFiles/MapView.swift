//
//  MapView.swift
//  Parkflow
//
//  Created by Karl Michel Koerich on 2018-01-10.
//  Copyright © 2018 Hamko. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    //Open and close side Menu
    var isSideMenuHidden = true
    @IBAction func mainMenuButton(_ sender: UIBarButtonItem) {
        
        if isSideMenuHidden {
            sideMenuConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        } else {
            sideMenuConstraint.constant = -200
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        isSideMenuHidden = !isSideMenuHidden
    }
    
    //Main screen
    override func viewDidLoad() {
        super.viewDidLoad()
        //requestLocationAccess()
        
        self.mapView.delegate = self
        //mapView.showsPointsOfInterest = false
        
        //initialize the side Menu hidden
        sideMenuConstraint.constant = -200
        
        // Coordinates from Marianopolis -> 45.480934, -73.610643
        let initialLocation = CLLocation(latitude: 45.480934, longitude: -73.610643 )
        centerMapOnLocation(location: initialLocation)
        
        //Creating driveway objects
        
        /*let jeff = Driveway(owner: "Jeff",
                            coordinates: CLLocationCoordinate2D(latitude: 45.482328, longitude: -73.610384), status: 2)
        
        let sophie = Driveway(owner: "Sophie",
                              coordinates: CLLocationCoordinate2D(latitude: 45.480524, longitude: -73.609898), status: 1)
        
        let mike = Driveway(owner: "Mike",
                            coordinates: CLLocationCoordinate2D(latitude: 45.479347, longitude: -73.612401), status: 1)
        
        let ali = Driveway(owner: "Ali",
                            coordinates: CLLocationCoordinate2D(latitude: 45.480374, longitude: -73.609949), status: 0)
        
        let joana = Driveway(owner: "Joana",
                            coordinates: CLLocationCoordinate2D(latitude: 45.482943, longitude: -73.610024), status: 1)
        
        let bob = Driveway(owner: "Bob",
                            coordinates: CLLocationCoordinate2D(latitude: 45.479995, longitude: -73.614037), status: 1)
        
        let summer = Driveway(owner: "Summer",
                            coordinates: CLLocationCoordinate2D(latitude: 45.479719, longitude: -73.613347), status: 0)
        
        let julie = Driveway(owner: "Julie",
                            coordinates: CLLocationCoordinate2D(latitude: 45.482651, longitude: -73.611493), status: 1)
        
        let will = Driveway(owner: "Will",
                            coordinates: CLLocationCoordinate2D(latitude: 45.482396, longitude: -73.609455), status: 1)
        
        let dwayne = Driveway(owner: "Dwayne",
                            coordinates: CLLocationCoordinate2D(latitude: 45.479165, longitude: -73.612227), status: 0)
        
        let anthony = Driveway(owner: "Anthony",
                            coordinates: CLLocationCoordinate2D(latitude: 45.480303, longitude: -73.611162), status: 1)
        
        mapView.addAnnotations([jeff.mapPin, sophie.mapPin, mike.mapPin, ali.mapPin, joana.mapPin, bob.mapPin, summer.mapPin, julie.mapPin, will.mapPin,
                                dwayne.mapPin, anthony.mapPin])*/
        
    }
    
    //Prints pin into the map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "statusPinIdentifier")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "statusPinIdentifier")
            annotationView!.canShowCallout = true
            
        } else {
         
            annotationView!.annotation = annotation
        }
        
        let cpa = annotation as! CustomPointAnnotation
        annotationView!.image = UIImage(named: cpa.statusPinImageName)
        
        var messageImage = "timeleft.png"
        
        if cpa.statusPinImageName == "redPin.png"
        {
            messageImage = "ops.png"
        }
        if cpa.statusPinImageName == "bluePin.png"
        {
            messageImage = "other.png"
        }
        
        annotationView?.detailCalloutAccessoryView = UIImageView(image: UIImage(named: messageImage))
        return annotationView
        
    }
    
    //Identifies if pin has been tapped
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
            
            if sideMenuConstraint.constant == 0
            {
                sideMenuConstraint.constant = -200
                UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
                isSideMenuHidden = !isSideMenuHidden
            }
        }
    }
    
    //Default Area where the Map starts
    let regionRadius: CLLocationDistance = 500 //Meters away from point
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
