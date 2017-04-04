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
    
    var pickerData = ["Dollar", "Euro", "Yen"]

    override func viewDidLoad() {
        super.viewDidLoad()
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

