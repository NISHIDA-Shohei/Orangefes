//
//  FirstProgrammeTableViewCell.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class FirstProgrammeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ProgrammePicture: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var ProgrammeView: UIView!
    @IBOutlet weak var ProgrammeGenre: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ProgrammeView.layer.cornerRadius = 10
        ProgrammePicture.layer.cornerRadius = 10
        ProgrammePicture.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        ProgrammePicture.layer.borderColor = UIColor.gray.cgColor
        ProgrammePicture.layer.borderWidth = 0.8
        // 影の方向（width=右方向、height=下方向、CGSize.zero=方向指定なし）
        ProgrammeView.layer.shadowOffset = CGSize(width: 2, height: 4)
        // 影の色
        ProgrammeView.layer.shadowColor = UIColor.black.cgColor
        // 影の濃さ
        ProgrammeView.layer.shadowOpacity = 0.25
        // 影をぼかし
        ProgrammeView.layer.shadowRadius = 4
        
        ProgrammeGenre.layer.cornerRadius = 3
        ProgrammeGenre.layer.borderColor = UIColor.gray.cgColor
        ProgrammeGenre.layer.borderWidth = 0.8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
