//
//  ScheduleTableViewCell.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var LostNameLabel: UILabel!
    @IBOutlet weak var LostPlaceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
