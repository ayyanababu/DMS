//
//  TableHelperViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 16/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

protocol TableHelperDelegate{
    func doneSelectingACell(selectedValue: String)
}

class TableHelperViewController: UITableViewController {
    
    //MARK: -Variables and Constants
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var navTitle: String?
    var delegate: TableHelperDelegate?
    var tableHelperData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navTitle
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tableHelperData.count > 0{
            return self.tableHelperData.count
        }else{
            return 10
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("helpercell", forIndexPath: indexPath)
        cell.textLabel?.text = tableHelperData[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if self.tableHelperData.count > 0 
        {
            let datafromarray = self.tableHelperData[indexPath.row]
            delegate?.doneSelectingACell(datafromarray)
        }
    }
    

    
    //MARK: -DoneAction
    
    @IBAction func clickedOnDone(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(false, completion: nil)
    }
    
   

}
