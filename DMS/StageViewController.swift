//
//  StageViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class StageViewController: UIViewController, TableHelperDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    struct storyboardconstants {
        static var ACTION_SEGUE = "actionsegue"
        static var ACTION_TITLE = "Actions"
    }
    
    var actionSelected: String?
    @IBOutlet weak var actionSearchButton: UIButton!
    @IBOutlet weak var actionField: UITextField!
    @IBOutlet weak var stageNameField: UITextField!
    @IBOutlet weak var stageUsers: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentsField: UITextView!
    
    
    var isUpVersion: Bool = NSUserDefaults.standardUserDefaults().boolForKey("isupversion")
    var docInfo: ProductionDocuments?
    var lifecycleid: String?
    var stageData = [StageData]()
    var docid: String?
    let lifeCycles = DataPersistence.getDataFromTableAsList("LifeCycle") as! [LifeCycle]
    var stageid: String?

    
    var isUpversionDoc: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentsField.layer.borderColor = UIColor.lightGrayColor().CGColor
        commentsField.layer.borderWidth = 0.5
        commentsField.layer.cornerRadius = 5.0
        commentsField.clipsToBounds = true
        
        
        self.tableView.layer.cornerRadius = 5.0
        self.tableView.clipsToBounds = true
        self.tableView.layer.borderWidth = 1.0
        self.tableView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        self.stageid = "-1"
        if let stageid = self.docInfo?.stageid{
            if stageid == "-1"{
                self.setActionName("LS1500")
                self.stageid = "LS1500"
            }else{
                self.stageid = stageid
                self.setActionName(stageid)
            }
        }
        
        if self.stageid == "-1"{
            self.setActionName("LS1500")
            self.stageid = "LS1500"
        }
    
        
    }
    
    func setActionName(stageid: String){
       var routingDetails =  DataPersistence.getRoutingDetailsByPassingStageId(stageid)
        if routingDetails?.count > 0 {
            let routingdetail = routingDetails![0]
            self.actionField.text = routingdetail.actionname
        }
        
    }
    
    func getLifeCycleId(lifecycleName:String) -> String{
        
        var lifecycleId: String?
        for eachLifeCycle in self.lifeCycles{
            if eachLifeCycle.lifecyclename == lifecycleName{
                lifecycleId =  eachLifeCycle.lifecycleid
                break;
            }
        }
        // lifecycleId = nil
        return lifecycleId!
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadStageTableData()
        
        if isUpVersion{
            print("isupversion")
        }else{
            self.loadStageTableData()
            
        }
        
        self.tableView.reloadData()

    }
    @IBAction func actionSearchClick(sender: UIButton) {
        print("clicked on action search on stage view controller")
    }
    
    
    //MARK: -Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navcontroller = segue.destinationViewController as? UINavigationController
        
        if segue.identifier == storyboardconstants.ACTION_SEGUE
        {
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self
                
                controller.navTitle = storyboardconstants.ACTION_TITLE
                let array: [String] = ["Action1","Action2","Action3","Action4","Action5"]
                controller.tableHelperData = array
            }
            
        }
    }
    
    //MARK: TableHelperDelegate
    
    func doneSelectingACell(selectedValue: String) {
        print("selected value \(selectedValue)")
        self.actionField.text = selectedValue
        dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    //MARK: -TextFieldDelegate Methods
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        print(self.actionField.text)
        print(self.stageNameField.text)
        print(self.stageUsers.text)
    }
    
    
    //MARK: -TableViewMethods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.stageData.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionUsers = self.stageData[section].stageUsers
        if sectionUsers?.count > 0{
            return sectionUsers!.count
        }else{
             return 10
        }
       
    }
    
   
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionUsers = self.stageData[section]
        return sectionUsers.stageName
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 32/255, green: 173/255, blue: 82/255, alpha: 1.0).colorWithAlphaComponent(0.5)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stagecell", forIndexPath: indexPath) as? StageTableViewCell
        
        if self.stageData.count > 0{
            let sectiondata = self.stageData[indexPath.section]
            let sectionUsers = sectiondata.stageUsers![indexPath.row]
            
            //cell!.stageNameLabel.text = sectionUsers.id
            cell!.stageUsersLabel.text = sectionUsers.username
        }
        
        
        
        return cell!
    }
    
    
    func loadStageTableData(){
        
        
        var lifecycleid = NSUserDefaults.standardUserDefaults().valueForKey("selectedlifecycleid") as? String
        if isUpVersion{
            print("isupversion")
            lifecycleid = self.getLifeCycleId((self.docInfo?.lifecycle)!)

        }else{
            //to be delete
            lifecycleid = "L1400"
        }
        
        
        
        if lifecycleid == " "{
                return
        }
        
        //get the stagenames
        let stageNameAccessGrouparray = DataPersistence.getDataFromTableWithFilter("Stages_AccessGroup", coloumnName: "lifecycleid", filterParameters: [lifecycleid!]) as! [Stages_AccessGroup]
        
        for eachStageAccess in stageNameAccessGrouparray{
            //I have to get the each accessgroupid 
            let stageName: String = eachStageAccess.stagename!
            var stageUsers = [Users]()
            
            let usersArray = DataPersistence.getDataFromTableWithFilter("Users_AccessGroup", coloumnName: "accessgroupid", filterParameters: [eachStageAccess.accessgroupid!]) as! [Users_AccessGroup]
            
            for eachUser in usersArray{
                let usersdata = DataPersistence.getDataFromTableWithFilter("Users", coloumnName: "id", filterParameters: [eachUser.userid!]) as! [Users]
                stageUsers.append(usersdata.first!)
                
            }
            
           
            if self.stageData.count > 0{
                var isFound = false
                for eachstage in self.stageData{
                    if eachstage.stageName == stageName{
                        eachstage.stageUsers?.appendContentsOf(stageUsers)
                        isFound = true
                    }
                }
                
                if !isFound{
                    
                        self.stageData.append(StageData(stageName: stageName, stageUsers: stageUsers))
                    
                }
            }else{
                self.stageData.append(StageData(stageName: stageName, stageUsers: stageUsers))
            }
            
            
            NSUserDefaults.standardUserDefaults().setValue(" ", forKey: "selectedlifecycleid")
            
        }
        
        
        
       

    }
    
    
    
    
}
