//
//  FavoriteTableViewCell.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/06.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var FavoriteNameLabel: UILabel!
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var FavoritePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
