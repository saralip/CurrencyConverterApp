//
//  DATA.swift
//  CurrencyApp_Chris_1
//
//  Created by CampusUser on 5/12/17.
//  Copyright © 2017 Fullerton. All rights reserved.
//
//Got Singleton structure from
//http://stackoverflow.com/questions/37801407/whither-dispatch-once-in-swift-3
//


import Foundation


class Singleton: NSObject {
    var data = String()
    
    static let sharedInstance:Singleton = {
        let instance = Singleton ()
        return instance
    } ()
    

    override init() {
     
        data = "My String"
    }
}
