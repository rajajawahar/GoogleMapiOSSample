//
//  ViewController.swift
//  GoogleMapiOSSample
//
//  Created by rajamohamed on 11/01/17.
//  Copyright © 2017 sedintechnologies. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
       locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        print("Latitude is \(lat) and Longitude is \(long)")
        let marker = GMSMarker()
        let cameras = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 6.0)
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let myMapView = GMSMapView.map(withFrame: CGRect.zero, camera: cameras)
        myMapView.mapType = kGMSTypeNormal
        myMapView.isMyLocationEnabled = true
        self.view = myMapView
        locationManager.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        let marker = GMSMarker()
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let myMapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = myMapView
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = myMapView
    
    }
    
    
}

