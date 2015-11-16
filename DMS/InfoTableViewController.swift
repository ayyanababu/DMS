//
//  InfoTableViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var upversion: UIButton!
    @IBOutlet weak var obseleteButton: UIButton!
    @IBOutlet weak var deletebutton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    //MARK: DoneButton
    
    @IBAction func doneButton(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    
    
    @IBAction func upVersionForm(sender: UIButton) {
        performSegueWithIdentifier("upversionform", sender: sender)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "upversionform"{
            let navcontroller = segue.destinationViewController as? UINavigationController
            if let controller = navcontroller?.topViewController as? FormViewController
            {
                controller.docTitle = "Up Version"
            }
        }
    }
    

   
}
