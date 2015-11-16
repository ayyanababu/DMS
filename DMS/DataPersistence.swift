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
                //self.users.append(user)
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
    
    
    static func getDataFromTableWithFilter(tableName: String, filterParameter: String) -> [NSManagedObject] {
        
        //var filteredResult: NSManagedObject?
        var arrayResults = [NSManagedObject]()

        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: tableName)
        fetchRequest.returnsObjectsAsFaults = false;
        fetchRequest.predicate = NSPredicate(format: "username = %@", filterParameter)
        
        
        
        
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
