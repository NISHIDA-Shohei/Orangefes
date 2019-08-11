//
//  ProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class ProgrammeViewController: UIViewController {
    
    @IBOutlet weak var ProgrammeTitle: UINavigationItem!
    @IBOutlet weak var ProgrammeDescription: UITextView!
    @IBOutlet weak var ProgrammePicture: UIImageView!
    
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var StatusTitle: UILabel!
    
    var ProgrammeReceiveData: String = ""
    var ProgrammePictureReceiveData: String = ""
    var ProgrammeDescriptionReceiveData: String = ""
    
    let ref = Database.database().reference()
    
    let Performance: [String] = ["応援部", "ダンス部","弦楽部","合気道部","ゴスペル部","英語部","有志演劇","軽音楽部","吹奏楽部"]
    
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
        ProgrammePicture.image = UIImage(named: ProgrammePictureReceiveData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if Performance.contains(ProgrammeReceiveData) {
            StatusLabel.textColor = UIColor.white
            StatusTitle.textColor = UIColor.white
            
        } else {
            let refData = Database.database().reference().child("団体状況").child(ProgrammeReceiveData)
            refData.observe(.value, with: { [weak self](snapshot) -> Void in
                
                let status = String(describing: snapshot.childSnapshot(forPath: "Status").value!)
                
                if status == "<null>" {
                    self?.StatusLabel.text = "データなし"
                } else {
                    self?.StatusLabel.text = status
                }
                
            })
            
        }
        
        
        
    }
}





