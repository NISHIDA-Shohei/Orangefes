//
//  StatusTableViewCell.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/11.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
