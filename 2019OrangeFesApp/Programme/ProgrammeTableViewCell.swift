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
    @IBOutlet weak var ProgrammeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ProgrammeView.layer.cornerRadius = 10
        ProgrammePicture.layer.cornerRadius = 10
        ProgrammePicture.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        // 影の方向（width=右方向、height=下方向、CGSize.zero=方向指定なし）
        ProgrammeView.layer.shadowOffset = CGSize(width: 2, height: 4)
        // 影の色
        ProgrammeView.layer.shadowColor = UIColor.black.cgColor
        // 影の濃さ
        ProgrammeView.layer.shadowOpacity = 0.25
        // 影をぼかし
        ProgrammeView.layer.shadowRadius = 5
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}

