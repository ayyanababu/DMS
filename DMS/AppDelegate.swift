//
//  AppDelegate.swift
//  DMS
//
//  Created by Raja Ayyan on 10/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoginViewControllerDelegate {
    
    
    let documentsArray: [[String: AnyObject]] = [
        
        
        
        ["docid":"D3000","docname":"Employment Performance Improvement and Corrective Action Process Policy","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"2.0.0.0","docstatus":"Production","docowner":"bpatel.usaa","doccreationdate":"17/11/2015","docdescription":"Performance Review","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3001","docname":"qa-p-0015 Work Inspection ProcedurePolicy","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.7.0.0","docstatus":"Production","docowner":"sodishio.intel","doccreationdate":"17/11/2015","docdescription":"Work Inspection Procedure","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3002","docname":"fa-p-0009 Wire Management","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.1.0.0","docstatus":"Production","docowner":"ayyana.ms","doccreationdate":"17/11/2015","docdescription":"Wire Management","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3003","docname":"pqc-0166 Phone Request","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.0.0.0","docstatus":"Production","docowner":"sada.ms","doccreationdate":"17/11/2015","docdescription":"Phone Request","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3004","docname":"pqc-0166 Phone Request","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.0.0.0","docstatus":"Production","docowner":"sachee.ms","doccreationdate":"17/11/2015","docdescription":"Delivery Documentation","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3005","docname":"pqc-0266 PW OnBoarding BGC","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.0.0.0","docstatus":"Production","docowner":"debra.usaa","doccreationdate":"17/11/2015","docdescription":"PW OnBoarding BGC","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3006","docname":"pqc-0268 PW OnBoarding Files to Send","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.0.0.0","docstatus":"Production","docowner":"manuel.bcie","doccreationdate":"17/11/2015","docdescription":"PW OnBoarding Files to Send","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3007","docname":"tss-p-0004 FAA DER Commercial Deviation Report","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.2.0.0","docstatus":"Production","docowner":"reyesj.bcie","doccreationdate":"17/11/2015","docdescription":"FAA DER Commercial Deviation Report","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3008","docname":"pqc-0283 AQS Procedure Librarian","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.2.0.0","docstatus":"Production","docowner":"bpatel.usaa","doccreationdate":"17/11/2015","docdescription":"AQS Procedure Librarian","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1","doccomments":" "],
        
        ["docid":"D3009","docname":"pqc-0265 PW Compliance Unsolicited Resume","docattachment":"/DMS/Local/Resources/finance.pdf","docversion":"1.2.0.0","docstatus":"Production","docowner":"sodishio.intel","doccreationdate":"17/11/2015","docdescription":"PW Compliance Unsolicited Resume","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1","doccomments":" "]
        
        
    ]

    
    
    var window: UIWindow?
    var loggedIn: Bool = false {
        didSet {
            if loggedIn == true {
                loadRootViewController()
            }else{
                loadRootViewController()
            }
        }
    }
    
    var listOfUsers = [NSManagedObject]()
   
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
       
        //InsertSampleData
        DataPersistence.insertUsersSampleData()
        DataPersistence.insertProductionDocsSampleData(documentsArray,tobeInserted: true)
        DataPersistence.insertRoutingTableData()
        DataPersistence.insertUserAccessGroupData()
        DataPersistence.insertAccessGroupData()
        DataPersistence.insertStageAccessGroupData()
        DataPersistence.insertLifecycleAndStagesData()
        DataPersistence.insertLifeCycleAndCategorySampleData()
        DataPersistence.insertLifeCycleSampleData()
        DataPersistence.insertCategorySampleData()
        DataPersistence.insertStageAccessGroupData()
        
        loadRootViewController()
        
        return true
    }
    
    
    
    
    
    func loadRootViewController(){
        
        let storyBoard: UIStoryboard?
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if loggedIn == false{
            if let mainboard = storyBoard{
                window = UIWindow(frame: UIScreen.mainScreen().bounds)
                let logincontroller = mainboard.instantiateViewControllerWithIdentifier("loginview") as? LoginViewController
                logincontroller!.delegate = self
                self.window?.rootViewController = logincontroller
                self.window?.makeKeyAndVisible()
                
            }
            
        }else{
            
            
            
            if let mainboard = storyBoard{
                window = UIWindow(frame: UIScreen.mainScreen().bounds)
                let splitcontroller = mainboard.instantiateViewControllerWithIdentifier("splitcontroller")
                print(splitcontroller.parentViewController);
                self.window?.rootViewController = splitcontroller
                self.window?.makeKeyAndVisible()
                
            }
        }
        
    }
    
    
    
    
    //MARK: - LoginViewControllerDelegate
    func didLoginSuccessfully(){
        loggedIn = true
    }
    

    
    func applicationWillResignActive(application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.metricstream.DMS" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("DMS", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
}

