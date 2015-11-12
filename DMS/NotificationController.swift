//
//  NotificationController.swift
//  DMS
//
//  Created by Raja Ayyan on 11/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class NotificationController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("notifycell", forIndexPath: indexPath)
        return cell
    }


   
}
