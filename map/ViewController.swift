//
//  ViewController.swift
//  map
//
//  Created by Jason Lum on 7/18/16.
//  Copyright © 2016 Jason Lum. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var map=CLLocationManager()
    var locationStatus = "Not started"
    var timer=NSTimer()
    
    var defaultspan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    var locationregion:MKCoordinateRegion?=nil
    
    @IBOutlet weak var box: UITextView!
    @IBOutlet weak var mapkit: MKMapView!
    
    @IBAction func resetlocation(sender: AnyObject) {
        if locationregion != nil{
           mapkit.region=locationregion!
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapkit.delegate=self
        map.delegate = self
        map.desiredAccuracy = kCLLocationAccuracyBest
        map.distanceFilter = kCLDistanceFilterNone
        map.startUpdatingLocation()
        
        map.requestAlwaysAuthorization()
      
        let tokyo = CLLocationCoordinate2D(latitude: 35.698, longitude: 139.75)
        
        let annotation=mkannotations(title: "Lapras", coordinate: tokyo, image: UIImage(named:"Lapras"))
        mapkit.addAnnotation(annotation)
 
       
     
    }

    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager,
                           didUpdateLocations locations: [CLLocation]){
        box.text=String(locations[0].coordinate.latitude)
        locationregion = MKCoordinateRegion(center: locations[0].coordinate, span: defaultspan)
        
        
        
    }
    func locationManager(manager: CLLocationManager,
                                  didChangeAuthorizationStatus status: CLAuthorizationStatus){
        
        
        switch status {
        case CLAuthorizationStatus.Restricted:
            locationStatus = "Restricted Access to location"
        case CLAuthorizationStatus.Denied:
            locationStatus = "User denied access to location"
        case CLAuthorizationStatus.NotDetermined:
            locationStatus = "Status not determined"
        default:
            locationStatus = "Allowed to location Access"
            print ("success")
            
        }
        
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "pokemon"
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.image=UIImage(named: "Lapras")
        
            return view
            }
}



