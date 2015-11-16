//
//  LifeCycleViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController {
    
    
    struct storyboardconstants{
        static var LIFE_CYCLE_SEGUE = "lifecycleseague"
        static var CATEGORY_NAME_SEGUE = "categorysegue"
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reviewScheduleLabel: UITextField!
    @IBOutlet weak var lifeCycleSearchButton: UIButton!
    @IBOutlet weak var categorySearchButton: UIButton!
    
    

    var lifecycleselected: String?
    var categorySelected: String?
    var effectiveData: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
    @IBAction func captureDate(sender: UIDatePicker) {
        
        let date = NSDateFormatter.localizedStringFromDate(datePicker.date, dateStyle: .FullStyle, timeStyle: .ShortStyle)
        print(date)
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd YYYY HH:MM"
        let date1 = formatter.stringFromDate(datePicker.date)
        print(date1)
        
        
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
        if segue.identifier == storyboardconstants.LIFE_CYCLE_SEGUE{
            
        }else if segue.identifier == storyboardconstants.CATEGORY_NAME_SEGUE{
            
        }
    }
    
    
    
    
    

}
