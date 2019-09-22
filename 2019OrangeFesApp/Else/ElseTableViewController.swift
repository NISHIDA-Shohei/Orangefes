//
//  ElseTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/03.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ElseTableViewController: UITableViewController {

    // cellのlabelに書く文字列
    let Else1: [String] = ["法政国際高校ホームページ", "公式Instagram"]
    let Else2: [String] = ["校長より", "委員長より","議長より", "副委員長より"]
    let Else2Number: [Int] = [0,1,2,3]
    let Else3: [String] = ["オレンジ祭実行委員会","クレジット","ログイン"]
    let Else4: [String] = ["利用規約","プライバシーポリシー"]
    let Else5: [String] = ["落し物一覧","来場者アンケート","お問い合わせ"]

    
    // 遷移先のViewControllerに渡す変数
    var giveElseData: String = ""
    var giveStaffImage: String = ""
    var giveGreetingNumber: Int = 0
    var giveAgreementData:String = ""
    
    //admob
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4195103882736205/5671880921"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        loadFooter()
        
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        view.tintColor = UIColor(red: 255/255, green: 153/255, blue: 255/255, alpha: 0.7)
        //view.tintColor = UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 0.7)
        //labelの文字
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Else1.count
        } else if section == 1 {
            return Else2.count
        } else if section == 2 {
            return Else3.count
        } else if section == 3 {
            return Else4.count
        } else if section == 4 {
            return Else5.count
        } else {
            return 0
        }
    }
    
    
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // sectionに載せる文字列を返す関数
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var ElseSectionName: String = "設定されていません"
        
        if section == 0 {
            ElseSectionName = "公式"
        }else if section == 1 {
            ElseSectionName = "ご挨拶"
        }else if section == 2{
            ElseSectionName = "スタッフ"
        }else if section == 3{
            ElseSectionName = "このアプリについて"
        }else{
            ElseSectionName = "お問い合わせ"
        }
        return ElseSectionName
    }
    
    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElseTableViewCell", for: indexPath) as! ElseTableViewCell
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // ここでcellのlabelに値を入れています。//ここに新たな文字をい入れる
        if indexPath.section == 0 {
            cell.ElseName.text = Else1[indexPath.item]
        } else if indexPath.section == 1 {
            cell.ElseName.text = Else2[indexPath.item]
        } else if indexPath.section == 2 {
            cell.ElseName.text = Else3[indexPath.item]
        } else if indexPath.section == 3 {
            cell.ElseName.text = Else4[indexPath.item]
        } else if indexPath.section == 4 {
            cell.ElseName.text = Else5[indexPath.item]
        }
        return cell
    }
    
    
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url1 = URL(string: "https://kokusai-high.ws.hosei.ac.jp")!
        let url2 = URL(string: "https://www.instagram.com/2019orangefes/")!
        let url3 = URL(string: "https://forms.gle/FNqKq6VhnhYQdHKn6")!
        let url4 = URL(string: "https://forms.gle/kejw7gb7R72pzjPt9")!
        
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        if indexPath.section == 0 {
            giveElseData = Else1[indexPath.item]
            if indexPath.row == 0 {
                UIApplication.shared.open(url1)
            } else {
                UIApplication.shared.open(url2)
            }
        } else if indexPath.section == 1{
            giveGreetingNumber = Else2Number[indexPath.row]
            performSegue(withIdentifier: "GreetingSegue", sender: nil)
            
        } else if indexPath.section == 2{
            if indexPath.row == 0 {
                giveElseData = Else3[indexPath.item]
                giveStaffImage = "Staff.png"
                performSegue(withIdentifier: "StaffSegue", sender: nil)
            } else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "CreditSegue", sender: nil)
            } else {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                
            }
        } else if indexPath.section == 3{
            if indexPath.row == 0 {
                performSegue(withIdentifier: "AgreementSegue", sender: nil)
            } else {
                performSegue(withIdentifier: "PolicySegue", sender: nil)
            }
            
        } else if indexPath.section == 4{
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "LostAndFoundSegue", sender: nil)
            } else if indexPath.row == 1 {
                UIApplication.shared.open(url3)
            } else {
                UIApplication.shared.open(url4)
            }
        }

    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StaffSegue" {
            let vc = segue.destination as! StaffViewController
            vc.StaffTitleData = giveElseData
            vc.StaffImageData = giveStaffImage
        } else if segue.identifier == "GreetingSegue" {
            let vc = segue.destination as! ElseGreetingViewController
            vc.GreetingNumber = giveGreetingNumber
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
    
    func loadFooter(){
        let footerCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableFooterCell")!
        let footerView: UIView = footerCell.contentView
        tableView.tableFooterView = footerView
    }
    
}
