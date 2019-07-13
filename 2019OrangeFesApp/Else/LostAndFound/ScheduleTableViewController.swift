//
//  ScheduleTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class ScheduleTableViewController: UITableViewController {

    // cellのlabelに書く文字列
    var LostName: [String] = []
    var LostPlace: [String] = []

    // 遷移先のViewControllerに渡す変数
    var giveData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LostPlace = []
        LostName = []
        let refData = Database.database().reference().child("ExploreFolders")
        refData.observe(.childAdded, with: { [weak self](snapshot) -> Void in
            
            let name = String(describing: snapshot.childSnapshot(forPath: "Name").value!)
            let place = String(describing: snapshot.childSnapshot(forPath: "Place").value!)
            
            //改善点
            if self!.LostName.contains(name){
                
            } else {
                self?.LostName.append(name)
                self?.LostPlace.append(place)
            }
            //重要！！
            self?.tableView.reloadData()
        })
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LostName.count
    }
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
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
    
    // cellの情報を書き込む関数**********************************************************************************
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleTableViewCell", for: indexPath) as! ScheduleTableViewCell
        
        //cellに右矢印を追加する
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // ここでcellのlabelに値を入れています。//ここに新たな文字をい入れる
        cell.LostNameLabel.text = LostName[indexPath.item]
        cell.LostPlaceLabel.text = LostPlace[indexPath.item]

        return cell
    }
    //******************************************************************************************************
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
            giveData = LostName[indexPath.item]

        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "ScheduleSegue", sender: nil)
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ScheduleSegue" {
            let vc = segue.destination as! ScheduleViewController
            vc.receiveData = giveData
        }
    }
    
}
