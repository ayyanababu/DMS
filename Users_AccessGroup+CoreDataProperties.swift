//
//  Users_AccessGroup+CoreDataProperties.swift
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

extension Users_AccessGroup {

    @NSManaged var accessgroupid: String?
    @NSManaged var accessgroupname: String?
    @NSManaged var userid: String?
    @NSManaged var username: String?

}
