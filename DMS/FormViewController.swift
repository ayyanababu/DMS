//
//  FormViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 11/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet weak var sectionAButton: UIButton!
    @IBOutlet weak var sectionBButton: UIButton!
    @IBOutlet weak var sectionCButton: UIButton!
    @IBOutlet weak var sectionDButton: UIButton!
    @IBOutlet weak var formImage: UIImageView!
    
    @IBOutlet weak var containerVeiw: UIView!
    @IBOutlet weak var saveButtonItem: UIBarButtonItem!
    
    var docTitle: String?
    var docInfo: ProductionDocuments?

    
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
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        print("form controllers view will disappear called")
    }
    
    
    
    //Here we have to save the data from all controllers and update in production documents if doc is new create document or upversion
    func persistAndClearData(){
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        let prodDocument = DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "docid", filterParameters: [(self.docInfo?.docid)!]) as? [ProductionDocuments]
        
        
        if isUpversionDoc{
            prodDocument![0].docstatus = "Process"
            
        }else{
            prodDocument![0].docstatus = "Production"
        }
        
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
                
                if let lifecyclename = lifeCycleController?.lifeCycleNameField.text{
                     prodDocument![0].lifecycle = lifecyclename
                }else{
                    prodDocument![0].lifecycle = self.docInfo?.lifecycle
                }
                
                if let categoryname = lifeCycleController?.categoryNameField.text{
                    prodDocument![0].categoryname = categoryname
                }

                if let doceffectivedate = lifeCycleController?.datePicker.date{
                    prodDocument![0].doceffectivedate = doceffectivedate
                }
                

            }else if eachController .isKindOfClass(AuthorViewController){
                let authorController = eachController as? AuthorViewController
                
                if let docowner = authorController?.initiatorLabel.text{
                    prodDocument![0].docowner = docowner
                }

            }else if eachController .isKindOfClass(StageViewController){
                let stageController = eachController as? StageViewController

                if stageController?.stageid != "-1"{
                    prodDocument![0].stageid = stageController?.stageid
                    
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
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
   
        
        let prodDocument1 = DataPersistence.getDataFromTableWithFilter("ProductionDocuments", coloumnName: "docid", filterParameters: [(self.docInfo?.docid)!]) as? [ProductionDocuments]
        
        print(prodDocument1![0].docname)
        print(prodDocument1![0].docdescription)
        print(prodDocument1![0].docstatus)
        print(prodDocument1![0].doceffectivedate)
        print(prodDocument1![0].lifecycle)
        print(prodDocument1![0].categoryname)
         print(prodDocument1![0].stageid)
         print(prodDocument1![0].accessgroupid)
        
       
        //clear all the form controller
        self.sectionButtons.removeAll()
        self.profileControllers.removeAll()
    }
    
    
}
