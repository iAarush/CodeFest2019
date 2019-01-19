//
//  ViewController.swift
//  Semi-Automated Platooning for Efficient Transportation
//
//  Created by Aarush Mehrotra on 1/19/19.
//  Copyright © 2019 Aarush Mehrotra. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController, CLLocationManagerDelegate {
    
    var pause = false
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    var speed: CLLocationSpeed = CLLocationSpeed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        startLocation = nil
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading)
    {
        //   capLabel.text = String(format: "%.4f",newHeading.magneticHeading)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func journeyStart(_ sender: Any) {
        print(speedLabel)
        updateName()
    }
    
    @IBOutlet weak var speedLabel: UILabel!
    func updateName() {
        speedLabel.text = "100"
    }
    
}


