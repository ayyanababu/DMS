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
    
    
    var sectionButtons = [UIButton]()
    var controllerClasses = [Int: String]()
    
    
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
            
            let docProfileController: UIViewController
            if controllerName == "docprofile"{
                docProfileController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? DocProfileViewController)!
            }else if controllerName == "lifecycle"{
                docProfileController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? LifeCycleViewController)!
            }else if controllerName == "author"{
                docProfileController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? AuthorViewController)!
            }else if controllerName == "stage"{
                docProfileController =  (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? StageViewController)!
            }else{
                docProfileController = (mainboard.instantiateViewControllerWithIdentifier(controllerName) as? DocProfileViewController)!
            }
                
            

            
            print("container view frame = \(self.containerVeiw.frame)")
            docProfileController.view.frame = CGRectMake(0, 0, self.containerVeiw.frame.size.width, self.containerVeiw.frame.size.height);

            docProfileController.willMoveToParentViewController(self)
            self.containerVeiw.addSubview(docProfileController.view)
            self.addChildViewController(docProfileController)
            docProfileController.didMoveToParentViewController(self)
            
            
        }
    }
    
    
    @IBAction func saveForm(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    
}
