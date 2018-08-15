//
//  ViewController.swift
//  tvOS-Swift-Weather
//
//  Created by Pooya on 2018-08-09.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentSummary: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url1 = "https://api.forecast.io/forecast/YOURSECRETCODE/37.7833,122.4167"
        
        if let url = NSURL(string: url1) {
            if let data = NSData(contentsOf: url as URL){
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    let newDict : NSDictionary = (parsed as? NSDictionary)!
                    let newDictCurrently : NSDictionary = newDict["currently"]! as! NSDictionary
                    let newDictSummary  : NSString = newDictCurrently[
                        "summary"] as! NSString
                    let newDictTemperature  : NSNumber = newDictCurrently[
                        "temperature"] as! NSNumber
                        print(newDictSummary)
                        print(newDictTemperature)
                    self.currentSummary.text = newDictSummary as String
                    self.currentTemp.text = newDictTemperature.stringValue
                    
                }
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
            }
        }
    }

}

