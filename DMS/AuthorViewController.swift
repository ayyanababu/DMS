//
//  AuthorViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController, UITextFieldDelegate, TableHelperDelegate {
    
    struct storyboardconstants{
        static var AUTHOR_SEGUE = "authorsegue"
        static var OWNER_SEGUE = "ownersegue"
        static var USERS_TITLE = "Users"
        
    }
    
    
    @IBOutlet weak var initiatorLabel: UITextField!
    @IBOutlet weak var authorLabel: UITextField!
    @IBOutlet weak var OwnerLabel: UITextField!
    
    var fieldtype: String?
    
    var isUpVersion: Bool = NSUserDefaults.standardUserDefaults().boolForKey("isupversion")
    var docInfo: ProductionDocuments?
    var docid: String?
    var userslist =  [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initiatorname = NSUserDefaults.standardUserDefaults().objectForKey("loggedinusername") as? String;
        self.initiatorLabel.text = initiatorname
        
        if isUpVersion{
            print("isupversion")
            self.setAutopopulatedata()
        }
        
        self.authorLabel.text = initiatorname
        self.OwnerLabel.text = initiatorname
        
        let userNamelist = DataPersistence.getDataFromTableAsList("Users") as? [Users]
        for eachUser in userNamelist!{
            userslist.append(eachUser.username!)
        }


        // Do any additional setup after loading the view.
    }
    
    
    func setAutopopulatedata()
    {
        
        self.authorLabel.text = self.docInfo?.docowner
        self.OwnerLabel.text = self.docInfo?.docowner
        
        
    }
    
    
    //MARK: -Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navcontroller = segue.destinationViewController as? UINavigationController
        
        if segue.identifier == storyboardconstants.AUTHOR_SEGUE
        {
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self
                fieldtype = "author"
                controller.navTitle = storyboardconstants.USERS_TITLE
                controller.tableHelperData = userslist            }
            
        }else if segue.identifier == storyboardconstants.OWNER_SEGUE{
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self
                controller.navTitle = storyboardconstants.USERS_TITLE
                controller.tableHelperData = userslist              
            }
        }
    }


  
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        print(initiatorLabel.text)
        print(authorLabel.text)
        print(OwnerLabel.text)
    }
    
    func doneSelectingACell(selectedValue: String) {
        print("selected value \(selectedValue)")
        
        if fieldtype == "author"{
            self.authorLabel.text = selectedValue
            fieldtype = ""
        }else{
            self.OwnerLabel.text = selectedValue
        }
        dismissViewControllerAnimated(false, completion: nil)
        
    }

    
}
