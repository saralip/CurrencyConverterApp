//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sara Lipowsky & Christopher Villanueva on 4/3/17.
//  Copyright © 2017 Sara Lipowsky & Christopher Villanueva. All rights reserved.
//
// ChrisBranch1
// Added semaphore and singleton implementation
// semaphores used to solve async issue with yql
// still need to fix order in the beginning

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:: Properties
    
    @IBOutlet weak var inputUStextField: UITextField!
    
    @IBOutlet weak var theTableView: UITableView!
    
    
    //declared semaphore and singleton
    let semaphore = DispatchSemaphore(value: 1)
    let mySingleton = Singleton.sharedInstance
    let semaphore2 = DispatchSemaphore(value:1)
    //var userInput = 0.00
    
    //var userInput = DiscountCalc.shared

    
    var passedValue: String?
    var passedCountry: Int?
    
    func getRate(_ country: String,_ row:Int) -> Void
    {
        
        let myYQL = YQL()
        //let country2 = "USD"
        
        let queryString = "select * from yahoo.finance.xchange where pair in (\"USD" + country + "\")"

        // Network session is asyncronous so use a closure to act upon data once data is returned
        myYQL.query(queryString)
        {
            //var rate = "1"
            jsonDict in
            // With the resulting jsonDict, pull values outs
            // jsonDict["query"] results in an Any? object
            // to extract data, cast to a new dictionary (or other data type)
            // repeat this process to pull out more specific information
            let queryDict = jsonDict["query"] as! [String: Any]
            let resultsDict = queryDict["results"] as! [String: Any]
            let rateDict = resultsDict["rate"] as! [String: Any]
            //let quoteDict = queryDict("query") as! [String: Any]
            
            //print(queryDict["count"]!)
            //print(queryDict["results"]!)
            //print(rateDict["Rate"]!)
            
            //also try print(rateDict)
            //also try print(rateDict["id"]!)
            //print(rateDict["Rate"]!)
            
            //RunLoop.main.run()
            print(country)
            self.mySingleton.data[row] = rateDict["Rate"] as! String
            print(self.mySingleton.data)
            
            //this releases the semaphore.wait() in the bottom, continueing execution
            self.semaphore.signal()
            self.semaphore2.signal()
        }
        
        // Needed to let async operation finish
        // Could handle with semaphores or closures instead...
        //RunLoop.main.run()
        
        semaphore2.wait()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hide table view
        //theTableView.isHidden = true
        //button pressed?
        
        // Do any additional setup after loading the view, typically from a nib.
        

        //if let myPassedData = passedValue {
            print(passedValue)
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func convertButton(_ sender: Any) {
        theTableView.isHidden = false
        //userInput = Double(inputUStextField.text!)!
        
        //calculate and display
        theTableView.reloadData()
        
        
    }
    
    
    let countryList = ["CAD", "CNY" , "EUR", "GBP", "JPY", "MXN"]

    var i = 0
    
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (countryList.count)  //returns just the number of rows in the list
    }
    
    //create cells BY RECURSION!
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        

        let dollar = Double(passedValue!)
        //let countryIndex = passedCountry
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
      
      
        
        getRate(countryList[indexPath.row], indexPath.row)
        
        //added semaphore.wait() to suspend further execution until it gets semaphore.signal()
        semaphore.wait()
        cell.countryFlag.image = UIImage(named: (countryList)[indexPath.row])
        cell.countryLabel.text = countryList [indexPath.row]
        cell.theRate.text = mySingleton.data[indexPath.row]
        let formatRate = Double(mySingleton.data[indexPath.row])
        cell.finalExchangeValue.text = String(dollar! * formatRate!)
        
        //convert rate from string to float
        //multiply by text field entry
    //    if indexPath.row == 5{
            /*var rateFloat: [Double] = [0, 0, 0, 0, 0, 0]
      
            var finalAmount:Double
            print("FOR LOOP")
            for i in 0...5{
                rateFloat[i] = Double(mySingleton.data[i])!
                
                print(rateFloat[i])
            }
            for i in 0...5{
                finalAmount = rateFloat[i] *
                cell.finalExchangeValue.text = String(finalAmount)
               // return(cell)
            }
            */
    //    }
        return(cell)
    }
    
}
/*
 if indexPath.row == 5{
 var rateFloat: [Double] = [0, 0, 0, 0, 0, 0]
 
 var finalAmount:Double
 print("FOR LOOP")
 for i in 0...5{
 rateFloat[i] = Double(mySingleton.data[i])!
 
 print(rateFloat[i])
 }
 for i in 0...5{
 finalAmount = rateFloat[i] * userInput
 cell.finalExchangeValue.text = String(finalAmount)
 return(cell)
 }
 
 }
 return(cell)*/

