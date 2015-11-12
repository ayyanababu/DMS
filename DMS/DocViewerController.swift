//
//  DocViewerController.swift
//  DMS
//
//  Created by Raja Ayyan on 12/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DocViewerController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Doc Viewer"
        
        let path = NSBundle.mainBundle().pathForResource("finance", ofType: "pdf")
        let url = NSURL.fileURLWithPath(path!)
        let request = NSURLRequest(URL: url)
        self.webView.loadRequest(request)
    }
    
    
    
    


}
