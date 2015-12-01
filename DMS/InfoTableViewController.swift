//
//  InfoTableViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

protocol InfoTableViewControllerDelegate{
    func reloadTableView()
}

class InfoTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var upversion: UIButton!
    @IBOutlet weak var obseleteButton: UIButton!
    @IBOutlet weak var deletebutton: UIButton!
    
    
    @IBOutlet weak var docNameLabel: UILabel!
    @IBOutlet weak var docAttachmentlabel: UILabel!
    @IBOutlet weak var docVersionLabel: UILabel!
    @IBOutlet weak var docStatuslabel: UILabel!
    @IBOutlet weak var docNumber: UILabel!
    @IBOutlet weak var docAuthorLabel: UILabel!
    @IBOutlet weak var docOwnerLabel: UILabel!
    @IBOutlet weak var docNextReviewDate: UILabel!
    @IBOutlet weak var lifecyclenamelabel: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    var documentId: String?
    
    var docInfo: ProductionDocuments?
    var delegate: InfoTableViewControllerDelegate?;
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.docInfo)
        self.docNameLabel.text = self.docInfo?.docname
        self.docAttachmentlabel.text = ""
        self.docVersionLabel.text = self.docInfo?.docversion
        self.docStatuslabel.text = self.docInfo?.docversion
        self.docNumber.text = "1"
        self.docAuthorLabel.text = self.docInfo?.docowner
        self.docOwnerLabel.text = self.docInfo?.docowner
        self.documentId = self.docInfo?.docid
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let nextreviewdatestring = dateFormatter.stringFromDate((self.docInfo?.docnextreviewdate)!)
        self.docNextReviewDate.text = nextreviewdatestring
        
        self.lifecyclenamelabel.text = self.docInfo?.lifecycle
        self.categoryName.text = self.docInfo?.categoryname
        
        
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
        delegate!.reloadTableView();
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
                controller.isUpversionDoc = true
                controller.docInfo = self.docInfo
            }
        }
    }
    

   
}
