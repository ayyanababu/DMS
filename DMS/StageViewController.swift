//
//  StageViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class StageViewController: UIViewController {
    
    struct storyboardconstants {
        static var ACTION_SEGUE = "actionsegue"
    }

    var actionSelected: String?
    @IBOutlet weak var actionSearchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionSearchClick(sender: UIButton) {
        print("clicked on action search on stage view controller")
    }
   
}
