//
//  ProductionDocuments+CoreDataProperties.swift
//  DMS
//
//  Created by Raja Ayyan on 18/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ProductionDocuments {

    @NSManaged var categoryname: String?
    @NSManaged var docattachment: NSData?
    @NSManaged var doccreationdate: NSDate?
    @NSManaged var docdescription: String?
    @NSManaged var doceffectivedate: NSDate?
    @NSManaged var docid: String?
    @NSManaged var docname: String?
    @NSManaged var docnextreviewdate: NSDate?
    @NSManaged var docowner: String?
    @NSManaged var docstatus: String?
    @NSManaged var docversion: String?
    @NSManaged var lifecycle: String?
    @NSManaged var userid: String?
    @NSManaged var userslist: NSOrderedSet?

}
