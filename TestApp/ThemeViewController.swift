//
//  ViewController.swift
//  TestApp
//
//  Created by Profit, Holden on 11/7/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {
    @IBOutlet var stepperLabel: UILabel?
    @IBOutlet var themeLabel: UILabel?
    @IBOutlet var alertButton: UIButton?
    @IBOutlet var actionSheetButton: UIButton?
    @IBOutlet var modalButton: UIButton?
    @IBOutlet var stepperButton: UIStepper?
    
    var lightTheme: Bool = true

    // MARK: - Colors
    let gray:       UIColor = UIColor.init(red: 0.5374, green: 0.5374, blue: 0.5374, alpha: 1.0)
    let darkGray:   UIColor = UIColor.init(red: 0.1804, green: 0.1804, blue: 0.1804, alpha: 1.0)
    let blue:       UIColor = UIColor.init(red: 0.0392, green: 0.3765, blue: 0.9961, alpha: 1.0)
    
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
    
    
    @IBAction func alertUser () {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func openActionSheet () {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        // 2
        let clickAction = UIAlertAction(title: "Click Me", style: .default, handler: nil)
        
        // 4
        optionMenu.addAction(clickAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        stepperLabel?.text = "Step: " + Int(sender.value).description
    }
    
    func changeToLightTheme () {
        self.view.backgroundColor = UIColor.white
        
        stepperLabel?.backgroundColor = gray
        stepperLabel?.textColor = darkGray
        
        themeLabel?.backgroundColor = gray
        themeLabel?.textColor = darkGray
        
        alertButton?.tintColor = blue
        
        actionSheetButton?.tintColor = blue
        
        modalButton?.tintColor = blue
        
        stepperButton?.tintColor = blue
    }
    
    func changeToDarkTheme () {
        self.view.backgroundColor = gray
        
        stepperLabel?.backgroundColor = darkGray
        stepperLabel?.textColor = UIColor.white
        
        themeLabel?.backgroundColor = darkGray
        themeLabel?.textColor = UIColor.white
        
        alertButton?.tintColor = UIColor.white
        
        actionSheetButton?.tintColor = UIColor.white
        
        modalButton?.tintColor = UIColor.white
        
        stepperButton?.tintColor = UIColor.white
    }
    
    @IBAction func changeTheme () {
        lightTheme = !lightTheme
        
        
        if lightTheme == true {
            changeToLightTheme()
        }
        else {
            changeToDarkTheme()
        }
    }
}
