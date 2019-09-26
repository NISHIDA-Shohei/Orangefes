//
//  FavoriteTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/06.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import GoogleMobileAds

class FavoriteTableViewController: UITableViewController {
    
    
    var userDefaults = UserDefaults.standard
    
    var FavoriteName: [String] = []
    var FavoritePerformanceName: [String] = []
    var FavoriteProgrammeDescription: [String] = []
    var FavoritePerformanceDescription: [String] = []
    var FavoriteProgrammePictureString: [String] = []
    var FavoritePerformancePictureString: [String] = []
    var FavoriteProgrammeGenre: [String] = []
    
    let reset: String = ""

    var giveData = ""
    var giveDescriptionData = ""
    var givePictureStringData = ""
    
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
        
        let getFavoriteProgrammeGenre: [String] = userDefaults.array(forKey: "UDProgrammeGenreKey") as? [String] ?? []
        FavoriteProgrammeGenre = getFavoriteProgrammeGenre
        
        print(FavoriteProgrammeGenre)
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
        return 115
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
        view.tintColor = UIColor(red: 255/255, green: 153/255, blue: 255/255, alpha: 0.7)
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
        //FavoriteCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        if indexPath.section == 0{
            // ここでcellのlabelに値を入れる　ここに新たな文字をい入れる
            FavoriteCell.FavoriteNameLabel.text = FavoriteName[indexPath.item]
            FavoriteCell.FavoritePicture.image = UIImage(named: FavoriteProgrammePictureString[indexPath.item])
            FavoriteCell.FavoriteGenre.text = FavoriteProgrammeGenre[indexPath.row]
            if UDColorTestProgramme.contains(FavoriteName[indexPath.item]){
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.orange, for: .normal)
                FavoriteCell.FavoriteButton.setTitle("★", for: .normal)
            } else {
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.black, for: .normal)
                FavoriteCell.FavoriteButton.setTitle("☆", for: .normal)
            }
        } else {
            FavoriteCell.FavoriteNameLabel.text = FavoritePerformanceName[indexPath.item]
            FavoriteCell.FavoritePicture.image = UIImage(named: FavoritePerformancePictureString[indexPath.item])
            FavoriteCell.FavoriteGenre.text = ""
            if UDColorTestPerformance.contains(FavoritePerformanceName[indexPath.item]){
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.orange, for: .normal)
                FavoriteCell.FavoriteButton.setTitle("★", for: .normal)
            } else {
                FavoriteCell.FavoriteButton.setTitleColor(UIColor.black, for: .normal)
                FavoriteCell.FavoriteButton.setTitle("☆", for: .normal)
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
        performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
    }
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProgrammeSegue" {
            let vc = segue.destination as! ProgrammeViewController
            vc.ProgrammeReceiveData = giveData
            vc.ProgrammeDescriptionReceiveData = giveDescriptionData
            vc.ProgrammePictureReceiveData = givePictureStringData
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
        var getUDProgrammeGenre: [String] = userDefaults.array(forKey: "UDProgrammeGenreKey" ) as? [String] ?? []
        
        // タップされたボタンのtableviewの選択行を取得
        let button = sender as! UIButton
        let cell = button.superview?.superview?.superview as! UITableViewCell
        let row = tableView.indexPath(for: cell)!.row
        let section = tableView.indexPath(for: cell)!.section
        
        //UDProgrammeNameにProgrammeNameを代入している
        func changeBlack(){
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitle("☆", for: .normal)
        }
        func changeOrange(){
            button.setTitleColor(UIColor.orange, for: .normal)
            button.setTitle("★", for: .normal)
            
        }
        if section == 0 {
            if getUDProgrammeName.contains(FavoriteName[row]){
                getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: FavoriteName[row])!)
                getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: FavoriteProgrammeDescription[row])!)
                getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: FavoriteProgrammePictureString[row])!)
                getUDProgrammeGenre.remove(at: getUDProgrammeGenre.firstIndex(of: FavoriteProgrammeGenre[row])!)
                changeBlack()
            }else {
                getUDProgrammeName.append(FavoriteName[row])
                getUDProgrammeDescription.append(FavoriteProgrammeDescription[row])
                getUDProgrammePicture.append(FavoriteProgrammePictureString[row])
                getUDProgrammeGenre.append(FavoriteProgrammeGenre[row])
                changeOrange()
                print("ここには来ないはず")
            }
        }else if section == 1 {
            if getUDPerformanceName.contains(FavoritePerformanceName[row]){
                getUDPerformanceName.remove(at: getUDPerformanceName.firstIndex(of: FavoritePerformanceName[row])!)
                getUDPerformanceDescription.remove(at: getUDPerformanceDescription.firstIndex(of: FavoritePerformanceDescription[row])!)
                getUDPerformancePicture.remove(at: getUDPerformancePicture.firstIndex(of: FavoritePerformancePictureString[row])!)
                changeBlack()
            }else {
                getUDPerformanceName.append(FavoritePerformanceName[row])
                getUDPerformanceDescription.append(FavoritePerformanceDescription[row])
                getUDPerformancePicture.append(FavoritePerformancePictureString[row])
                changeOrange()
                print("ここには来ないはず")
            }
        }
        // userDefaultsに格納したい値
        //UserDefaultにUDProgrammeNameを保存する
        userDefaults.set(getUDProgrammeName, forKey: "UDProgrammeNameKey")
        userDefaults.set(getUDPerformanceName, forKey: "UDPerformanceNameKey")
        userDefaults.set(getUDProgrammeDescription, forKey: "UDProgrammeDescriptionKey")
        userDefaults.set(getUDPerformanceDescription, forKey: "UDPerformanceDescriptionKey")
        userDefaults.set(getUDProgrammePicture, forKey: "UDProgrammePictureKey")
        userDefaults.set(getUDPerformancePicture, forKey: "UDPerformancePictureKey")
        userDefaults.set(getUDProgrammeGenre, forKey: "UDProgrammeGenreKey")
        tableView.reloadData()
        
    }
    
    @IBAction func tapReset(sender: Any) {
        userDefaults.set(reset, forKey: "UDProgrammeNameKey")
        userDefaults.set(reset, forKey: "UDProgrammeDescriptionKey")
        userDefaults.set(reset, forKey: "UDProgrammePictureKey")
        userDefaults.set(reset, forKey: "UDProgrammeGenreKey")
        
        userDefaults.set(reset, forKey: "UDPerformanceNameKey")
        userDefaults.set(reset, forKey: "UDPerformanceDescriptionKey")
        userDefaults.set(reset, forKey: "UDPerformancePictureKey")
        
        tableView.reloadData()
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
