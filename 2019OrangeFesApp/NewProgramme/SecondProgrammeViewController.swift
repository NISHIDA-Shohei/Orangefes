//
//  SecondProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SecondProgrammeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let PerformanceName: [String] = ["パンフレットからの変更点","応援部","ダンス部","弦楽部","合気道部","ゴスペル部","英語部","軽音楽部","吹奏楽部"]
    let PerformancePictureString: [String] = ["Anounce","Meteors","Dance","StringMusic","Aikido","Gospel","ESS","SchoolBand","BrassBand"]
    let PerformanceDescription: [String] = ["",
        "「応援部」こんにちは！応援部です！1日2回体育館と校庭で公演を行います。3年生はオレンジ祭で引退します。そしてこの3代で演技をするのも最後です。80名を超える迫力ある演技を、是非観に来て下さい！"
        ,"「ダンス部」校庭公演と体育館公演を行います！3年生にとって最後の公演、そして3代で行う最初で最後の公演です♡かわいい衣装とかっこいいダンスで魅了します!!!校庭公演と体育館公演では、内容が違くなっているなっているのでどちらの公演も楽しんで下さい♡ダンス部一同お待ちしております!!!!"
        ,"「弦楽部」私たち弦楽部は23人で週に3回4号館音楽室で活動しています。部員のほとんどが初心者なので、経験者でない方も大歓迎です。このオレンジ祭は、3年生最後の公演となります。どうぞ、最後までお聴き下さい！"
        ,"「合気道部」こんにちは合気道部です。私たちは1年生12名2年生13名の25名でかっこいい演武を皆さんにお見せできるよう練習してきました。是非オレンジの間へお越しください。"
        ,"「ゴスペル部」ゴスペル部です♫ゴスペル部はアカペラで歌う部活です。オレンジ祭両日、小ホールにて公演を行います。J-Popから洋楽まで、みなさんが楽しめるような曲・歌声でお待ちしています！是非お越し下さい！"
        ,"「英語部」魔法の髪を持つ少女の冒険を歌と英語で。英語が分からない方でも楽しめます。小ホールでお待ちしております‼"
        ,"「軽音楽部」こんにちは！軽音部です!!私たちは1年生6バンド、2年生5バンド、3年生7バンドの総勢79名で活動しています。みんなで一緒に盛り上がりましょう！是非M棟1階にお立ち寄りくださいーー!!"
        ,"「吹奏楽部」こんにちは！吹奏楽部です♪私たちは2年生5人、1年生5人の合計10人で毎日仲良く楽しく活動しています^o^今日はもう少し人数が増えて更に楽しいステージとなっています！ぜひオレ間に来て下さい！"]
    
    // 遷移先のViewControllerに渡す変数
    var ProgrammeGiveData: String = ""
    var ProgrammePictureGiveData: String = ""
    var ProgrammeDescriptionGiveData: String = ""
    
    //UserDefaultsの変数
    var userDefaults = UserDefaults.standard
    var UDPerformanceName:String = ""
    var UDPerformanceDescription:String = ""
    
    @IBOutlet weak var TableView: UITableView!
    
    //admob
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-2794500738665846/8940293663"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        loadFooter()
        
        TableView.dataSource = self
        TableView.delegate = self
        reload()
        
    }
    //リロードする
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    
    // cellの高さを返す関数
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // sectionの数を返す関数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sectionごとのcellの数を返す関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PerformanceName.count
    }
    
    //sectionの色
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        view.tintColor = UIColor(red: 255/255, green: 153/255, blue: 255/255, alpha: 0.7)
        let header = view as! UITableViewHeaderFooterView
        //labelの文字の色
        header.textLabel?.textColor = UIColor.black
    }
    
    // sectionの高さを返す関数
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // sectionに載せる文字列を返す関数
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //sectionの日付
        let sectionName = "公演一覧"
        return sectionName
    }
    
    // cellの情報を書き込む関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProgrammeCell = tableView.dequeueReusableCell(withIdentifier: "2ProgrammeTableViewCell", for: indexPath as IndexPath) as! SecondProgrammeTableViewCell
        //UserDefaultの情報を取得
        let UDColorTestPerformance: [String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        // ここでcellのlabelに値を入れています。
        
        func changeBlack(){
            ProgrammeCell.button.setTitle("☆", for: .normal)
            ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
        }
        func changeOrange(){
            ProgrammeCell.button.setTitle("★", for: .normal)
            ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
        }
        func changeWhite(){
            ProgrammeCell.button.setTitle("★", for: .normal)
            ProgrammeCell.button.setTitleColor(UIColor.white, for: .normal)
        }
        
        ProgrammeCell.name.text = PerformanceName[indexPath.row]
        ProgrammeCell.ProgrammePicture.image = UIImage(named: PerformancePictureString[indexPath.row])
        if indexPath.row == 0 {
            changeWhite()
        } else {
            if UDColorTestPerformance.contains(PerformanceName[indexPath.row]){
            changeOrange()
            }else{
            changeBlack()
            }
        }
        
        
        return ProgrammeCell
    }
    
    //お気に入りボタン
    @IBAction func tapAddButton(sender: Any) {
        // userDefaultsに保存された値の取得
        var getUDPerformanceName:[String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        var getUDPerformanceDescription:[String] = userDefaults.array(forKey: "UDPerformanceDescriptionKey") as? [String] ?? []
        var getUDPerformancePicture:[String] = userDefaults.array(forKey: "UDPerformancePictureKey" ) as? [String] ?? []
        
        // タップされたボタンのtableviewの選択行を取得
        let button = sender as! UIButton
        let cell = button.superview?.superview?.superview as! UITableViewCell
        let row = TableView.indexPath(for: cell)!.row
        let section = TableView.indexPath(for: cell)!.section
        
        //UDProgrammeNameにProgrammeNameを代入している
        func changeBlack(){
            button.setTitle("☆", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
        }
        func changeOrange(){
            button.setTitle("★", for: .normal)
            button.setTitleColor(UIColor.orange, for: .normal)
        }
        
        if row == 0{
            //do nothing
        } else {
            if getUDPerformanceName.contains(PerformanceName[row]){
                getUDPerformanceName.remove(at: getUDPerformanceName.firstIndex(of: PerformanceName[row])!)
                getUDPerformanceDescription.remove(at: getUDPerformanceDescription.firstIndex(of: PerformanceDescription[row])!)
                getUDPerformancePicture.remove(at: getUDPerformancePicture.firstIndex(of: PerformancePictureString[row])!)
                    changeBlack()
            }else {
                getUDPerformanceName.append(PerformanceName[row])
                getUDPerformanceDescription.append(PerformanceDescription[row])
                getUDPerformancePicture.append(PerformancePictureString[row])
                    changeOrange()
            }
        }
        
        // userDefaultsに格納したい値
        //UserDefaultにUDProgrammeNameを保存する
        userDefaults.set(getUDPerformanceName, forKey: "UDPerformanceNameKey")
        userDefaults.set(getUDPerformanceDescription, forKey: "UDPerformanceDescriptionKey")
        userDefaults.set(getUDPerformancePicture, forKey: "UDPerformancePictureKey")
        
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            performSegue(withIdentifier: "Anounce2Segue", sender: nil)
        } else {
            // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
            ProgrammeGiveData = PerformanceName[indexPath.row]
            ProgrammePictureGiveData = PerformancePictureString[indexPath.row]
            ProgrammeDescriptionGiveData = PerformanceDescription[indexPath.item]
            performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
        }
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProgrammeSegue" {
            let vc = segue.destination as! ProgrammeViewController
            vc.ProgrammeReceiveData = ProgrammeGiveData
            vc.ProgrammeDescriptionReceiveData = ProgrammeDescriptionGiveData
            vc.ProgrammePictureReceiveData = ProgrammePictureGiveData
        }
    }
    
    
    
    
    func reload(){
        TableView.reloadData()
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
        let footerCell: UITableViewCell = TableView.dequeueReusableCell(withIdentifier: "TableFooterCell")!
        let footerView: UIView = footerCell.contentView
        TableView.tableFooterView = footerView
    }
    
}
