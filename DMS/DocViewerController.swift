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
    
    var docPath: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Yet to implement all the code here
        
        self.title = "Doc Viewer"
        //fall back
        var docname = "finance"
        if docPath != nil{
            
            let docpatharray = docPath!.characters.split{$0 == "/"}.map(String.init)
            let docnamewithdot = docpatharray.last!
            
            //after gettign the last docname we have to give only the name and split by .
            let docnamearray = docnamewithdot.characters.split{$0 == "."}.map(String.init)
            docname = docnamearray[0]

        }

        
        
        let path = NSBundle.mainBundle().pathForResource(docname, ofType: "pdf")
        let url = NSURL.fileURLWithPath(path!)
        let request = NSURLRequest(URL: url)
        self.webView.loadRequest(request)
    }
    
    
    
    


}
