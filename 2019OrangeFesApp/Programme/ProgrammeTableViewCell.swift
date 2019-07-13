//
//  ProgrammeTableViewCell.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ProgrammeTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ProgrammePicture: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

