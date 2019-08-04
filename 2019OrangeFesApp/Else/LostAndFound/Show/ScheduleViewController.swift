//
//  ScheduleViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var LostAndFoundDescription: UITextView!
    @IBOutlet weak var LostAndFoundTitle: UINavigationItem!
    

    var LostAndFoundDescriptionData: String = "test"
    
    var receiveData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        LostAndFoundDescription.layer.borderColor = UIColor.orange.cgColor
        
        // 枠の幅
        LostAndFoundDescription.layer.borderWidth = 1.0
        
        // 枠を角丸にする場合
        LostAndFoundDescription.layer.cornerRadius = 10.0
        LostAndFoundDescription.layer.masksToBounds = true
        
        LostAndFoundTitle.title = receiveData
        
        LostAndFoundDescription.text = LostAndFoundDescriptionData
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

