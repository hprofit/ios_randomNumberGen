//
//  ViewController.swift
//  TestApp
//
//  Created by Profit, Holden on 11/7/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController {

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
    
    func generateIntBetweenBounds(lowerBound: Int, upperBound: Int) -> Int {
        let upperBoundBumped: Int = upperBound + 1
        let difference: Int = upperBoundBumped - lowerBound
        return Int(arc4random_uniform(UInt32(upperBoundBumped - difference))) + lowerBound
    }
    
    @IBAction func dismissKeyboard () {
        view.endEditing(true)
    }
    
    @IBAction func generateRandomNumber(){
        dismissKeyboard()
        
        guard let lowerBound = lowerBoundField.text?.integer, let upperBound = upperBoundField.text?.integer else {
            return
        }
        
        displayNumberLabel.text = String(generateIntBetweenBounds(lowerBound: lowerBound, upperBound: upperBound))
    }

}

extension String {
    var integer: Int? {
        return Int(self)
    }
}

