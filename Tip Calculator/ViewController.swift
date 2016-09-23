//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Pallavi Kurhade on 9/15/16.
//  Copyright © 2016 Pallavi Kurhade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabelNew: UILabel!
   
    @IBOutlet weak var resetButton: UIButton!
    
     @IBOutlet weak var saveButton: UIButton!
   
    @IBOutlet weak var noPeopleSlider: UISlider!
    @IBOutlet weak var barLine: UIView!
    @IBOutlet weak var barLine1: UIView!
    var newFirstTipValue = 0.0
    var newSecondTipValue = 0.0
    var newThirdTipValue = 0.0
    var wholeTotal = 0.0
    
    @IBOutlet weak var noOfPeople: UILabel!
    @IBOutlet weak var perPersonPays: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tipLabel.text = getCurrency() + "0.00"
        totalLabel.text =  getCurrency() + "0.00"
        
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        billField.becomeFirstResponder()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //To exit the keyboard whe user clicks
    @IBAction func onTab(sender: AnyObject) {
        view.endEditing(true)
    }
    //Keep bill for 10min
    func keepBillValue() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billField.text, forKey: "defaultsBillValue")
        defaults.setObject(NSDate(), forKey: "defaultsBillDate")
        defaults.synchronize()
    }
    
    
    //To calculate the tip
    @IBAction func calculateTip(sender: AnyObject) {
        
        keepBillValue()
        let tipPercentages = [newFirstTipValue,newSecondTipValue,newThirdTipValue]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: getCurrency() + "%.2f", tip)
        totalLabel.text = String(format: getCurrency() + "%.2f", total)
        perPersonPays.text = totalLabel.text
        wholeTotal = total
        
    }
    @IBAction func sliderValueChange(sender: AnyObject) {
        let noPeople = Int(noPeopleSlider.value)
        
        noOfPeople.text = "\(noPeople)"
        let currentTotal = wholeTotal
        let no = Double(noPeople)
        let perPerson = currentTotal/no
        perPersonPays.text = String(format: getCurrency() + "%.2f", perPerson)
    }
    
    //To get current currency from settings->country settings
    func getCurrency() -> String {
        let locale = NSLocale.currentLocale()
        return locale.objectForKey(NSLocaleCurrencySymbol) as! String
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let refDate = defaults.objectForKey("defaultsBillDate") as? NSDate
        if (refDate != nil && integer_t(NSDate().timeIntervalSinceDate(refDate!)) < 600) {
            billField.text = defaults.objectForKey("defaultsBillValue") as? String
        }
        
        if (defaults.objectForKey("firstTip") as? String) != nil {
            var newfirstTip = (defaults.objectForKey("firstTip") as? String)!
            newFirstTipValue = Double(newfirstTip)!
            newFirstTipValue = (newFirstTipValue/100)
            newfirstTip += "%"
            self.tipControl.setTitle(newfirstTip, forSegmentAtIndex: 0)
            
        }
        if (defaults.objectForKey("secondTip") as? String) != nil {
            var newsecondTip = (defaults.objectForKey("secondTip") as? String)!
            newSecondTipValue = Double(newsecondTip)!
            newSecondTipValue = (newSecondTipValue/100)
            newsecondTip += "%"
            self.tipControl.setTitle(newsecondTip, forSegmentAtIndex: 1)
            
        }
        if (defaults.objectForKey("thirdTip") as? String) != nil {
            var newthirdTip = (defaults.objectForKey("thirdTip") as? String)!
            newThirdTipValue = Double(newthirdTip)!
            newThirdTipValue = (newThirdTipValue/100)
            newthirdTip += "%"
            self.tipControl.setTitle(newthirdTip, forSegmentAtIndex: 2)
            
        }
        let bgcolor = defaults.objectForKey("backColor") as? String
        if(bgcolor=="red"){
            redTheme()
        }
        else if(bgcolor=="blue"){
             blueTheme()
        }else{
            defaultTheme()
        }

        
    
    }
    
    func redTheme(){
        
        view.backgroundColor = UIColor(red:0.89, green:0.08, blue:0.08, alpha:1.0)
        view.tintColor = (UIColor.blackColor())
        barLine.backgroundColor = (UIColor.blackColor())
          barLine1.backgroundColor = (UIColor.blackColor())
        
    }
    func blueTheme(){
        
        view.backgroundColor = UIColor(red:0.16, green:0.67, blue:0.89, alpha:1.0)
        view.tintColor = UIColor.whiteColor()
        barLine.backgroundColor = UIColor.whiteColor()
       barLine1.backgroundColor = UIColor.whiteColor()
        billField.backgroundColor = UIColor.whiteColor()
        
    }
    func defaultTheme(){
        
        view.backgroundColor = UIColor(red:0.22, green:0.94, blue:0.89, alpha:1.0)
        
        view.tintColor = (UIColor.whiteColor())
    
        barLine.backgroundColor =
            UIColor(red:0.18, green:0.78, blue:0.75, alpha:1.0)
        barLine1.backgroundColor =
            UIColor(red:0.18, green:0.78, blue:0.75, alpha:1.0)
        billField.backgroundColor = UIColor(red:0.22, green:0.94, blue:0.89, alpha:1.0)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }

}

