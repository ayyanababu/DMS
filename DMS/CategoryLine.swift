//
//  CategoryLine.swift
//  DMS
//
//  Created by Raja Ayyan on 18/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import Foundation

class CategoryLine
{
    
    var category: Category?
    var documents: [ProductionDocuments]?
    
    init(category: Category, documents: [ProductionDocuments]){
        
        self.category = category
        self.documents = documents
    }
    
    
}
