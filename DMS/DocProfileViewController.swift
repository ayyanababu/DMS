//
//  DocProfileViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DocProfileViewController: UIViewController, TableHelperDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    
    struct storyBoardConstants{
        
        static var UPLOAD_DOC_SEGUE = "uploaddocsearchseague"
        static var UPLOAD_TITLE = "Documents"
    }
    
    
    @IBOutlet weak var docNamelabel: UITextField!
    @IBOutlet weak var docDescriptionTextView: UITextView!
    @IBOutlet weak var purposeField: UITextField!
    @IBOutlet weak var keywordsField: UITextField!
    @IBOutlet weak var uploadDocSearchButton: UIButton!
    @IBOutlet weak var uploadDocField: UITextField!
    
    var isUpVersion: Bool = NSUserDefaults.standardUserDefaults().boolForKey("isupversion")
    var docInfo: ProductionDocuments?

   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        docDescriptionTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        docDescriptionTextView.layer.borderWidth = 0.5
        docDescriptionTextView.layer.cornerRadius = 5.0
        docDescriptionTextView.clipsToBounds = true
        
        if isUpVersion{
            print("isupversion")
        }
       
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //MARK: -TextFieldDelegate Methods
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        print(self.docNamelabel.text)
        print(self.purposeField.text)
        print(self.keywordsField.text)
        print(self.uploadDocField.text)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        print(self.docDescriptionTextView.text)
    }
    

    
    //MARK: SearchActions
    
    @IBAction func upLoadDocSearchAction(sender: UIButton) {
        
        print("clicked on upload doc search action button")
    }
    
    
    //MARK: -Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navcontroller = segue.destinationViewController as? UINavigationController
        
        if segue.identifier == storyBoardConstants.UPLOAD_DOC_SEGUE
        {
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self
                
                controller.navTitle = storyBoardConstants.UPLOAD_TITLE
                let array: [String] = ["Doc1","Doc2","Doc3","Doc4","Doc5"]
                controller.tableHelperData = array
            }
            
        }
    }
    
    //MARK: TableHelperDelegate
    
    func doneSelectingACell(selectedValue: String) {
        print("selected value \(selectedValue)")
        
        uploadDocField.text = selectedValue
        dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
}
