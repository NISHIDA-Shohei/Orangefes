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
        //navigationBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 204/255, alpha: 1.0)
        navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.5748199821, blue: 0, alpha: 1)
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        navigationBar.tintColor = UIColor.white//(red: 51/255, green: 204/255, blue: 255/255, alpha: 1.0)
        // ナビゲーションバーのテキストを変更する
        navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

    }
}
