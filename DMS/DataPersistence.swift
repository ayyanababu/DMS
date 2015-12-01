//
//  DataPersistence.swift
//  DMS
//
//  Created by Raja Ayyan on 15/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DataPersistence{
    
    
    
    static let userdetailsArray: [[String: AnyObject]] = [
        
        ["id":"U2300", "username":"bpatel.usaa","firstname":"Bimal","lastname":"Patel","password":"welcome*123","role":"DMS_Manager"],
        ["id":"U2301", "username":"sodishio.intel","firstname":"Stella","lastname":"Odishio","password":"welcome*123","role":"DMS_Manager"],
        ["id":"U2302", "username":"ayyana.ms","firstname":"Ayyanababu","lastname":"Kopparthi Raja","password":"welcome*123","role":"DMS_Manager",],
        ["id":"U2303", "username":"sada.ms","firstname":"Sadananda","lastname":"Vaidya","password":"welcome*123","role":"DMS_Manager"],
        ["id":"U2304", "username":"sachee.ms","firstname":"Sachee","lastname":"Choubey","password":"welcome*123","role":"DMS_Manager"],
        ["id":"U2305", "username":"debra.usaa","firstname":"Debra","lastname":"Cooper","password":"welcome*123","role":"DMS_User"],
        ["id":"U2306", "username":"manuel.bcie","firstname":"Manuel","lastname":"Salinas","password":"welcome*123","role":"DMS_User"],
        ["id":"U2307", "username":"reyesj.bcie","firstname":"Jose","lastname":"Fernando","password":"welcome*123","role":"DMS_User"],
        ["id":"U2308", "username":"DMS_User1","firstname":"DMS","lastname":"User1","password":"welcome*123","role":"DMS_User"],
        ["id":"U2309", "username":"DMS_User2","firstname":"DMS","lastname":"User2","password":"welcome*123","role":"DMS_User"],
    ]
    
    
    
    static let documentsArray: [[String: AnyObject]] = [
        
        
        ["docid":"D3000","docname":"Employment Performance Improvement and Corrective Action Process Policy","docattachment":"","docversion":"2.0.0.0","docstatus":"Production","docowner":"bpatel.usaa","doccreationdate":"17/11/2015","docdescription":"Performance Review","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3001","docname":"qa-p-0015 Work Inspection ProcedurePolicy","docattachment":"","docversion":"1.7.0.0","docstatus":"Production","docowner":"sodishio.intel","doccreationdate":"17/11/2015","docdescription":"Work Inspection Procedure","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3002","docname":"fa-p-0009 Wire Management","docattachment":"","docversion":"1.1.0.0","docstatus":"Production","docowner":"ayyana.ms","doccreationdate":"17/11/2015","docdescription":"Wire Management","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3003","docname":"pqc-0166 Phone Request","docattachment":"","docversion":"1.0.0.0","docstatus":"Production","docowner":"sada.ms","doccreationdate":"17/11/2015","docdescription":"Phone Request","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3004","docname":"pqc-0166 Phone Request","docattachment":"","docversion":"1.0.0.0","docstatus":"Production","docowner":"sachee.ms","doccreationdate":"17/11/2015","docdescription":"Delivery Documentation","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"ASC","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3005","docname":"pqc-0266 PW OnBoarding BGC","docattachment":"","docversion":"1.0.0.0","docstatus":"Production","docowner":"debra.usaa","doccreationdate":"17/11/2015","docdescription":"PW OnBoarding BGC","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3006","docname":"pqc-0268 PW OnBoarding Files to Send","docattachment":"","docversion":"1.0.0.0","docstatus":"Production","docowner":"manuel.bcie","doccreationdate":"17/11/2015","docdescription":"PW OnBoarding Files to Send","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3007","docname":"tss-p-0004 FAA DER Commercial Deviation Report","docattachment":"","docversion":"1.2.0.0","docstatus":"Production","docowner":"reyesj.bcie","doccreationdate":"17/11/2015","docdescription":"FAA DER Commercial Deviation Report","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3008","docname":"pqc-0283 AQS Procedure Librarian","docattachment":"","docversion":"1.2.0.0","docstatus":"Production","docowner":"bpatel.usaa","doccreationdate":"17/11/2015","docdescription":"AQS Procedure Librarian","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"],
        
        ["docid":"D3009","docname":"pqc-0265 PW Compliance Unsolicited Resume","docattachment":"","docversion":"1.2.0.0","docstatus":"Production","docowner":"sodishio.intel","doccreationdate":"17/11/2015","docdescription":"PW Compliance Unsolicited Resume","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"]
        
        
    ]
    
    
    static let categories: [[String: AnyObject]] = [
        ["categoryid":"C1300", "categoryname":"ASC"],
        ["categoryid":"C1301", "categoryname":"Enterprise Governance"]
    ]
    
    
    static let  lifecycle:  [[String: AnyObject]] = [
        
        ["lifecycleid":"L1400","lifecyclename":"Audit Annual Review"],
        ["lifecycleid":"L1401","lifecyclename":"Federated Policy Management"],
        ["lifecycleid":"L1402","lifecyclename":"Intel Security - Policy Attestation"],
        ["lifecycleid":"L1403","lifecyclename":"Mid Year Review MS"],
        ["lifecycleid":"L1404","lifecyclename":"HR Policy"]
        
    ]
    
    
    static let lifecategoryarray: [[String: AnyObject]] = [
        
        ["categoryid":"C1300", "categoryname":"ASC","lifecycleid":"L1400"],
        ["categoryid":"C1301", "categoryname":"Enterprise Governance","lifecycleid":"L1400"]
            
    ]
    
    static let lifestagearray: [[String: AnyObject]] =
    
    [
        
        ["lifecycleid":"L1400","stageid":"LS1500","stagename":"ASC Request"],
        ["lifecycleid":"L1400","stageid":"LS1501","stagename":"ASC Legal SME Review"],
        ["lifecycleid":"L1400","stageid":"LS1502","stagename":"ASC Business Review"],
        ["lifecycleid":"L1400","stageid":"LS1503","stagename":"ASC Business Final Acknowledgement"],
        ["lifecycleid":"L1400","stageid":"LS1504","stagename":"Enterprise Governance Review"],
        ["lifecycleid":"L1400","stageid":"LS1505","stagename":"ASC Final Acknowledgement"],
        ["lifecycleid":"L1400","stageid":"LS1506","stagename":"ASC Committee Review"],
        ["lifecycleid":"L1400","stageid":"LS1507","stagename":"ASC Annual Review Approval"]
        
    ]

    static let stageAccessGroupArray: [[String: AnyObject]] =
    
    [
        
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor","stageid":"LS1500","stagename":"ASC Request","lifecycleid":"L1400"],
        ["accessgroupid":"A1201","accessgroupname":"Asc Legal SME","stageid":"LS1501","stagename":"ASC Legal SME Review","lifecycleid":"L1400"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer","stageid":"LS1502","stagename":"ASC Business Review","lifecycleid":"L1400"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer","stageid":"LS1503","stagename":"ASC Business Final Acknowledgement","lifecycleid":"L1400"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer","stageid":"LS1504","stagename":"Enterprise Governance Review","lifecycleid":"L1400"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer","stageid":"LS1505","stagename":"ASC Final Acknowledgement","lifecycleid":"L1400"],
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor","stageid":"LS1506","stagename":"ASC Committee Review","lifecycleid":"L1400"],
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor","stageid":"LS1507","stagename":"ASC Annual Review Approval","lifecycleid":"L1400"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users","stageid":"LS1507","stagename":"ASC Annual Review Approval","lifecycleid":"L1400"]
        
    ]
    
    static let accessGroupArray: [[String: AnyObject]] =
    [
        
        ["acessgroupid":"A1200", "accessgroupname":"Asc Requestor"],
        ["acessgroupid":"A1201", "accessgroupname":"Asc Legal SME"],
        ["acessgroupid":"A1202", "accessgroupname":"Asc Business Reviewer"],
        ["acessgroupid":"A1203", "accessgroupname":"Enterprise Goveranance Reviewer"],
        ["acessgroupid":"A1204", "accessgroupname":"All_Users"]
        
    ]
    
    
    static let userAccessGroupArray: [[String: AnyObject]] =
    
    [
        
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor", "userid":"U2300","username":"bpatel.usaa"],
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor", "userid":"U2301","username":"sodishio.intel"],
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor", "userid":"U2302","username":"ayyana.ms"],
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor", "userid":"U2303","username":"sada.ms"],
        ["accessgroupid":"A1200","accessgroupname":"Asc Requestor", "userid":"U2304","username":"sachee.ms"],
        ["accessgroupid":"A1201","accessgroupname":"Asc Legal SME", "userid":"U2305","username":"debra.usaa"],
        ["accessgroupid":"A1201","accessgroupname":"Asc Legal SME", "userid":"U2306","username":"manuel.bcie"],
        ["accessgroupid":"A1201","accessgroupname":"Asc Legal SME", "userid":"U2307","username":"reyesj.bcie"],
        ["accessgroupid":"A1201","accessgroupname":"Asc Legal SME", "userid":"U2308","username":"DMS_User1"],
        ["accessgroupid":"A1201","accessgroupname":"Asc Legal SME", "userid":"U2309","username":"DMS_User2"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer", "userid":"U2300","username":"bpatel.usaa"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer", "userid":"U2301","username":"sodishio.intel"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer", "userid":"U2302","username":"ayyana.ms"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer", "userid":"U2303","username":"sada.ms"],
        ["accessgroupid":"A1202","accessgroupname":"Asc Business Reviewer", "userid":"U2304","username":"sachee.ms"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer", "userid":"U2305","username":"debra.usaa"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer", "userid":"U2306","username":"manuel.bcie"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer", "userid":"U2307","username":"reyesj.bcie"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer", "userid":"U2308","username":"DMS_User1"],
        ["accessgroupid":"A1203","accessgroupname":"Enterprise Goveranance Reviewer", "userid":"U2309","username":"DMS_User2"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2300","username":"bpatel.usaa"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2301","username":"sodishio.intel"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2302","username":"ayyana.ms"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2303","username":"sada.ms"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2304","username":"sachee.ms"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2305","username":"debra.usaa"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2306","username":"manuel.bcie"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2307","username":"reyesj.bcie"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2308","username":"DMS_User1"],
        ["accessgroupid":"A1204","accessgroupname":"All_Users", "userid":"U2309","username":"DMS_User2"]

]
    
    static let routingTableData: [[String: AnyObject]] = [
    
    
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Request","stageid":"LS1500","routingstagename":"ASC Legal SME Review","routingstageid":"LS1501","actionname":"ASC Legal SME Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Request","stageid":"LS1500","routingstagename":"Withdraw","routingstageid":"0","actionname":"Withdraw"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Legal SME Review","stageid":"LS1501","routingstagename":"ASC Business Review","routingstageid":"LS1502","actionname":"ASC Business Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Legal SME Review","stageid":"LS1501","routingstagename":"ASC Request","routingstageid":"LS1500","actionname":"ASC Request"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Business Review","stageid":"LS1502","routingstagename":"ASC Legal SME Review","routingstageid":"LS1501","actionname":"ASC Legal SME Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Business Review","stageid":"LS1502","routingstagename":"ASC Business Final Acknowledgement","routingstageid":"LS1503","actionname":"ASC Business Final Acknowledgement"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Business Review","stageid":"LS1502","routingstagename":"ASC Request","routingstageid":"LS1501","actionname":"ASC Request"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Business Final Acknowledgement","stageid":"LS1503","routingstagename":"ASC Business Review","routingstageid":"LS1502","actionname":"ASC Business Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Business Final Acknowledgement","stageid":"LS1503","routingstagename":"Enterprise Governance Review","routingstageid":"LS1504","actionname":"Enterprise Governance Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"Enterprise Governance Review","stageid":"LS1504","routingstagename":"ASC Business Final Acknowledgement","routingstageid":"LS1503","actionname":"ASC Business Final Acknowledgement"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"Enterprise Governance Review","stageid":"LS1504","routingstagename":"ASC Final Acknowledgement","routingstageid":"LS1505","actionname":"ASC Final Acknowledgement"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"Enterprise Governance Review","stageid":"LS1504","routingstagename":"ASC Business Review","routingstageid":"LS1502","actionname":"ASC Business Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Final Acknowledgement","stageid":"LS1505","routingstagename":"Enterprise Governance Review","routingstageid":"LS1504","actionname":"Enterprise Governance Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Final Acknowledgement","stageid":"LS1505","routingstagename":"ÀSC Committee Review","routingstageid":"LS1506","actionname":"ÀSC Committee Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ÀSC Committee Review","stageid":"LS1506","routingstagename":"ASC Final Acknowledgement","routingstageid":"LS1505","actionname":"ASC Final Acknowledgement"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ÀSC Committee Review","stageid":"LS1506","routingstagename":"ASC Annual Review Approval","routingstageid":"LS1507","actionname":"ASC Annual Review Approval"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ÀSC Committee Review","stageid":"LS1506","routingstagename":"Withdraw","routingstageid":"0","actionname":"Withdraw"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Annual Review Approval","stageid":"LS1507","routingstagename":"ÀSC Committee Review","routingstageid":"LS1506","actionname":"ÀSC Committee Review"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Annual Review Approval","stageid":"LS1507","routingstagename":"Move To Production","routingstageid":"0","actionname":"Move To Production"],
        ["lifecyclename":"Audit Annual Review","lifecycleid":"1400","stagename":"ASC Annual Review Approval","stageid":"LS1507","routingstagename":"Withdraw","routingstageid":"0","actionname":"Withdraw"]

    
    
    ]
    
    
    
    
    static func insertRoutingTableData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "RoutingDetails")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in routingTableData{
            let entity = NSEntityDescription.entityForName("RoutingDetails", inManagedObjectContext: managedContext)
            let lifeccycle = RoutingDetails(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.lifecyclename = lifecycledict["lifecyclename"] as? String
            lifeccycle.lifecycleid = lifecycledict["lifecycleid"] as? String
            lifeccycle.stagename = lifecycledict["stagename"] as? String
            lifeccycle.stageid = lifecycledict["stageid"] as? String
            lifeccycle.routingstagename = lifecycledict["routingstagename"] as? String
            lifeccycle.routingstageid = lifecycledict["routingstageid"] as? String
            lifeccycle.actionname = lifecycledict["actionname"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }
    
    
    static func insertUserAccessGroupData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Users_AccessGroup")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in userAccessGroupArray{
            let entity = NSEntityDescription.entityForName("Users_AccessGroup", inManagedObjectContext: managedContext)
            let lifeccycle = Users_AccessGroup(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.accessgroupid = lifecycledict["accessgroupid"] as? String
            lifeccycle.accessgroupname = lifecycledict["accessgroupname"] as? String
            lifeccycle.userid = lifecycledict["userid"] as? String
            lifeccycle.username = lifecycledict["username"] as? String
            
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }



    static func insertAccessGroupData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "AccessGroup")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in accessGroupArray{
            let entity = NSEntityDescription.entityForName("AccessGroup", inManagedObjectContext: managedContext)
            let lifeccycle = AccessGroup(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.acessgroupid = lifecycledict["acessgroupid"] as? String
            lifeccycle.accessgroupname = lifecycledict["accessgroupname"] as? String
           
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }

    
    
    static func insertStageAccessGroupData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Stages_AccessGroup")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in stageAccessGroupArray{
            let entity = NSEntityDescription.entityForName("Stages_AccessGroup", inManagedObjectContext: managedContext)
            let lifeccycle = Stages_AccessGroup(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.accessgroupid = lifecycledict["accessgroupid"] as? String
            lifeccycle.accessgroupname = lifecycledict["accessgroupname"] as? String
            lifeccycle.stageid = lifecycledict["stageid"] as? String
            lifeccycle.stagename = lifecycledict["stagename"] as? String
            lifeccycle.lifecycleid = lifecycledict["lifecycleid"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }

    
    
    static func insertLifecycleAndStagesData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "LifeCycle_Stages")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in lifestagearray{
            let entity = NSEntityDescription.entityForName("LifeCycle_Stages", inManagedObjectContext: managedContext)
            let lifeccycle = LifeCycle_Stages(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.lifecycleid = lifecycledict["lifecycleid"] as? String
            lifeccycle.stageid = lifecycledict["stageid"] as? String
            lifeccycle.stagename = lifecycledict["stagename"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }

    
    
    static func insertLifeCycleAndCategorySampleData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Lifecycle_Category")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in lifecategoryarray{
            let entity = NSEntityDescription.entityForName("Lifecycle_Category", inManagedObjectContext: managedContext)
            let lifeccycle = Lifecycle_Category(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.categoryid = lifecycledict["categoryid"] as? String
            lifeccycle.categoryname = lifecycledict["categoryname"] as? String
            lifeccycle.lifecycleid = lifecycledict["lifecycleid"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }
    

    
    static func insertLifeCycleSampleData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "LifeCycle")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in lifecycle{
            let entity = NSEntityDescription.entityForName("LifeCycle", inManagedObjectContext: managedContext)
            let lifeccycle = LifeCycle(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let lifecycledict = dict as NSDictionary
            lifeccycle.lifecycleid = lifecycledict["lifecycleid"] as? String
            lifeccycle.lifecyclename = lifecycledict["lifecyclename"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }
    
    
    
    
    static func insertCategorySampleData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Category")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in categories{
            let entity = NSEntityDescription.entityForName("Category", inManagedObjectContext: managedContext)
            let category = Category(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let catdict = dict as NSDictionary
            category.categoryname = catdict["categoryname"] as? String
            category.categoryid = catdict["categoryid"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }
    
    
    
    static func insertUsersSampleData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Users")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in userdetailsArray{
            let entity = NSEntityDescription.entityForName("Users", inManagedObjectContext: managedContext)
            let newuser = Users(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let userdict = dict as NSDictionary
            newuser.id = userdict["id"] as? String
            newuser.username = userdict["username"] as? String
            newuser.firstname = userdict["firstname"] as? String
            newuser.lastname = userdict["lastname"] as? String
            newuser.password = userdict["password"] as? String
            newuser.role = userdict["role"] as? String
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }
    
    
    static func insertProductionDocsSampleData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "ProductionDocuments")
        //fetchRequest.predicate = NSPredicate(format: "searchkey != nil")
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        if count > 0{
            return
        }
        
        
        for dict in documentsArray{
            let entity = NSEntityDescription.entityForName("ProductionDocuments", inManagedObjectContext: managedContext)
            let newDoc = ProductionDocuments(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let docdict = dict as NSDictionary
            
            /*
             ["docid":"D3009","docname":"pqc-0265 PW Compliance Unsolicited Resume","docattachment":"","docversion":"1.2.0.0","docstatus":"Production","docowner":"sodishio.intel","doccreationdate":"17/11/2015","docdescription":"PW Compliance Unsolicited Resume","doceffectivedate":"17/11/2015","docnextreviewdate":"17/11/2016","lifecycle":"Audit Annual Review","categoryname":"Enterprise Governance","stageid":"-1","accessgroupid":"-1"]
            */
            
            newDoc.docid = docdict["docid"] as? String
            newDoc.docname = docdict["docname"] as? String
            let data = " ".dataUsingEncoding(NSUTF8StringEncoding)
            newDoc.docattachment  = data
            newDoc.docversion = docdict["docversion"] as? String
            newDoc.docstatus = docdict["docstatus"] as? String
            newDoc.docowner = docdict["docowner"] as? String
            
            let todaysDate:NSDate = NSDate()
            let dateFormatter:NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateFormat:String = dateFormatter.stringFromDate(todaysDate)
            let todayDate: NSDate = dateFormatter.dateFromString(dateFormat)!
            
            newDoc.doccreationdate = todayDate
            
            newDoc.docdescription = docdict["docdescription"] as? String
            
            
            let dateFormatter1:NSDateFormatter = NSDateFormatter()
            dateFormatter1.dateFormat = "dd/MM/yyyy"
            let dateString = docdict["doceffectivedate"] as? String
            let date = dateFormatter1.dateFromString(dateString!)
            newDoc.doceffectivedate = date
            
            let dateFormatter2:NSDateFormatter = NSDateFormatter()
            dateFormatter2.dateFormat = "dd/MM/yyyy"
            let dateString1 = docdict["docnextreviewdate"] as? String
            
            let date1 = dateFormatter2.dateFromString(dateString1!)
            newDoc.docnextreviewdate = date1
            
            newDoc.lifecycle = docdict["lifecycle"] as? String
            newDoc.categoryname = docdict["categoryname"] as? String
            
            newDoc.stageid = docdict["stageid"] as? String
            newDoc.accessgroupid = docdict["accessgroupid"] as? String
            
            
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("could not save because of error \(error.debugDescription)")
        }
    }
    
    
    
    static func getUserDetails(username: String) -> Users?{
        
        var currentUser: Users?
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Users")
        request.predicate = NSPredicate(format: "username = %@", username)
        
        do{
            let users = try managedContext.executeFetchRequest(request) as! [Users]
            currentUser = users.first!
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return currentUser
    }
    
    static func getDocsListForUserName(username: String) -> [ProductionDocuments]?{
        // var currentUser: Users?
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "ProductionDocuments")
        request.predicate = NSPredicate(format: "docowner = %@", username)
        
        do{
            let docs = try managedContext.executeFetchRequest(request) as! [ProductionDocuments]
            //currentUser = users.first!
            return docs
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return nil
    }
    
    static func getRoutingDetailsByPassingStageId(stageid: String) -> [RoutingDetails]?{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "RoutingDetails")
        request.predicate = NSPredicate(format: "stageid = %@", stageid)
        
        do{
            let routingDetails = try managedContext.executeFetchRequest(request) as! [RoutingDetails]
            //currentUser = users.first!
            return routingDetails
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return nil

    }
    
    
    //MARK: InsertData
    
    static func insertDataintoUsersTable(tableName: String, insertData: [[String: AnyObject]] ){
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName(tableName,inManagedObjectContext:managedContext)
        
        
        for eachDict in insertData{
            
            let newuser = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            for (key, value) in eachDict
            {
                //3
                newuser.setValue(value, forKey: key)
                
                
            }
            //4
            do {
                try managedContext.save()
                //5
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
            
        }
        
        
        
        
        
        
    }
    
    
    //MARK: GetData
    
    static func getDataFromTableAsList(tablename: String) -> [NSManagedObject] {
        
        var arrayResults = [NSManagedObject]()
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: tablename)
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            // self.users = results as! [NSManagedObject]
            arrayResults =  results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return arrayResults
    }
    

    
    
    static func getDataFromTableWithFilter(tableName: String,coloumnName: String, filterParameters: [String]) -> [NSManagedObject] {
        
        //var filteredResult: NSManagedObject?
        var arrayResults = [NSManagedObject]()
        
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: tableName)
        fetchRequest.returnsObjectsAsFaults = false;
        fetchRequest.predicate = NSPredicate(format: " \(coloumnName) IN %@", filterParameters)
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            arrayResults =  results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return arrayResults
        
    }
    //[NSPredicate predicateWithFormat:@"length > %@ AND name CONTAINS %@", @2.0f, @"Live"];
    //Compound predicate
    static func getDataFromTableWithFilterCompound(tableName: String,coloumnName: [String], filterParameters: [[String]]) -> [NSManagedObject] {
        
        //var filteredResult: NSManagedObject?
        var arrayResults = [NSManagedObject]()
        
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: tableName)
        fetchRequest.returnsObjectsAsFaults = false;
        fetchRequest.predicate = NSPredicate(format: " \(coloumnName[0]) IN %@ AND \(coloumnName[1]) CONTAINS %@ ", filterParameters[0],filterParameters[1])
    
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            arrayResults =  results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return arrayResults
        
    }

    
    
    
    static func getDataFromTableWithFilterContains(tableName: String,coloumnName: String, filterParameters: [String]) -> [NSManagedObject] {
        
        //var filteredResult: NSManagedObject?
        var arrayResults = [NSManagedObject]()
        
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: tableName)
        fetchRequest.returnsObjectsAsFaults = false;
        fetchRequest.predicate = NSPredicate(format: " \(coloumnName) CONTAINS[d] %@", filterParameters)
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            arrayResults =  results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return arrayResults
        
    }

    

    
    
    
    //MARK: DeleteData
    static func deleteDataAsBatchFromCordata(tableName: String)
    {
        let fetchRequest = NSFetchRequest()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        
        
        fetchRequest.entity = NSEntityDescription.entityForName(tableName, inManagedObjectContext: managedContext)
        fetchRequest.includesPropertyValues = false
        do {
            if let results = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                for result in results {
                    managedContext.deleteObject(result)
                }
                
                try managedContext.save()
            }
        } catch {
        }
    }
    
    
}
