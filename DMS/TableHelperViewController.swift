//
//  TableHelperViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 16/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class TableHelperViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("helpercell", forIndexPath: indexPath)
        return cell
    }
    

   

}
