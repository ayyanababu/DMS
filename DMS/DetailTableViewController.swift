//
//  DetailTableViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 10/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController, UIActionSheetDelegate {
    
    
    //MARK: Variables and Constants
    
    @IBOutlet weak var createFromButton: UIBarButtonItem!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    @IBOutlet weak var infoPencilButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailcell", forIndexPath: indexPath) as? DetailTableViewCell

        if indexPath.row % 2 == 0{
            cell?.detailCellImageView.image = UIImage(named: "pdf1.png")
        }else{
            cell?.detailCellImageView.image = UIImage(named: "wordicon.png")
        }
        cell?.configureVeiw()
        return cell!
    }
    



    //MARK: CreateNewFormAction
    
    @IBAction func createNewForm(sender: UIBarButtonItem) {
        
        print("clicked on new Form Creation Action")
        performSegueWithIdentifier("newform", sender: sender)
        
    }
    
    
    
    
    //MARK: NotificationAction
    
    @IBAction func notificationAction(sender: UIBarButtonItem) {
        
        print("clicked on notification action")
        performSegueWithIdentifier("shownotification", sender: sender)
        
    }
    
    
    //MARK: CellActionButton
    
    @IBAction func showActionSheet(sender: UIButton) {
        
        print("clicked on each cell action button")

        if let superviewcell = sender.superview!.superview! as? DetailTableViewCell
        {
            let indexpath = self.tableView.indexPathForCell(superviewcell)
            print(indexpath?.row)
            
            let actionsheet = UIAlertController(title: "Doc Actions", message: "Select One Option", preferredStyle: .ActionSheet)
            
            let revisionUpAction = UIAlertAction(title: "UpRevision", style: .Default){
                (alert) -> () in
                
                 //perform some action
                 print("clicked on revision up action")
            }
            
            let obselete = UIAlertAction(title: "Obselete", style: .Default){
                (alert) -> () in
                
                //perform some action
                print("clicked on obselete up action")
            }
            
            actionsheet.addAction(revisionUpAction)
            actionsheet.addAction(obselete)
            
            
            let actionPopOverController = actionsheet.popoverPresentationController
            actionPopOverController?.sourceRect = sender.frame
            print(superviewcell.frame)
            actionPopOverController?.sourceView = superviewcell
            self.presentViewController(actionsheet, animated: true, completion: nil)
            
            

        }
        
    }
    
    
    @IBAction func infoAndActionsClick(sender: UIButton) {
        
        print("clicked on each cell")
        
        
    }
    
    
    
    
    //MARK: SegueActions
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shownotification"{
            
        }
        
        else if segue.identifier == "newform"{
            
        }else if segue.identifier == "docviewer"
        {
            if let superviewcell = sender as? DetailTableViewCell
            {
                let indexpath = self.tableView.indexPathForCell(superviewcell)
                print("clicked on docviewer \(indexpath!.row)")

                print(indexpath?.row)
            }

        }
        
        
    }
    
}