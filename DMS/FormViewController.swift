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
    
    //current container view in rightside view
    var docContainerController: UIViewController?
    
    
    
    var sectionButtons = [UIButton]()
    var controllerClasses = [Int: String]()
    var profileControllers = [UIViewController]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionAButton.tag = 1001
        sectionBButton.tag = 1002
        sectionCButton.tag = 1003
        sectionDButton.tag = 1004
        
        self.containerVeiw.backgroundColor = UIColor.lightGrayColor()
        
        sectionButtons.append(sectionAButton)
        sectionButtons.append(sectionBButton)
        sectionButtons.append(sectionCButton)
        sectionButtons.append(sectionDButton)
        
        controllerClasses[1001] = "docprofile"
        controllerClasses[1002] = "lifecycle"
        controllerClasses[1003] = "author"
        controllerClasses[1004] = "stage"
        
        
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
                let controllername = controllerClasses[eachButton.tag]
                
                
                self.loadDocProfileController(controllername!)
                
                
                
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
    
    
    func loadDocProfileController(controllerName: String){
        
        
        let storyBoard: UIStoryboard?
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let mainboard = storyBoard{
            
            if controllerName == "docprofile"{
                self.docContainerController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? DocProfileViewController)!
                
                if !self.profileControllers.contains(self.docContainerController!){
                   // self.profileControllers.append(self.docContainerController!)
                }
                
            }else if controllerName == "lifecycle"{
                
                self.docContainerController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? LifeCycleViewController)!
                if !self.profileControllers.contains(self.docContainerController!){
                    //self.profileControllers.append(self.docContainerController!)
                }
                
            }else if controllerName == "author"{
                self.docContainerController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? AuthorViewController)!
                if !self.profileControllers.contains(self.docContainerController!){
                   // self.profileControllers.append(self.docContainerController!)
                }
                
            }else if controllerName == "stage"{
                self.docContainerController =  (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? StageViewController)!
                if !self.profileControllers.contains(self.docContainerController!){
                   // self.profileControllers.append(self.docContainerController!)
                }
                
            }else{
                self.docContainerController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? DocProfileViewController)!
                if !self.profileControllers.contains(self.docContainerController!){
                   // self.profileControllers.append(self.docContainerController!)
                }
                
            }
            
            
            
            self.docContainerController!.view.frame = CGRectMake(0, 0, self.containerVeiw.frame.size.width, self.containerVeiw.frame.size.height);
            self.docContainerController!.willMoveToParentViewController(self)
            self.containerVeiw.addSubview(self.docContainerController!.view)
            self.addChildViewController(self.docContainerController!)
            self.docContainerController!.didMoveToParentViewController(self)
            
            
        }
    }
    
    @IBAction func saveForm(sender: UIBarButtonItem) {
        
        
        //while saving a form we have to do below steps
        
        // we have to save this form based on usergorups  into userdocs table
        
        
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    
}
