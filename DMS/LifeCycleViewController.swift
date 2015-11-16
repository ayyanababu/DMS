//
//  LifeCycleViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController, TableHelperDelegate, UITextFieldDelegate {
    
    
    struct storyboardconstants{
        static var LIFE_CYCLE_SEGUE = "lifecycleseague"
        static var CATEGORY_NAME_SEGUE = "categorysegue"
        static var LIFE_CYCLE_TITLE = "LIfeCycles"
        static var CATEGORY_TITLE = "Categories"
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reviewScheduleLabel: UITextField!
    @IBOutlet weak var lifeCycleSearchButton: UIButton!
    @IBOutlet weak var categorySearchButton: UIButton!
    @IBOutlet weak var lifeCycleNameField: UITextField!
    @IBOutlet weak var categoryNameField: UITextField!
    
    var lifecycleselected: String?
    var categorySelected: String?
    var effectiveData: NSDate?
    
    var textfieldtype: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
    @IBAction func captureDate(sender: UIDatePicker) {
        
        let date = NSDateFormatter.localizedStringFromDate(datePicker.date, dateStyle: .FullStyle, timeStyle: .ShortStyle)
        print(date)
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd YYYY HH:MM"
        let date1 = formatter.stringFromDate(datePicker.date)
        print(date1)
        
        
    }
    
    
    
    //MARK: -TextFieldDelegate Methods
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        print(self.lifeCycleNameField.text)
        print(self.categoryNameField.text)
        print(self.reviewScheduleLabel.text)
    }
    
    
    //MARK: ActionButtons
    
    @IBAction func lifeCycleAction(sender: UIButton) {
        
        print("clicked on serch LifeCycle Action button")
        performSegueWithIdentifier(storyboardconstants.LIFE_CYCLE_SEGUE, sender: sender)
    }
    
    
    @IBAction func categoryAction(sender: UIButton) {
        print("clicked on serch LifeCycle Action button")
        performSegueWithIdentifier(storyboardconstants.CATEGORY_NAME_SEGUE, sender: sender)

    }
    
  
    
    //MARK: -Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navcontroller = segue.destinationViewController as? UINavigationController

        if segue.identifier == storyboardconstants.LIFE_CYCLE_SEGUE
        {
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self
                textfieldtype = "lifecycle"
                controller.navTitle = storyboardconstants.LIFE_CYCLE_TITLE
                let array: [String] = ["lifecycle1","lifecycle2","lifecycle3","lifecycle4","lifecycle5"]
                controller.tableHelperData = array
            }
            
        }else if segue.identifier == storyboardconstants.CATEGORY_NAME_SEGUE{
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self

                controller.navTitle = storyboardconstants.CATEGORY_TITLE
                let array: [String] = ["category1","category2","category3","category4","category5",]
                controller.tableHelperData = array

            }
        }
    }
    
    //MARK: TableHelperDelegate
    
    func doneSelectingACell(selectedValue: String) {
        print("selected value \(selectedValue)")
        
        if textfieldtype == "lifecycle"{
         self.lifeCycleNameField.text = selectedValue
         textfieldtype = ""
        }else{
            self.categoryNameField.text = selectedValue
        }
        dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    

}
