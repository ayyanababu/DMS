//
//  DocProfileViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DocProfileViewController: UIViewController {
    
    
    struct storyBoardConstants{
        
        static var UPLOAD_DOC_SEGUE = "uploaddocsearchseague"
    }
    
    
    @IBOutlet weak var docNamelabel: UITextField!
    @IBOutlet weak var docDescriptionTextView: UITextView!
    @IBOutlet weak var purposeField: UITextField!
    @IBOutlet weak var keywordsField: UITextField!
    @IBOutlet weak var uploadDocSearchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docDescriptionTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        docDescriptionTextView.layer.borderWidth = 0.5
        docDescriptionTextView.layer.cornerRadius = 5.0
        docDescriptionTextView.clipsToBounds = true
        
    }
    
   
    //MARK: SearchActions
    
    @IBAction func upLoadDocSearchAction(sender: UIButton) {
        
        print("clicked on upload doc search action button")
    }
    
    
    
    
}
