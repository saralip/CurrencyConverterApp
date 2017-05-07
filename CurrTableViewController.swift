//
//  CurrTableViewController.swift
//  CurrencyConverter
//
//  Created by Sara Lipowsky on 5/6/17.
//  Copyright © 2017 Sara Lipowsky. All rights reserved.
//

import UIKit

class CurrTableViewController: UITableViewController {

    //MARK: Properties
    
    // demoCharacters as a var is mutable
    // we can add more characters after initialization
    var demoItems = [SampleItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This should match our cell's identifier in our Main.storyboard
        let cellIdentifier = "CurrTableViewCell"
        
        // Because we're using a custom cell class, we need to downcast the cell to our custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CurrTableViewCell else {
            fatalError("Dequeued cell is not our custom CurrTableViewCell")
        }
        
        // Matches the correct data to the correct table cell
        let demoItem = demoItems[indexPath.row]
        
//        cell.rateDisplayLabel.text = demoItem.rateDisplay
//        cell.rateLabel.text = demoItem.rate
//        cell.photoImageView.image = demoItem.img
        cell.nameLabel.text = demoItem.name
        cell.descLabel.text = demoItem.desc
        cell.photoImageView.image = demoItem.img
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    private func loadSampleData() {
        let city_image = UIImage(named: "City")
        let leaf_image = UIImage(named: "Leaf")
        let lion_image = UIImage(named: "Lion")
        
        let city_desc = "A picture of a city from the street. Photo Credit: Alex Wolfe. Provided by Unsplash.com"
        let leaf_desc = "A picture of a leaf. Photo Credit: Aaron Burden. Provided by Unsplash.com"
        let lion_desc = "A picture of a lion. Photo Credit: Lemuel Butler. Provided by Unsplash.com"
        
        guard let sample1 = SampleItem("City", city_desc, city_image) else {
            fatalError("Unable to initialize Sample 1: City")
        }
        
        guard let sample2 = SampleItem("Leaf", leaf_desc, leaf_image) else {
            fatalError("Unable to initialize Sample 2: Leaf")
        }
        
        guard let sample3 = SampleItem("Lion", lion_desc, lion_image) else {
            fatalError("Unable to initialize Sample 3: Lion")
        }
        
        demoItems += [sample1, sample2, sample3]
    }
}
