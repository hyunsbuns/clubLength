//
//  ViewController.swift
//  getLocation
//
//  Created by Steve on 4/22/15.
//  Copyright (c) 2015 Hyunsbuns. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{
    var manager: CLLocationManager!
    var startLoc : CLLocation!
    var stopLoc : CLLocation!
    var isFirstCall = true
    var yards : Double!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBAction func resetButtonPressed(sender: AnyObject)
    {
        isFirstCall  = true
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        
        println(locations)
        var userLocation: CLLocation = locations[0] as! CLLocation
        if(isFirstCall)
        {
            println("Getting Start Location")
            startLoc = userLocation
            isFirstCall = false
            //var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        }
        else
        {
            println("Getting Stop Location")
            stopLoc = userLocation
            yards = startLoc.distanceFromLocation(stopLoc) * 1.09361
            distanceLabel.text = "\(Int(self.yards)) Yards"
        }
        manager.stopUpdatingLocation()
        
    }

    
    @IBAction func firstLocation(sender: AnyObject)
    {
        manager.startUpdatingLocation()
    }
    
    @IBAction func secondLocation(sender: AnyObject)
    {
        manager.startUpdatingLocation()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

