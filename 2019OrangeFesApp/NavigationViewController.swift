//
//  NavigationViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/10.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    // MyUINavigationController.class
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //　ナビゲーションバーの背景色
        navigationBar.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0)
        
        
        navigationBar.barTintColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1)
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        
        navigationBar.tintColor = UIColor.white
        
        
        
        // ナビゲーションバーのテキストを変更する
        navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

    }
}
