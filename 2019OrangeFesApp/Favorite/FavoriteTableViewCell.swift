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
    @IBOutlet weak var FavoriteView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FavoriteView.layer.cornerRadius = 10
        FavoritePicture.layer.cornerRadius = 10
        FavoritePicture.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        FavoritePicture.layer.borderColor = UIColor.gray.cgColor
        FavoritePicture.layer.borderWidth = 0.8
        
        // 影の方向（width=右方向、height=下方向、CGSize.zero=方向指定なし）
        FavoriteView.layer.shadowOffset = CGSize(width: 2, height: 4)
        // 影の色
        FavoriteView.layer.shadowColor = UIColor.black.cgColor
        // 影の濃さ
        FavoriteView.layer.shadowOpacity = 0.25
        // 影をぼかし
        FavoriteView.layer.shadowRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
