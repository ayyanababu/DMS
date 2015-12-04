//
//  FormViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 11/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

protocol FormSubmittedDelegate{
    func formSubmittedorcreated()
}

class FormViewController: UIViewController {
    
    
    @IBOutlet weak var sectionAButton: UIButton!
    @IBOutlet weak var sectionBButton: UIButton!
    @IBOutlet weak var sectionCButton: UIButton!
    @IBOutlet weak var sectionDButton: UIButton!
    @IBOutlet weak var formImage: UIImageView!
    
    @IBOutlet weak var containerVeiw: UIView!
    @IBOutlet weak var saveButtonItem: UIBarButtonItem!
    @IBOutlet weak var cancleButtonItem: UIBarButtonItem!
    
    
    var docTitle: String?
    var docInfo: ProductionDocuments?
    var delegate: FormSubmittedDelegate?
    
    
    //current container view in rightside view
    var docContainerController: UIViewController?
    
    
    
    lazy var sectionButtons = [UIButton]()
    lazy var profileControllers = [UIViewController]()
    var isUpversionDoc: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userdefaults = NSUserDefaults.standardUserDefaults()
        if isUpversionDoc{
            userdefaults.setBool(true, forKey: "isupversion")
            print("upversiondoc")
        }else{
            userdefaults.setBool(false, forKey: "isupversion")
            
            print("newform")
            
        }
        
        
        self.prepareButtonsArray()
        self.loadControllerArrays()
        
        self.sectionButtonClicks(sectionAButton)
        self.navigationItem.title = docTitle
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sectionButtonClicks(sender: UIButton) {
        
        let senderButton = sender as UIButton
        
        self.docContainerController?.removeFromParentViewController()
        
        for eachButton in sectionButtons{
            if eachButton.tag == senderButton.tag{
                
                
                eachButton.clipsToBounds = false
                eachButton.layer.shadowColor = UIColor.blackColor().CGColor
                eachButton.layer.shadowOffset = CGSizeMake(0,5)
                eachButton.layer.shadowOpacity = 1.0
                
                eachButton.backgroundColor = UIColor.whiteColor()
                let image  = "\(eachButton.tag)black48"
                let buttonImage = UIImage(named: image)
                eachButton.setImage(buttonImage, forState: UIControlState.Normal)
                eachButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                
                let index = senderButton.tag % 1000
                self.loadControllerOnContainer(index)
                
                
                
            }else{
                
                let image  = "\(eachButton.tag)white48"
                let buttonImage = UIImage(named: image)
                eachButton.layer.shadowOpacity = 0.0
                
                eachButton.setImage(buttonImage, forState: UIControlState.Normal)
                eachButton.backgroundColor = UIColor(red: 32/255, green: 173/255, blue: 82/255, alpha: 1.0)
                eachButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                
                
            }
        }
        
        
    }
    
    
    //MARK: LoadingControllers
    func loadControllerArrays(){
        
        
        let storyBoard: UIStoryboard?
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let mainboard = storyBoard{
            let docProfileController = (mainboard.instantiateViewControllerWithIdentifier("docprofile") as? DocProfileViewController)!
            if isUpversionDoc{
                docProfileController.docInfo = self.docInfo
            }
            let lifeCycleController = (mainboard.instantiateViewControllerWithIdentifier("lifecycle") as? LifeCycleViewController)!
            if isUpversionDoc{
                lifeCycleController.docInfo = self.docInfo
            }
            let authorController  = (mainboard.instantiateViewControllerWithIdentifier("author") as? AuthorViewController)!
            if isUpversionDoc{
                authorController.docInfo = self.docInfo
            }
            let stageController =  (mainboard.instantiateViewControllerWithIdentifier("stage") as? StageViewController)!
            
            if isUpversionDoc{
                stageController.docInfo = self.docInfo
            }
            
            self.profileControllers.append(docProfileController)
            self.profileControllers.append(lifeCycleController)
            self.profileControllers.append(authorController)
            self.profileControllers.append(stageController)
            
        }
        
    }
    
    func prepareButtonsArray(){
        sectionAButton.tag = 1000
        sectionBButton.tag = 1001
        sectionCButton.tag = 1002
        sectionDButton.tag = 1003
        
        sectionButtons.append(sectionAButton)
        sectionButtons.append(sectionBButton)
        sectionButtons.append(sectionCButton)
        sectionButtons.append(sectionDButton)
        
    }
    
    
    func loadControllerOnContainer(controllerIndex: Int){
        self.docContainerController = self.profileControllers[controllerIndex]
        
        self.docContainerController!.view.frame = CGRectMake(0, 0, self.containerVeiw.frame.size.width, self.containerVeiw.frame.size.height);
        self.docContainerController!.willMoveToParentViewController(self)
        self.containerVeiw.addSubview(self.docContainerController!.view)
        self.addChildViewController(self.docContainerController!)
        self.docContainerController!.didMoveToParentViewController(self)
        
    }
    
    
    @IBAction func saveForm(sender: UIBarButtonItem) {
        
        
        //while saving a form we have to do below steps
        
        // we have to save this form based on usergorups  into userdocs table
        self.persistAndClearData()
        self.dismissViewControllerAnimated(false, completion: nil)
        
        delegate?.formSubmittedorcreated()
        
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        print("form controllers view will disappear called")
    }
    
    func updateDocument(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let prodDocument = DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "docid", filterParameters: [(self.docInfo?.docid)!]) as? [ProductionDocuments]
        
        
        
        
        prodDocument![0].docstatus = "Process"
        
        for eachController in self.profileControllers{
            print(self.docInfo?.docid)
            if eachController.isKindOfClass(DocProfileViewController){
                let docprofilecontroller = eachController as? DocProfileViewController
                
                if let docname = docprofilecontroller?.docNamelabel.text{
                    prodDocument![0].docname = docname
                }else{
                    prodDocument![0].docname = self.docInfo?.docname
                }
                
                if let docdesc = docprofilecontroller?.docDescriptionTextView.text{
                    prodDocument![0].docdescription = docdesc
                }else{
                    prodDocument![0].docdescription = self.docInfo?.docdescription
                }
                
                
                
                
            }else if eachController .isKindOfClass(LifeCycleViewController){
                let lifeCycleController = eachController as? LifeCycleViewController
                
                if lifeCycleController?.lifeCycleNameField != nil{
                    prodDocument![0].lifecycle = lifeCycleController?.lifeCycleNameField.text
                }else{
                    prodDocument![0].lifecycle = self.docInfo?.lifecycle
                }
                
                if lifeCycleController?.categoryNameField != nil{
                    prodDocument![0].categoryname = lifeCycleController?.categoryNameField.text
                }
                
                if lifeCycleController?.datePicker != nil{
                    prodDocument![0].doceffectivedate = lifeCycleController?.datePicker.date
                }
                
                
                
                
            }else if eachController .isKindOfClass(AuthorViewController){
                let authorController = eachController as? AuthorViewController
                
                if authorController?.initiatorLabel != nil{
                    prodDocument![0].docowner = authorController?.initiatorLabel.text
                }
                
                
                
            }else if eachController .isKindOfClass(StageViewController){
                let stageController = eachController as? StageViewController
                
                if stageController?.actionField != nil{
                    if stageController?.actionField.text == "Move To Production"{
                        prodDocument![0].docstatus = "Production"
                    }
                }
                
                
                
                if stageController?.stageid != "-1"{
                    prodDocument![0].stageid = stageController?.stageid
                    
                    if stageController?.stageid == "-1"{
                        return
                    }
                    
                    if stageController?.stageid != nil{
                        var routingDetails =  DataPersistence.getRoutingDetailsByPassingStageId((stageController?.stageid)!)
                        if routingDetails?.count > 0 {
                            let routingdetail = routingDetails![0]
                            prodDocument![0].stageid = routingdetail.routingstageid
                            
                            
                            var stageAccessgroup =  DataPersistence.getDataFromTableWithFilter("Stages_AccessGroup", coloumnName: "stageid", filterParameters: [routingdetail.routingstageid!]) as? [Stages_AccessGroup]
                            
                            if stageAccessgroup?.count > 0 {
                                let accessgroupid = stageAccessgroup![0].accessgroupid
                                prodDocument![0].accessgroupid = accessgroupid
                                
                            }
                            
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
        
        
        /*   let prodDocument1 = DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "docid", filterParameters: [(self.docInfo?.docid)!]) as? [ProductionDocuments]
        
        print(prodDocument1![0].docname)
        print(prodDocument1![0].docdescription)
        print(prodDocument1![0].docstatus)
        print(prodDocument1![0].doceffectivedate)
        print(prodDocument1![0].lifecycle)
        print(prodDocument1![0].categoryname)
        print(prodDocument1![0].stageid)
        print(prodDocument1![0].accessgroupid)*/
        
        
    }
    
    func insertDocument(){
        
        
        
        /* ["docid":"D3009","docname":"pqc-0265 PW Compliance Unsolicited Resume","docattachment":"","docversion":"1.2.0.0","docstatus":"Production","docowner":"sodishio.intel","doccreationdate":"17/11/2015","docdescription":"PW Compliance Unsolicited Resume","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"]*/
        
        var  newDocArray = [[String:AnyObject]]()
        var eachDocument = [String: AnyObject]()
        
        //in db docid should be autoincremented for demo purpose hardcoding it
        let documentsList = DataPersistence.getDataFromTableAsList("ProductionDocuments") as? [ProductionDocuments]
        let doccount = documentsList?.count
        let docid = 3000 + doccount!
        let createdDocId = "D\(docid)"
        print(createdDocId)
        
        eachDocument["docid"] = createdDocId
        eachDocument["docstatus"] = "Process"
        eachDocument["docowner"] = NSUserDefaults.standardUserDefaults().objectForKey("loggedinusername") as? String
        
        let curdate = NSDate()
        let curDateFormatter = NSDateFormatter()
        curDateFormatter.dateFormat = "dd/MM/yyyy"
        let currDateString = curDateFormatter.stringFromDate(curdate)
        eachDocument["doccreationdate"] = currDateString
        
        for eachController in self.profileControllers{
            
            
            if eachController.isKindOfClass(DocProfileViewController){
                let docprofilecontroller = eachController as? DocProfileViewController
                
                
                if let docname = docprofilecontroller?.docNamelabel.text{
                    eachDocument["docname"] = docname
                }
                
                if let docdesc = docprofilecontroller?.docDescriptionTextView.text{
                    eachDocument["docdescription"] = docdesc
                }
                
                if let docattachment = docprofilecontroller?.uploadDocField.text{
                    eachDocument["docattachment"] = docattachment
                }
                
                
                
            }else if eachController .isKindOfClass(LifeCycleViewController){
                let lifeCycleController = eachController as? LifeCycleViewController
                
                if lifeCycleController?.lifeCycleNameField != nil{
                    eachDocument["lifecycle"] = lifeCycleController?.lifeCycleNameField.text
                }
                
                if lifeCycleController?.categoryNameField != nil{
                    eachDocument["categoryname"] = lifeCycleController?.categoryNameField.text
                }
                
                eachDocument["doceffectivedate"] = ""
                if lifeCycleController?.datePicker != nil{
                    if let doceffectivedate = lifeCycleController?.datePicker.date{
                        let dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy"
                        let dateString = dateFormatter.stringFromDate(doceffectivedate)
                        eachDocument["doceffectivedate"] = "\(dateString)"
                    }
                }
                
                
                
            }else if eachController .isKindOfClass(StageViewController){
                let stageController = eachController as? StageViewController
                
                if stageController?.commentsField != nil{
                    eachDocument["doccomments"] = stageController?.commentsField.text
                    
                }
                
                var routingDetails =  DataPersistence.getRoutingDetailsByPassingStageId("LS1500")
                if routingDetails?.count > 0 {
                    let routingdetail = routingDetails![0]
                    eachDocument["stageid"] = routingdetail.routingstageid
                    
                    var stageAccessgroup =  DataPersistence.getDataFromTableWithFilter("Stages_AccessGroup", coloumnName: "stageid", filterParameters: [routingdetail.routingstageid!]) as? [Stages_AccessGroup]
                    
                    if stageAccessgroup?.count > 0 {
                        let accessgroupid = stageAccessgroup![0].accessgroupid
                        eachDocument["accessgroupid"] = accessgroupid
                        
                    }
                    
                }
                
            }
            
        }
        newDocArray.append(eachDocument)
        DataPersistence.insertProductionDocsSampleData(newDocArray,tobeInserted: false)
        
        
        let prodDocument1 = DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "docid", filterParameters: [createdDocId]) as? [ProductionDocuments]
        
        print(prodDocument1![0].docname)
        print(prodDocument1![0].docdescription)
        print(prodDocument1![0].docstatus)
        print(prodDocument1![0].doceffectivedate)
        print(prodDocument1![0].lifecycle)
        print(prodDocument1![0].categoryname)
        print(prodDocument1![0].stageid)
        print(prodDocument1![0].accessgroupid)
    }
    
    //Here we have to save the data from all controllers and update in production documents if doc is new create document or upversion
    func persistAndClearData(){
        
        if isUpversionDoc{
            self.updateDocument()
        }else{
            self.insertDocument()
        }
        
        
        
        //clear all the form controller
        self.sectionButtons.removeAll()
        self.profileControllers.removeAll()
    }
    
    
    @IBAction func cancleButton(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(false, completion: nil);
    }
    


    
}
