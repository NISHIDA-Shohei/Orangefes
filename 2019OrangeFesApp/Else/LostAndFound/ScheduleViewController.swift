//
//  ScheduleViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var PerformanceDescription: UITextView!
    @IBOutlet weak var PerformanceTitle: UINavigationItem!
    

    var PerformanceDescriptionReceiveData: String = ""
    
    var receiveData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        PerformanceDescription.layer.borderColor = UIColor.orange.cgColor
        
        // 枠の幅
        PerformanceDescription.layer.borderWidth = 1.0
        
        // 枠を角丸にする場合
        PerformanceDescription.layer.cornerRadius = 10.0
        PerformanceDescription.layer.masksToBounds = true
        
        PerformanceTitle.title = receiveData
        
        PerformanceDescription.text = PerformanceDescriptionReceiveData
    }
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

