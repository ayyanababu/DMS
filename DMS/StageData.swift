//
//  StageData.swift
//  DMS
//
//  Created by Raja Ayyan on 19/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import Foundation

class StageData{
    
    var stageName: String?
    var stageUsers: [Users]?
    
    init(stageName: String, stageUsers: [Users]){
        self.stageName = stageName
        self.stageUsers = stageUsers
    }
}
