//
//  NotificationController.swift
//  DMS
//
//  Created by Raja Ayyan on 11/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class NotificationController: UITableViewController {
    
    
    var docList: [ProductionDocuments]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the logged in userid
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userid = userDefaults.objectForKey("loggedinuserid") as? String
        // let username = userDefaults.objectForKey("loggedinusername")
        
        
        
        
        //Go to Stage_AccessGroup table and get the accessgroupsid
        var accessGroupids = [String]()
        let userAccessGroup =  DataPersistence.getDataFromTableWithFilter("Users_AccessGroup", coloumnName: "userid", filterParameters: [userid!]) as? [Users_AccessGroup]
        if userAccessGroup?.count > 0 {
            for eachAccessGroup in userAccessGroup!{
                accessGroupids.append(eachAccessGroup.accessgroupid!)
            }
        }
        
        
        //Based on accessgroud id , get the usernames
        let documentsList =  DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "accessgroupid", filterParameters: accessGroupids) as? [ProductionDocuments]
        self.docList = documentsList
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.docList?.count)!
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("notifycell", forIndexPath: indexPath)
        cell.textLabel?.text = self.docList![indexPath.row].docname;
        return cell
    }
    
    
    
}
