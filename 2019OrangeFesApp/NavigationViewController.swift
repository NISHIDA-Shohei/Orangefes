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
        navigationBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 204/255, alpha: 1.0)
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        navigationBar.tintColor = UIColor(red: 51/255, green: 204/255, blue: 255/255, alpha: 1.0)
        // ナビゲーションバーのテキストを変更する
        navigationBar.titleTextAttributes = [
            // 文字の色
.foregroundColor: UIColor.black
        ]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
