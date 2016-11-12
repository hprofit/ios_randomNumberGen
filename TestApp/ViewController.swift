//
//  ViewController.swift
//  TestApp
//
//  Created by Profit, Holden on 11/7/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    
    @IBOutlet var displayNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //lowerBoundField.text = "Hello"
        //upperBoundField.text = "World!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateUInt32BetweenBounds(lowerBound: UInt32, upperBound: UInt32) -> UInt32 {
        let upperBoundBumped: UInt32 = upperBound + 1
        let difference: UInt32 = upperBoundBumped - lowerBound
        return UInt32(arc4random_uniform(upperBoundBumped - difference)) + lowerBound
    }
    
    
    @IBAction func generateRandomNumber(){
        guard lowerBoundField.text != nil && upperBoundField.text != nil else {
            return
        }
        let lowerBound: UInt32 = UInt32(lowerBoundField.text!)!
        let upperBound: UInt32 = UInt32(upperBoundField.text!)!
        
        displayNumberLabel.text = String(generateUInt32BetweenBounds(lowerBound: lowerBound, upperBound: upperBound))
    }

}

