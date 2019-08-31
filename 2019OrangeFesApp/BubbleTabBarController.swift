//
//  BubbleTabBarController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/29.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//
import UIKit
import BubbleTabBar

class BubbleTabBarController: UITabBarController {

    @IBOutlet weak var TabBar: BubbleTabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TabBar.self = delegate as? BubbleTabBar
        

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
