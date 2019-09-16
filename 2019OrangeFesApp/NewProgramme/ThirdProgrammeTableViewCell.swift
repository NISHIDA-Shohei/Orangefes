//
//  ThirdProgrammeTableViewCell.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/12.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ThirdProgrammeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var PerformancePicture: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var PerformanceView: UIView!
    @IBOutlet weak var PerformanceTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PerformanceView.layer.cornerRadius = 10
        PerformancePicture.layer.cornerRadius = 40
        
        //画像の枠線の変更
        PerformancePicture.layer.borderColor = UIColor.gray.cgColor
        PerformancePicture.layer.borderWidth = 0.6
        
        PerformancePicture.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        // 影の方向（width=右方向、height=下方向、CGSize.zero=方向指定なし）
        //PerformanceView.layer.shadowOffset = CGSize(width: 2, height: 4)
        // 影の色
        //PerformanceView.layer.shadowColor = UIColor.black.cgColor
        // 影の濃さ
        //PerformanceView.layer.shadowOpacity = 0.25
        // 影をぼかし
        //PerformanceView.layer.shadowRadius = 2
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
