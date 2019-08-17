//
//  FavoriteViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/06.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var FavoriteTitle: UINavigationItem!
    @IBOutlet weak var FavoriteDescriptionText: UITextView!
    @IBOutlet weak var FavoritePicture: UIImageView!
    
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var StatusTitle: UILabel!
    
    let map11Programme: [String] = ["茶道部","華道部","漫画広報部","図書委員会"]
    let map21Programme: [String] = ["すいーと♡えんじぇる", "BEES","ちゅるちゅるらんど","トッポギ","硬式テニス部３年","お化け屋敷","ドーナツショップ","ゆっかいず"]
    let map22Programme: [String] = ["１年D組", "１年C組","１年H組","放送部","硬式テニス部１・２年","バレー部","Cafe in The Daytime","法政国際２年男子"]
    let map23Programme: [String] = ["１年G組", "あなたとコンビに法政チーズ","１年E組","アメリカンドッグ"]
    let map31Programme: [String] = ["家庭科部","ゴスペル部","英語部","有志演劇"]
    let map32Programme: [String] = ["美術部"]
    let map42Programme: [String] = ["食堂"]
    let map43Programme: [String] = ["バドミントン部","RESISTANCE","有志ダンス","同窓会","PTAバザー"]
    let map44Programme: [String] = ["入試相談室"]
    
    // 遷移先のMapViewControllerに渡す変数
    var giveData: String = ""
    var giveMap: String = ""
    
    let Performance: [String] = ["応援部", "ダンス部","弦楽部","合気道部","ゴスペル部","英語部","有志演劇","軽音楽部","吹奏楽部"]
 
    var receiveData: String = ""
    var receiveDescriptionData: String = ""
    var receivePictureStringData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        FavoriteDescriptionText.layer.borderColor = UIColor.orange.cgColor
        // 枠の幅
        FavoriteDescriptionText.layer.borderWidth = 1.0
        // 枠を角丸にする場合
        FavoriteDescriptionText.layer.cornerRadius = 10.0
        FavoriteDescriptionText.layer.masksToBounds = true
        
        FavoriteDescriptionText.text = receiveDescriptionData
        FavoriteTitle.title = receiveData
        FavoritePicture.image = UIImage(named: receivePictureStringData)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if Performance.contains(receiveData) {
            StatusLabel.textColor = UIColor.white
            StatusTitle.textColor = UIColor.white
            
        } else {
            let refData = Database.database().reference().child("団体状況").child(receiveData)
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
    
    @IBAction func ShowMap(_ sender: Any) {
        if map11Programme.contains(receiveData) {
            giveMap = "11.png"
            giveData = "1号館　1階"
        } else if map21Programme.contains(receiveData) {
            giveMap = "21.png"
            giveData = "2号館　1階"
        } else if map21Programme.contains(receiveData) {
            giveMap = "21.png"
            giveData = "2号館　1階"
        } else if map22Programme.contains(receiveData) {
            giveMap = "22.png"
            giveData = "2号館　2階"
        } else if map23Programme.contains(receiveData) {
            giveMap = "23.png"
            giveData = "2号館　3階"
        } else if map31Programme.contains(receiveData) {
            giveMap = "31.png"
            giveData = "3号館　1階"
        } else if map32Programme.contains(receiveData) {
            giveMap = "32.png"
            giveData = "3号館　2階"
        } else if map42Programme.contains(receiveData) {
            giveMap = "42.png"
            giveData = "4号館　2階"
        } else if map43Programme.contains(receiveData) {
            giveMap = "43.png"
            giveData = "4号館　3階"
        } else if map44Programme.contains(receiveData) {
            giveMap = "44.png"
            giveData = "4号館　4階"
        } else {
            giveMap = "SchoolMap1.jpg"
            giveData = "全体"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapSegue" {
            let vc = segue.destination as! MapViewController
            vc.receiveData = giveData
            vc.receiveMap = giveMap
        }
    }
}
