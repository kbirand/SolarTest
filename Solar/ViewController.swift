//
//  ViewController.swift
//  Solar
//
//  Created by Koray Birand on 10/8/18.
//  Copyright © 2018 Koray Birand. All rights reserved.
//

import Cocoa
import CoreLocation

class ViewController: NSViewController {
    let geocoder = CLGeocoder()
    @IBOutlet weak var myDate: NSDatePicker!
    @IBAction func datepicker(_ sender: NSDatePicker) {
        print(sender.dateValue)
        
        
        let geocoderIst = CLGeocoder()
        let cordIst : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 41.032406, longitude: 28.971481)
        let cllIst : CLLocation = CLLocation(latitude: cordIst.latitude, longitude: cordIst.longitude)
        geocoderIst.reverseGeocodeLocation(cllIst) { (placemarks, error) in
            print("Istanbul - Turkey")
            print("dls for istanbul = \(String(describing: placemarks![0].timeZone?.isDaylightSavingTime(for: self.myDate.dateValue)))")
            let solarIstanbul = Solar.init(for: sender.dateValue, coordinate: cordIst)
            let ssIstanbul = solarIstanbul?.sunset
            let srIstanbul = solarIstanbul?.sunrise
            
            print("sunrise of Istanbul : \(self.timeFormater(date: srIstanbul!, timeZone: 3))")
            print("sunset of Istanbul : \(self.timeFormater(date: ssIstanbul!, timeZone: 3))")
 
        }
       
        let geocoderSantaMonica = CLGeocoder()
        let cordSantaMonica : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 34.016453, longitude: -118.494575)
        let cllSantaMonica : CLLocation = CLLocation(latitude: cordSantaMonica.latitude, longitude: cordSantaMonica.longitude)
        geocoderSantaMonica.reverseGeocodeLocation(cllSantaMonica) { (placemarks, error) in
             print("Santa Monica - California")
            print("dls for santa monica = \(String(describing: placemarks![0].timeZone?.isDaylightSavingTime(for: self.myDate.dateValue)))")
            let solarSantaMonica = Solar.init(for: sender.dateValue, coordinate: cordSantaMonica)
            let ssSantaMonica = solarSantaMonica?.sunset
            let srSantaMonica = solarSantaMonica?.sunrise
            
            print("sunrise of Santa Monica : \(self.timeFormater(date: srSantaMonica!, timeZone: -7))")
            print("sunset of Santa Monica : \(self.timeFormater(date: ssSantaMonica!, timeZone: -7))")
        }
        

        
        
    }
    
    func timeFormater(date: Date, timeZone : Int) -> String {
        
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 3600 * timeZone) as TimeZone
        timeFormatter.dateFormat = "HH:mm:ss"
        return timeFormatter.string(from: date)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDate.dateValue = Date()
        // Do any additional setup after loading the view.
    }

}

