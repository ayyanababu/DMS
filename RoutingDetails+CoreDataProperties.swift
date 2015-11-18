//
//  RoutingDetails+CoreDataProperties.swift
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

extension RoutingDetails {

    @NSManaged var actionname: String?
    @NSManaged var lifecycleid: String?
    @NSManaged var lifecyclename: String?
    @NSManaged var routingstageid: String?
    @NSManaged var routingstagename: String?
    @NSManaged var stageid: String?
    @NSManaged var stagename: String?

}
