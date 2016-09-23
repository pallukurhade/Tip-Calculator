//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by KARAN METHE on 9/15/16.
//  Copyright © 2016 Pallavi Kurhade. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
 
    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
   
    @IBOutlet weak var changeThemeLabel: UILabel!
   
    @IBOutlet weak var barLine: UIView!
    @IBOutlet weak var colorChange: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.resetButton.layer.cornerRadius = 10
        self.saveButton.layer.cornerRadius = 10
         self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   @IBAction func saveTip(sender: AnyObject) {
        
    let defaults = NSUserDefaults.standardUserDefaults()
    if firstTipField.text != "" {
        // textfield 1 is not empty then do this task
        defaults.setObject(self.firstTipField.text, forKey: "firstTip")
    }
    if secondTipField.text != "" {
        // textfield 2 is not empty then do this task
        defaults.setObject(self.secondTipField.text, forKey: "secondTip")
    }
    if thirdTipField.text != "" {
        // textfield 3 is not empty then do this task
        defaults.setObject(self.thirdTipField.text, forKey: "thirdTip")
        
    }
   
      defaults.synchronize()
    
    }
    
    @IBAction func resetTip(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("18", forKey: "firstTip")
        defaults.setObject("20", forKey: "secondTip")
        defaults.setObject("25", forKey: "thirdTip")
        defaults.synchronize()

    }
   
    @IBAction func changeTheme(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
       
        switch(colorChange.selectedSegmentIndex
        ){
    
        case 1 :
              redTheme()
              defaults.setObject("red", forKey: "backColor")
              defaults.synchronize()
              break;
         
        case 2:
            blueTheme()
            defaults.setObject("blue", forKey: "backColor")
           
            defaults.synchronize()
            break;
        
        default :
               defaultTheme()
           defaults.setObject("defaultColor", forKey: "backColor")
            defaults.synchronize()
                      
            break;
        
        
        }
        
    }
    func redTheme(){
    
        view.backgroundColor = UIColor(red:0.89, green:0.08, blue:0.08, alpha:1.0)
        view.tintColor = (UIColor.blackColor())
        
        resetButton.backgroundColor = (UIColor.blackColor())
        saveButton.backgroundColor = (UIColor.blackColor())
        barLine.backgroundColor = (UIColor.blackColor())
        changeThemeLabel.textColor = (UIColor.blackColor())
        firstTipField.backgroundColor = (UIColor.blackColor())
        secondTipField.backgroundColor = (UIColor.blackColor())
        thirdTipField.backgroundColor = (UIColor.blackColor())
        
    
    }
    func blueTheme(){
    
        view.backgroundColor = UIColor(red:0.16, green:0.67, blue:0.89, alpha:1.0)
        view.tintColor = UIColor.whiteColor()
        saveButton.backgroundColor = UIColor(red:0.00, green:0.45, blue:0.74, alpha:1.0)
        barLine.backgroundColor =
        (UIColor.whiteColor())
        resetButton.backgroundColor = UIColor(red:0.00, green:0.45, blue:0.74, alpha:1.0)
        changeThemeLabel.textColor = UIColor.whiteColor()
        firstTipField.backgroundColor = UIColor.whiteColor()
        secondTipField.backgroundColor = UIColor.whiteColor()
        thirdTipField.backgroundColor = UIColor.whiteColor()
        saveButton.tintColor = UIColor.blackColor()
       
    
    }
    func defaultTheme(){
    
        view.backgroundColor = UIColor(red:0.22, green:0.94, blue:0.89, alpha:1.0)
     
        view.tintColor = (UIColor.whiteColor())
        saveButton.backgroundColor = UIColor(red:0.18, green:0.78, blue:0.75, alpha:1.0)
        barLine.backgroundColor =
            UIColor(red:0.18, green:0.78, blue:0.75, alpha:1.0)
        resetButton.backgroundColor = UIColor(red:0.18, green:0.78, blue:0.75, alpha:1.0)
        changeThemeLabel.textColor = (UIColor.whiteColor())
        
        firstTipField.backgroundColor = UIColor(red:0.22, green:0.94, blue:0.89, alpha:1.0)

        secondTipField.backgroundColor = UIColor(red:0.22, green:0.94, blue:0.89, alpha:1.0)

        thirdTipField.backgroundColor = UIColor(red:0.22, green:0.94, blue:0.89, alpha:1.0)

    
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
    */

}
