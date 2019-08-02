//
//  FavoriteTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/06.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    
    var userDefaults = UserDefaults.standard
    
    var FavoriteName: [String] = []
    var FavoritePerformanceName: [String] = []
    var FavoriteProgrammeDescription: [String] = []
    var FavoritePerformanceDescription: [String] = []
    var FavoriteProgrammePictureString: [String] = []
    var FavoritePerformancePictureString: [String] = []

    var giveData = ""
    var giveDescriptionData = ""
    var givePictureStringData = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //UDProgrammeNameKeyから情報を取得
        let getFavoriteName:[String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
        FavoriteName = getFavoriteName
        //UDPerformanceNameKeyから情報を取得
        let getFavoritePerformanceName:[String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        FavoritePerformanceName = getFavoritePerformanceName
        
        let getFavoriteProgrammeDescription:[String] = userDefaults.array(forKey: "UDProgrammeDescriptionKey") as? [String] ?? []
        FavoriteProgrammeDescription = getFavoriteProgrammeDescription
        
        let getFavoritePerformanceDescription:[String] = userDefaults.array(forKey: "UDPerformanceDescriptionKey") as? [String] ?? []
        FavoritePerformanceDescription = getFavoritePerformanceDescription
        
        let getProgrammePictureString:[String] = userDefaults.array(forKey: "UDProgrammePictureKey") as? [String] ?? []
        FavoriteProgrammePictureString = getProgrammePictureString
        
        let getPerformancePictureString:[String] = userDefaults.array(forKey: "UDPerformancePictureKey") as? [String] ?? []
        FavoritePerformancePictureString = getPerformancePictureString
        //リロードする
        tableView.reloadData()
        
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return FavoriteName.count
        } else {
            return FavoritePerformanceName.count
        }
    }
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    // cellの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    // sectionに載せる文字列を返す関数
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "企画"
        } else {
            return "公演"
        }
    }
    
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        if section == 0 {
            view.tintColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 0.7)
        } else {
            view.tintColor = UIColor(red: 102/255, green: 255/255, blue: 153/255, alpha: 0.7)
        }
        //labelの文字
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    

    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let FavoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as! FavoriteTableViewCell
        
        let UDColorTestProgramme: [String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
        let UDColorTestPerformance: [String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        
        //cellに右矢印を追加する
        FavoriteCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        if indexPath.section == 0{
            // ここでcellのlabelに値を入れる　ここに新たな文字をい入れる
            FavoriteCell.FavoriteNameLabel.text = FavoriteName[indexPath.item]
            FavoriteCell.FavoritePicture.image = UIImage(named: FavoriteProgrammePictureString[indexPath.item])
            if UDColorTestProgramme.contains(FavoriteName[indexPath.item]){
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.orange, for: .normal)
            } else {
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.black, for: .normal)
            }
        } else {
            FavoriteCell.FavoriteNameLabel.text = FavoritePerformanceName[indexPath.item]
            FavoriteCell.FavoritePicture.image = UIImage(named: FavoritePerformancePictureString[indexPath.item])
            if UDColorTestPerformance.contains(FavoritePerformanceName[indexPath.item]){
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.orange, for: .normal)
            } else {
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.black, for: .normal)
            }
        }
        return FavoriteCell
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        if indexPath.section == 0 {
            giveData = FavoriteName[indexPath.item]
            giveDescriptionData = FavoriteProgrammeDescription[indexPath.item]
            givePictureStringData = FavoriteProgrammePictureString[indexPath.row]
        } else {
            giveData = FavoritePerformanceName[indexPath.item]
            giveDescriptionData = FavoritePerformanceDescription[indexPath.item]
            givePictureStringData = FavoritePerformancePictureString[indexPath.row]
        }
        performSegue(withIdentifier: "FavoriteSegue", sender: nil)
    }
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FavoriteSegue" {
            let vc = segue.destination as! FavoriteViewController
            vc.receiveData = giveData
            vc.receiveDescriptionData = giveDescriptionData
            vc.receivePictureStringData = givePictureStringData
        }
    }
    
    //お気に入りボタン実装
    @IBAction func tapAddButton(sender: Any) {
        // userDefaultsに保存された値の取得
        var getUDProgrammeName:[String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
        var getUDProgrammeDescription:[String] = userDefaults.array(forKey: "UDProgrammeDescriptionKey") as? [String] ?? []
        var getUDProgrammePicture:[String] = userDefaults.array(forKey: "UDProgrammePictureKey" ) as? [String] ?? []
        var getUDPerformanceName:[String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        var getUDPerformanceDescription:[String] = userDefaults.array(forKey: "UDPerformanceDescriptionKey") as? [String] ?? []
        var getUDPerformancePicture:[String] = userDefaults.array(forKey: "UDPerformancePictureKey" ) as? [String] ?? []
        
        // タップされたボタンのtableviewの選択行を取得
        let button = sender as! UIButton
        let cell = button.superview?.superview?.superview as! UITableViewCell
        let row = tableView.indexPath(for: cell)!.row
        let section = tableView.indexPath(for: cell)!.section
        
        //UDProgrammeNameにProgrammeNameを代入している
        func changeBlack(){
            button.setTitleColor(UIColor.black, for: .normal)
        }
        func changeOrange(){
            button.setTitleColor(UIColor.orange, for: .normal)
        }
        if section == 0 {
            if getUDProgrammeName.contains(FavoriteName[row]){
                getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: FavoriteName[row])!)
                getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: FavoriteProgrammeDescription[row])!)
                getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: FavoriteProgrammePictureString[row])!)
                changeBlack()
            }else {
                getUDProgrammeName.append(FavoriteName[row])
                getUDProgrammeDescription.append(FavoriteProgrammeDescription[row])
                getUDProgrammePicture.append(FavoriteProgrammePictureString[row])
                changeOrange()
                print("ここには来ないはず")
            }
        }else if section == 1 {
            if getUDPerformanceName.contains(FavoritePerformanceName[row]){
                getUDPerformanceName.remove(at: getUDPerformanceName.firstIndex(of: FavoritePerformanceName[row])!)
                changeBlack()
            }else {
                getUDPerformanceName.append(FavoritePerformanceName[row])
                changeOrange()
                print("ここには来ないはず")
            }
        }
        // userDefaultsに格納したい値
        //UserDefaultにUDProgrammeNameを保存する
        userDefaults.set(getUDProgrammeName, forKey: "UDProgrammeNameKey")
        userDefaults.set(getUDPerformanceName, forKey: "UDPerformanceNameKey")
        tableView.reloadData()
        
    } 
}
