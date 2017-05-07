//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sara Lipowsky & Christopher Villanueva on 4/3/17.
//  Copyright © 2017 Sara Lipowsky & Christopher Villanueva. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var currencyPickerView: UIPickerView!
    var pickerData = ["US Dollar (USD)", "Euro (EUR)", "Canadian Dollar (CAD)", "British Pound (GBP)", "Australian Dollar (AUS)", "Japanese Yen (JPY)"]
    func yqlMain(){
        // Example usage
        let myYQL = YQL()
        
        //let queryString = "select * from yahoo.finance.quote where symbol in (\"YHOO\",\"AAPL\",\"GOOG\",\"MSFT\")"
        let queryString = "select * from yahoo.finance.xchange where pair in (\"ALLDZD\")"
        
        //select * from yahoo.finance.xchange where pair in ("ALL  DZD","GBP   USD")
        
        // Network session is asyncronous so use a closure to act upon data once data is returned
        myYQL.query(queryString) { jsonDict in
            // With the resulting jsonDict, pull values out
            // jsonDict["query"] results in an Any? object
            // to extract data, cast to a new dictionary (or other data type)
            // repeat this process to pull out more specific information
            //let queryDict = queryDict["quote"] as! [String: Any]
            
            let queryDict = jsonDict["query"] as! [String: Any]
            let resultDict = queryDict["results"] as! [String: Any]
            let rateDict = resultDict["rate"] as! [String: Any]
            
            //print(queryDict["count"]!)
            //print(queryDict["results"]!)
            print(rateDict["Rate"]!)
            
        }
        //to check asyncronism
        print("Hello")
        // Needed to let async operation finish
        // Could handle with semaphores or closures instead...
        RunLoop.main.run()

    }
//    var pickerData = ["US Dollar (USD)", "Euro (EUR)", "Canadian Dollar (CAD)", "British Pound (GBP)", "Australian Dollar (AUS)", "Japanese Yen (JPY)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        yqlMain()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tying curr picker to the view
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

