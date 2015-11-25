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
    var docInfo: ProductionDocuments?

    
  
    var lifecycleselected: String?
    var categorySelected: String?
    var effectiveData: NSDate?
    var textfieldtype: String?
    var isUpVersion: Bool = NSUserDefaults.standardUserDefaults().boolForKey("isupversion")
    let lifeCycles = DataPersistence.getDataFromTableAsList("LifeCycle") as! [LifeCycle]
    var lifecycle_categories: [Lifecycle_Category]?
    var docid: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isUpVersion{
            print("isupversion")
            self.setAutopopulatedata()
        }


    }
    
    func setAutopopulatedata()
    {
        self.lifeCycleNameField.text = self.docInfo?.lifecycle
        self.categoryNameField.text = self.docInfo?.categoryname
        
        self.datePicker.setDate((self.docInfo?.doceffectivedate)!, animated: false)
        
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
                
                var lifecycleArray = [String]()
                for eachlifeCycle in self.lifeCycles{
                    lifecycleArray.append(eachlifeCycle.lifecyclename!)
                }
                
                
                controller.tableHelperData = lifecycleArray
            }
            
        }else if segue.identifier == storyboardconstants.CATEGORY_NAME_SEGUE{
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self

                controller.navTitle = storyboardconstants.CATEGORY_TITLE
                
                
                let lifecycleid = self.getLifeCycleId(self.lifeCycleNameField.text!)
                
                 NSUserDefaults.standardUserDefaults().setValue(lifecycleid, forKey: "selectedlifecycleid")
                
                let lifecycle_categories = DataPersistence.getDataFromTableWithFilter("Lifecycle_Category", coloumnName: "lifecycleid", filterParameters: [lifecycleid]) as? [Lifecycle_Category]
              
                self.lifecycle_categories = lifecycle_categories
                var categoryArray = [String]()
                for eachcategory in lifecycle_categories!{
                    categoryArray.append(eachcategory.categoryname!)
                }
                
                controller.tableHelperData = categoryArray

            }
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
    
    
    func getCategoryId(categoryName:String) -> String{
        
        var categoryId: String?
        let categories = DataPersistence.getDataFromTableAsList("Category") as! [Category]
        for eachCategory in categories{
            if eachCategory.categoryname == categoryName{
                categoryId =  eachCategory.categoryid
                break;
            }
        }
       // categoryId = nil
        return categoryId!
    }

   
    
    //MARK: TableHelperDelegate
    
    func doneSelectingACell(selectedValue: String) {
        print("selected value \(selectedValue)")
        
        if textfieldtype == "lifecycle"{
         self.lifeCycleNameField.text = selectedValue
            
        let lifecycleid = self.getLifeCycleId(self.lifeCycleNameField.text!)
         NSUserDefaults.standardUserDefaults().setValue(lifecycleid, forKey: "selectedlifecycleid")
         textfieldtype = ""
        }else{
            self.categoryNameField.text = selectedValue
        }
        dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    

}
