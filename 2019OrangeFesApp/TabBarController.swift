//
//  TabBarController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタマイズ
        // アイコンの色
        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 153/255, blue: 255/255, alpha: 1.0) // yellow
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0/255, green: 153/255, blue: 153/255, alpha: 1.0)
        
    }

    

}
