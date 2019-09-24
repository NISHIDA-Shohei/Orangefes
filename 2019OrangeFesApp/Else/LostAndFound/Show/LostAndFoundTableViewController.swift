//
//  LostAndFoundTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/04.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds

class LostAndFoundTableViewController: UITableViewController {

    var LostNameList: [String] = []
    var LostPlaceList: [String] = []
    var LostKeyList: [String] = []
    
    var LostNameGiveData: String = ""
    var LostKeyGiveData: String = ""
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        let refData = Database.database().reference().child("落し物一覧")
        refData.observe(.childAdded, with: { [weak self](snapshot) -> Void in
            
            let name = String(describing: snapshot.childSnapshot(forPath: "LostName").value!)
            let place = String(describing: snapshot.childSnapshot(forPath: "LostPlace").value!)
            let key = String(describing: snapshot.childSnapshot(forPath: "LostNameKey").value!)
            
            if self!.LostKeyList.contains(key){
                //何もしない
            } else {
                self?.LostNameList.append(name)
                self?.LostPlaceList.append(place)
                self?.LostKeyList.append(key)
            }
            self?.tableView.reloadData()
        })
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LostNameList.count
    }
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    // sectionに載せる文字列を返す関数
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "落し物一覧"
    }
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        view.tintColor = UIColor(red: 102/255, green: 255/255, blue: 220/255, alpha: 0.7)
        let header = view as! UITableViewHeaderFooterView
        //labelの文字
        header.textLabel?.textColor = UIColor.black
    }
    
    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LostAndFoundTableViewCell", for: indexPath) as! LostAndFoundTableViewCell
        
        //cellに右矢印を追加する
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // ここでcellのlabelに値を入れています。//ここに新たな文字をい入れる
        cell.LostNameLabel.text = LostNameList[indexPath.item]
        cell.LostPlaceLabel.text = LostPlaceList[indexPath.item]
        
        return cell
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        LostNameGiveData = LostNameList[indexPath.row]
        LostKeyGiveData = LostKeyList[indexPath.row]
        
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "LostAndFoundSegue", sender: nil)
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LostAndFoundSegue" {
            let vc = segue.destination as! LostAndFoundViewController
            vc.LostNameReceiveData = LostNameGiveData
            vc.LostKeyReceiveData = LostKeyGiveData
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
