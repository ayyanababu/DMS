//
//  Users+CoreDataProperties.swift
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

extension Users {

    @NSManaged var firstname: String?
    @NSManaged var id: String?
    @NSManaged var lastname: String?
    @NSManaged var password: String?
    @NSManaged var role: String?
    @NSManaged var username: String?
    @NSManaged var documentslist: NSOrderedSet?

}
