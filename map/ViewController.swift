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

class ViewController: UIViewController, CLLocationManagerDelegate {
    var map=CLLocationManager()
    var locationStatus = "Not started"
    var timer=NSTimer()
    var defaultspan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
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
        map.delegate = self
        map.desiredAccuracy = kCLLocationAccuracyBest
        map.distanceFilter = kCLDistanceFilterNone
        map.startUpdatingLocation()
        
        map.requestAlwaysAuthorization()
       /* timer=NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(timermethod), userInfo: nil, repeats: true)*/
    }

    /*
    func timermethod()
    {
        
    }*/
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager,
                           didUpdateLocations locations: [CLLocation]){
        box.text = String(locations[0].coordinate.latitude)
        
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

}

