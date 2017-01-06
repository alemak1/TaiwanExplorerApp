//
//  CurrencyConversionController.swift
//  CurrencyConverter
//
//  Created by Aleksander Makedonski on 1/6/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit


class CurrencyConversionController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var taiwaneseDollarsTextField: UITextField!
    
    @IBOutlet var usDollarsLabel: UILabel!
    
    let numberFormatter: NumberFormatter = {
        let nf: NumberFormatter = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        let alphaNumericChars = NSCharacterSet.alphanumerics
        let rangeVal = string.rangeOfCharacter(from: alphaNumericChars)
        
        if rangeVal != nil && existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
            return false
        }else{
            return true
        }
      
    }
    
    @IBAction func ntdFieldEditingChanged(textfield: UITextField){
        if let text = textfield.text, let value = Double(text){
            ntdValue = value
        }else{
            ntdValue = nil
        }
    }
    
    
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        taiwaneseDollarsTextField.resignFirstResponder()
    }
    
    var ntdValue: Double?{
        didSet{
            updateUSDLabel()
        }
    }
    
    var usdValue: Double?{
        if let value = ntdValue{
            return value/32.00
        }else{
            return nil
        }
    }
    
    func updateUSDLabel(){
        if let currentUSDValue = usdValue{
            let currentAmountInDollars = NSNumber(value: currentUSDValue)
            usDollarsLabel.text = numberFormatter.string(from: currentAmountInDollars)

        }else{
            usDollarsLabel.text = "????"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded the CurrencyViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("About to load the CurrencyViewController")
        let date = NSDate()
        let calendar = NSCalendar.current
        var hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date)
        
        if(hour > 18 || hour < 6){
            view.backgroundColor = UIColor.blue
        }else{
            view.backgroundColor = UIColor.yellow
        }
        print("Current hour is: \(hour)")
        print("Current minute is: \(minutes)")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
