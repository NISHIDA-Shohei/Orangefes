//
//  ProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds

class ProgrammeViewController: UIViewController {
    
    @IBOutlet weak var ProgrammeTitle: UINavigationItem!
    @IBOutlet weak var ProgrammeDescription: UITextView!
    @IBOutlet weak var ProgrammePicture: UIImageView!
    
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var StatusTitle: UILabel!
    
    let map11Programme: [String] = ["茶道部","華道部","漫画広報部","図書委員会"]
    let map21Programme: [String] = ["すいーと♡えんじぇる", "BEES","ちゅるちゅるらんど","トッポギ","硬式テニス部３年","お化け屋敷","ドーナツショップ","ゆっかいず","家庭科部"]
    let map22Programme: [String] = [ "１年C組","１年H組","放送部","硬式テニス部１・２年","バレー部","Cafe in The Daytime","法政国際２年男子","1年D組"]
    let map23Programme: [String] = ["１年G組", "あなたとコンビに法政チーズ","１年E組","アメリカンドッグ"]
    let map31Programme: [String] = ["ゴスペル部","英語部","有志演劇"]
    let map32Programme: [String] = ["美術部"]
    let map42Programme: [String] = ["食堂"]
    let map43Programme: [String] = ["バドミントン部","RESISTANCE","有志ダンス","同窓会","PTAバザー"]
    let map44Programme: [String] = ["入試相談室"]
    
    // 遷移先のMapViewControllerに渡す変数
    var giveData: String = ""
    var giveMap: String = ""
    
    var ProgrammeReceiveData: String = ""
    var ProgrammePictureReceiveData: String = ""
    var ProgrammeDescriptionReceiveData: String = ""
    
    let ref = Database.database().reference()
    
    let Performance: [String] = ["応援部", "ダンス部","弦楽部","合気道部","ゴスペル部","英語部","有志演劇","軽音楽部","吹奏楽部"]
    
    //admob
    var bannerView: GADBannerView!
    
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
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4195103882736205/5671880921"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
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
    
    
    @IBAction func ShowMap(_ sender: Any) {
        if map11Programme.contains(ProgrammeReceiveData) {
            giveMap = "11.png"
            giveData = "1号館　1階"
        } else if map21Programme.contains(ProgrammeReceiveData) {
            giveMap = "21.png"
            giveData = "2号館　1階"
        } else if map22Programme.contains(ProgrammeReceiveData) {
            giveMap = "22.png"
            giveData = "2号館　2階"
        } else if map23Programme.contains(ProgrammeReceiveData) {
            giveMap = "23.png"
            giveData = "2号館　3階"
        } else if map31Programme.contains(ProgrammeReceiveData) {
            giveMap = "31.png"
            giveData = "3号館　1階"
        } else if map32Programme.contains(ProgrammeReceiveData) {
            giveMap = "32.png"
            giveData = "3号館　2階"
        } else if map42Programme.contains(ProgrammeReceiveData) {
            giveMap = "42.png"
            giveData = "4号館　2階"
        } else if map43Programme.contains(ProgrammeReceiveData) {
            giveMap = "43.png"
            giveData = "4号館　3階"
        } else if map44Programme.contains(ProgrammeReceiveData) {
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
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
}





