//
//  DocProfileViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DocProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var docNamelabel: UITextField!
    @IBOutlet weak var docDescriptionTextView: UITextView!
    @IBOutlet weak var purposeField: UITextField!
    @IBOutlet weak var keywordsField: UITextField!
    @IBOutlet weak var uploadPicker: UIPickerView!
    
    
    
    var documents: [String] = ["financedocument.pdf" ,"BudgetDocument.pdf","employesdata.pdf"]
    var documentSelected: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        docDescriptionTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        docDescriptionTextView.layer.borderWidth = 0.5
        docDescriptionTextView.layer.cornerRadius = 5.0
        docDescriptionTextView.clipsToBounds = true
        
        
        uploadPicker.layer.borderColor = UIColor.lightGrayColor().CGColor
        uploadPicker.layer.cornerRadius = 5.0
        uploadPicker.layer.borderWidth = 0.5
        uploadPicker.clipsToBounds = true
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return documents.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return documents[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let docSelected = documents[row]
        documentSelected = docSelected
        print(documentSelected)
    }

}
