//
//  SampleItem.swift
//  CurrencyConverter
//
//  Created by Sara Lipowsky on 5/6/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

class SampleItem {
//    var rateDisplay:String = ""
//    var rate:String = ""
//    var img:UIImage?
//    init?(_ rateDisplay:String, _ rate:String, _ img:UIImage?) {
//        if rateDisplay.isEmpty || rate.isEmpty {
//            return nil
//        }
//        
//        self.rateDisplay = rateDisplay
//        self.rate = rate
//        self.img = img
//    }
//}
//
    var name:String = ""
    var desc:String = ""
    var img:UIImage?

    init?(_ name:String, _ desc:String, _ img:UIImage?) {
        if name.isEmpty || desc.isEmpty {
            return nil
        }
        
        self.name = name
        self.desc = desc
        self.img = img
    }
}
