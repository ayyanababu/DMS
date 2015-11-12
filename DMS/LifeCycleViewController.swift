//
//  LifeCycleViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var lifeCyclePicker: UIPickerView!
    @IBOutlet weak var categoryNamePicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reviewScheduleLabel: UITextField!
    
    var lifeCycleArray: [String] = ["LifeCycle1","LifeCycle2","LifeCycle3","LifeCycle4"]
    var categoryArray: [String] = ["Category1","Category2","Category3","Category4"]
    

    var lifecycleselected: String?
    var categorySelected: String?
    var effectiveData: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 101{
            return lifeCycleArray.count
        }else if pickerView.tag == 102{
            return categoryArray.count
        }else{
            return 3
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 101{
            return lifeCycleArray[row]
        }else if pickerView.tag == 102{
            return categoryArray[row]
        }else{
            return nil
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 101{
            let lifecycleselected = lifeCycleArray[row]
            self.lifecycleselected = lifecycleselected
            print(self.lifecycleselected)
        }else if pickerView.tag == 102{
            let categoryselected = categoryArray[row]
            self.categorySelected = categoryselected
            print(self.categorySelected)
        }
        
    }

    @IBAction func captureDate(sender: UIDatePicker) {
        
        let date = NSDateFormatter.localizedStringFromDate(datePicker.date, dateStyle: .FullStyle, timeStyle: .ShortStyle)
        print(date)
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd YYYY HH:MM"
        let date1 = formatter.stringFromDate(datePicker.date)
        print(date1)
        
        
    }

}
