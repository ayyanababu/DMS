//
//  DetailTableViewCell.swift
//  DMS
//
//  Created by Raja Ayyan on 10/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var cellActionButton: UIButton!
    @IBOutlet weak var detailCellImageView: UIImageView!
    
    func configureVeiw(){
        self.detailCellImageView.layer.cornerRadius = self.detailCellImageView.frame.size.width / 2
        self.detailCellImageView.clipsToBounds = true
        self.detailCellImageView.layer.borderWidth = 3.0
        self.detailCellImageView.layer.borderColor = UIColor(red: 32/255, green: 173/255, blue: 82/255, alpha: 1.0).CGColor

    }
    

}
