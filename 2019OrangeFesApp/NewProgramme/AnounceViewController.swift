//
//  AnounceViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/25.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class AnounceViewController: UIViewController {
    
    @IBOutlet weak var AnounceView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        AnounceView.layer.cornerRadius = 10
        
        // 影の方向（width=右方向、height=下方向、CGSize.zero=方向指定なし）
        AnounceView.layer.shadowOffset = CGSize.zero
        // 影の色
        AnounceView.layer.shadowColor = UIColor.black.cgColor
        // 影の濃さ
        AnounceView.layer.shadowOpacity = 0.4
        // 影をぼかし
        AnounceView.layer.shadowRadius = 8
        
    }
}
