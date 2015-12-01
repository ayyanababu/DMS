//
//  AuthorViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var initiatorLabel: UITextField!
    @IBOutlet weak var authorLabel: UITextField!
    @IBOutlet weak var OwnerLabel: UITextField!
    var isUpVersion: Bool = NSUserDefaults.standardUserDefaults().boolForKey("isupversion")
    var docInfo: ProductionDocuments?
    var docid: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initiatorname = NSUserDefaults.standardUserDefaults().objectForKey("loggedinusername") as? String;
        self.initiatorLabel.text = initiatorname
        
        if isUpVersion{
            print("isupversion")
            self.setAutopopulatedata()
        }


        // Do any additional setup after loading the view.
    }
    
    
    func setAutopopulatedata()
    {
        
        self.authorLabel.text = self.docInfo?.docowner
        self.OwnerLabel.text = self.docInfo?.docowner
        
        
    }

  
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        print(initiatorLabel.text)
        print(authorLabel.text)
        print(OwnerLabel.text)
    }
    
    
    
}
