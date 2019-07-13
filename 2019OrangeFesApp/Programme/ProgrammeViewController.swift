//
//  ProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ProgrammeViewController: UIViewController {
    
    @IBOutlet weak var ProgrammeTitle: UINavigationItem!
    @IBOutlet weak var ProgrammeDescription: UITextView!
    
    var ProgrammeReceiveData: String = ""
    
    var ProgrammeDescriptionReceiveData: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        ProgrammeDescription.layer.borderColor = UIColor.orange.cgColor
        
        // 枠の幅
        ProgrammeDescription.layer.borderWidth = 1.0
        
        // 枠を角丸にする場合
       ProgrammeDescription.layer.cornerRadius = 10.0
       ProgrammeDescription.layer.masksToBounds = true
        

        
        
        
        ProgrammeDescription.text = ProgrammeDescriptionReceiveData
        
        
        ProgrammeTitle.title = ProgrammeReceiveData
    }
    
    
    
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




