//
//  StageViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class StageViewController: UIViewController, TableHelperDelegate {
    
    struct storyboardconstants {
        static var ACTION_SEGUE = "actionsegue"
        static var ACTION_TITLE = "Actions"
    }

    var actionSelected: String?
    @IBOutlet weak var actionSearchButton: UIButton!
    @IBOutlet weak var actionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionSearchClick(sender: UIButton) {
        print("clicked on action search on stage view controller")
    }
    
    
    //MARK: -Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navcontroller = segue.destinationViewController as? UINavigationController
        
        if segue.identifier == storyboardconstants.ACTION_SEGUE
        {
            if let controller = navcontroller?.topViewController as? TableHelperViewController{
                controller.delegate = self
                
                controller.navTitle = storyboardconstants.ACTION_TITLE
                let array: [String] = ["Action1","Action2","Action3","Action4","Action5"]
                controller.tableHelperData = array
            }
            
        }
    }
    
    //MARK: TableHelperDelegate
    
    func doneSelectingACell(selectedValue: String) {
        print("selected value \(selectedValue)")
        self.actionField.text = selectedValue
        dismissViewControllerAnimated(false, completion: nil)
        
    }

   
}
