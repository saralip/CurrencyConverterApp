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
    let data = exchangeModel.shared
    //MARK:: Properties
    
<<<<<<< HEAD
    @IBOutlet weak var inputUStextField: UITextField!
    func getRate(_ country1: String)
=======
    //MARK:: Properties
    
    @IBOutlet weak var inputUStextField: UITextField!
    
    //declared semaphore and singleton
    let semaphore = DispatchSemaphore(value: 1)
    let mySingleton = Singleton.sharedInstance
    
    func getRate(_ country1: String) -> Void
>>>>>>> 4391c4f3002ac29ee1aaa2320a20abf0b46564cb
    {
        let myYQL = YQL()
        let country2 = "USD"
        
        let queryString = "select * from yahoo.finance.xchange where pair in (\"" + country1 + country2 + "\")"
<<<<<<< HEAD
        //var rate = "1"
        // Network session is asyncronous so use a closure to act upon data once data is returned
        myYQL.query(queryString)
        {
            
=======

        // Network session is asyncronous so use a closure to act upon data once data is returned
        myYQL.query(queryString)
        {
>>>>>>> 4391c4f3002ac29ee1aaa2320a20abf0b46564cb
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
            print(country1)
<<<<<<< HEAD
            self.data.rate = rateDict["Rate"] as! String
            for i in 0...3{
                self.data.rateArray[i] = rateDict["Rate"] as! String
            }
            print(self.data.rate)

            //exchangeModel.rate
=======
            self.mySingleton.data = rateDict["Rate"] as! String
            print(self.mySingleton.data)
            
            //this releases the semaphore.wait() in the bottom, continueing execution
            self.semaphore.signal()
>>>>>>> 4391c4f3002ac29ee1aaa2320a20abf0b46564cb
            
        }
        
        // Needed to let async operation finish
        // Could handle with semaphores or closures instead...
        //RunLoop.main.run()
<<<<<<< HEAD

        //return self.data.rate
=======
        
    
>>>>>>> 4391c4f3002ac29ee1aaa2320a20abf0b46564cb
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tying curr picker to the view
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let firstCountry = ["USD"  , "EUR", "CAD" , "MXN" ]
    //let secondCountry = "USD"
    let secondCountry = ["USD", "EUR" , "CAD" , "MXN"]
    //var pickerData = ["Dollar", "Euro", "Yen"]
    var i = 0
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (4)  //returns just the number of rows in the list
    }
    
    //create cells BY RECURSION!
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       //let data = exchangeModel.shared

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.countryLabel.text = firstCountry [indexPath.row]
        cell.countryFlag.image = UIImage(named: (firstCountry)[indexPath.row])
<<<<<<< HEAD
       // for i in 0...4
        cell.theRate.text = getRate(firstCountry[indexPath.row])

        return(cell)
    }
}
//   let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
/*
 let countryRate:String = getRate("USD","EUR")
 cell.textLabel?.text = firstCountry[indexPath.row]
 NSLog(countryRate)
 */



//    func getRate(_ country1: String, _ country2: String) -> String{
//        let myYQL = YQL()
//        let country2 = "USD"
//        
//        let queryString = "select * from yahoo.finance.xchange where pair in (\"" + country1 + country2 + "\")"
//        var rate = "1"
//        // Network session is asyncronous so use a closure to act upon data once data is returned
//        myYQL.query(queryString) { jsonDict in
//            // With the resulting jsonDict, pull values outs
//            // jsonDict["query"] results in an Any? object
//            // to extract data, cast to a new dictionary (or other data type)
//            // repeat this process to pull out more specific information
//            let queryDict = jsonDict["query"] as! [String: Any]
//            let resultsDict = queryDict["results"] as! [String: Any]
//            let rateDict = resultsDict["rate"] as! [String: Any]
//            //let quoteDict = queryDict("query") as! [String: Any]
//            
//            //print(queryDict["count"]!)
//            //print(queryDict["results"]!)
//            print(rateDict["Rate"]!)
//            
//            //also try print(rateDict)
//            //also try print(rateDict["id"]!)
//            //print(rateDict["Rate"]!)
//            
//            //RunLoop.main.run()
//            
//            rate = rateDict["Rate"] as! String
//            print(rate)
//            
//        }
//        
//        // Needed to let async operation finish
//        // Could handle with semaphores or closures instead...
//        //RunLoop.main.run()
//        
//        return rate
//    }
// 
//
//  
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        //tying curr picker to the view
//  
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    let firstCountry = ["USD"  , "EUR", "CAD" , "MXN" ]
//    //let secondCountry = "USD"
//    let secondCountry = ["USD", "EUR" , "CAD" , "MXN"]
//    //var pickerData = ["Dollar", "Euro", "Yen"]
//    var i = 0
//    
//  
//
//    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return (4)  //returns just the number of rows in the list
//    }
//    
//    //create cells BY RECURSION!
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
//        
//        cell.countryLabel.text = firstCountry [indexPath.row]
//        cell.countryFlag.image = UIImage(named: (firstCountry)[indexPath.row])
//        //cell.theRate.text = getRate()
//        return(cell)
//    }
//}
//     //   let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
///*
//        let countryRate:String = getRate("USD","EUR")
//        cell.textLabel?.text = firstCountry[indexPath.row]
//        NSLog(countryRate)
//*/
//
//

=======
      
        getRate(firstCountry[indexPath.row])
        //added semaphore.wait() to suspend further execution until it gets semaphore.signal()
        semaphore.wait()
        cell.theRate.text = mySingleton.data
        return(cell)
    }
}
>>>>>>> 4391c4f3002ac29ee1aaa2320a20abf0b46564cb

