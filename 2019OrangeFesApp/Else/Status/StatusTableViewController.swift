//
//  StatusTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/11.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class StatusTableViewController: UITableViewController {
    // cellのlabelに書く文字列
    //1=1号館 2=2号館 3=3号館 4=4号館 5=オレンジの間前
    let ProgrammeName1: [String] = ["漫画広報部","華道部","茶道部"]
    let ProgrammeName2: [String] = ["ゆっかいず","ドーナツショップ","お化け屋敷","ちゅるちゅるらんど","硬式テニス部３年","BEES","トッポギ","すいーと♡えんじぇる","起業家クラス","法政国際２年男子","Cafe in The Daytime","バレー部","硬式テニス部１・２年","放送部","１年H組","１年C組","図書委員会","アメリカンドッグ","１年E組","あなたとコンビに法政チーズ","１年G組"]
    let ProgrammeName3: [String] = ["家庭科部","美術部",]
    let ProgrammeName4: [String] = ["バドミントン部","RESISTANCE","有志ダンス","同窓会","PTAバザー","入試相談室"]
    let ProgrammeName5: [String] = ["太田屋","一の会","ベル　エポック","MARION CREPES","食堂"]
    
    
    func reload() {
        tableView.reloadData()
    }
    
    // 遷移先のViewControllerに渡す変数
    var ProgrammeGiveData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //リロードする
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    // cellの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return ProgrammeName1.count
        } else if section == 1 {
            return ProgrammeName2.count
        } else if section == 2 {
            return ProgrammeName3.count
        } else if section == 3{
            return ProgrammeName4.count
        } else if section == 4{
            return ProgrammeName5.count
        } else {
        return 0
        }
    }
    
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        view.tintColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 0.7)
        let header = view as! UITableViewHeaderFooterView
        //labelの文字の色
        header.textLabel?.textColor = UIColor.black
    }
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // sectionに載せる文字列を返す関数
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //sectionの日付
        let sectionNumber = section
        var sectionPlace: String = ""
        if sectionNumber == 0 {
            sectionPlace = "1号館"
        } else if sectionNumber == 1 {
            sectionPlace = "2号館"
        } else if sectionNumber == 2 {
            sectionPlace = "3号館"
        } else if sectionNumber == 3 {
            sectionPlace = "4号館"
        } else if sectionNumber == 4 {
            sectionPlace = "オレンジの間前・食堂"
        }
        return "\(sectionPlace)"
    }
    
    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProgrammeCell = tableView.dequeueReusableCell(withIdentifier: "StatusTableViewCell", for: indexPath as IndexPath) as! StatusTableViewCell
        //cellに右矢印を追加する
        ProgrammeCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        // ここでcellのlabelに値を入れています。
            if indexPath.section == 0 {
                ProgrammeCell.name.text = ProgrammeName1[indexPath.item]
                
            } else if indexPath.section == 1 {
                ProgrammeCell.name.text = ProgrammeName2[indexPath.item]
                
            } else if indexPath.section == 2 {
                ProgrammeCell.name.text = ProgrammeName3[indexPath.item]
                
            } else if indexPath.section == 3 {
                ProgrammeCell.name.text = ProgrammeName4[indexPath.item]
                
            } else if indexPath.section == 4 {
                ProgrammeCell.name.text = ProgrammeName5[indexPath.item]
                
            }
        return ProgrammeCell
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
            if indexPath.section == 0 {
                ProgrammeGiveData = ProgrammeName1[indexPath.item]
                performSegue(withIdentifier: "StatusSegue", sender: nil)
                
            } else if indexPath.section == 1 {
                ProgrammeGiveData = ProgrammeName2[indexPath.item]
                performSegue(withIdentifier: "StatusSegue", sender: nil)
                
            } else if indexPath.section == 2 {
                ProgrammeGiveData = ProgrammeName3[indexPath.item]
                performSegue(withIdentifier: "StatusSegue", sender: nil)
                
            } else if indexPath.section == 3 {
                ProgrammeGiveData = ProgrammeName4[indexPath.item]
                performSegue(withIdentifier: "StatusSegue", sender: nil)
                
            } else if indexPath.section == 4 {
                ProgrammeGiveData = ProgrammeName5[indexPath.item]
                performSegue(withIdentifier: "StatusSegue", sender: nil)
            }
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StatusSegue" {
            let vc = segue.destination as! StatusViewController
            vc.ProgrammeReceiveData = ProgrammeGiveData
        }
    }
    
}
