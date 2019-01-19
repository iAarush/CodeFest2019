//
//  ViewController.swift
//  Semi-Automated Platooning for Efficient Transportation
//
//  Created by Aarush Mehrotra on 1/19/19.
//  Copyright © 2019 Aarush Mehrotra. All rights reserved.
//

import UIKit
import CoreLocation //From Apple
import Firebase //From Google
import FirebaseAuth

//class MainVC: UIViewController, CLLocationManagerDelegate {
//
//    var pause = false
//    var locationManager: CLLocationManager = CLLocationManager()
//    var startLocation: CLLocation!
//    var speed: CLLocationSpeed = CLLocationSpeed()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        locationManager.startUpdatingHeading()
//        startLocation = nil
//
//        // Ask for Authorisation from the User.
//        self.locationManager.requestAlwaysAuthorization()
//
//        // For use in foreground
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    }

class ViewController: UIViewController {
    
    var ref: DatabaseReference! = Database.database().reference()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speedLabel.text = "0"
        
    }
    
    var speed = String(format: "%f", CLLocationSpeed() as CVarArg)
    
    @IBAction func addProfile(_ sender: Any) {
        Auth.auth().createUser(withEmail: (txtEmail.text ?? ""), password: (txtPass.text ?? "")) { (result, error) in
            if let _eror = error {
                //something bad happning
                print(_eror.localizedDescription )
            }else{
                //user registered successfully
                print(result)
            }
        }
    }
    
    
    @IBAction func journeyStart(_ sender: Any) {
            updateName()

    }
    
    @IBOutlet weak var speedLabel: UILabel!
    func updateName() {
        func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
            let lastLocation = locations.last!
            
            // Do something with the location.
        }
        
        //        speed = String(format: "%f", CLLocationSpeed() as CVarArg)
        //        speedLabel.text = speed
    }
    
    let locationManager = CLLocationManager()
    func startReceivingLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            return
        }
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            // Location services is not available.
            return
        }
        // Configure and start the service.
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0  // In meters.
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.startUpdatingLocation()
    }
}


