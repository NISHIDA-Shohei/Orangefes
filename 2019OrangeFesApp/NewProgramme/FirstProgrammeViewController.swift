//
//  FirstProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import GoogleMobileAds

class FirstProgrammeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // cellのlabelに書く文字列
    //1=1号館 2=2号館 3=3号館 4=4号館 5=オレンジの間前
    
    let ProgrammeName0: [String] = ["パンフレットからの変更点"]
    let ProgrammeGenre0: [String] = [""]
    let ProgrammePicture0String: [String] = ["Anounce"]
    var ProgrammePicture0: [UIImage?] = []
    
    let ProgrammeName1: [String] = ["漫画広報部","華道部","茶道部","図書委員会　"]
    let ProgrammeGenre1: [String] = ["　展示・販売　","　展示　","　食品　","　販売　"]
    let ProgrammePicture1String: [String] = ["112-1","112-2","114","111-2"]
    var ProgrammePicture1: [UIImage?] = []
    let ProgrammeDescription1: [String] = [
        "「漫画広報部」部員の「好きなもの」を詰め込んだ、『Primarera』という部誌を発行しております。その他、平面だけでなく立体でも展示をしております。お立ち寄りいただければ幸いです！"
        ,"「華道部」華道部です。私たちは月2回ほどコーチの元で練習を重ねてきました。テーマは行事です。私達の作品、ぜひ見に来てください。"
        ,"「茶道部」お茶とお菓子が食べれます。1席150円です。正座はしないので、お気軽にお越し下さい。日頃の稽古の成果を生かせるよう頑張ります。"
    ,"「図書委員会」生徒のみなさんと先生方から読まなくなった本を寄付していただき、古本として販売します。海外文学から絵本まで様々なジャンルを用意しています！是非お気軽に足を運んでみてください！"]
    
    let ProgrammeName2: [String] = ["ゆっかいず","ドーナツショップ","お化け屋敷","ちゅるちゅるらんど","硬式テニス部３年","トッポギ","すいーと♡えんじぇる","起業家クラス","法政国際２年男子","Cafe in The Daytime","バレー部","硬式テニス部１・２年","放送部","１年H組","１年C組","1年D組　","アメリカンドッグ","バドミントン部　","１年E組","あなたとコンビに法政チーズ","１年G組","家庭科部"]
    let ProgrammeGenre2: [String] = ["　食品　","　食品　","　展示　","　食品　","　食品　","　食品　","　食品　","　食品　","　展示　","　食品　","　食品　","　食品　","　展示　","　食品　","　展示　","　展示　","　食品　","　食品　","　展示　","　食品　","　食品　","　食品　"]
    let ProgrammePicture2String: [String] = ["211","212","213","214","215","217","218","220","221","222","223","224","225","226","227","228","234","432","235","236","237","310"]
    var ProgrammePicture2: [UIImage?] = []
    
    
    let ProgrammeDescription2: [String] = [
        "「ゆっかいず」こんにちは！ゆっかいずです^_^私たちゆっかいずは3年有志の団体で超ド級においしいタピオカを売っています！かんわいいフォトブースも用意しているので是非来てくだサイ！"
        ,"「ドーナツショップ」かわいくオシャレにドレスアップした女の子たちがフォトブースにもなるアットホームな空間でドーナツショップをオープンします！2号館1階手前から2番目の教室でお待ちしてます！"
        ,"「お化け屋敷」携帯を無くしたから探してくれと頼まれ電話をかけてみると、恐ろしい怪物の声が!!!切るとすぐに鳴り出す着信音。そこには090-2829-37564という番号が!!213で、怪物が待ってます！"
        ,"「ちゅるちゅるらんど」夢と魔法とらーめんの王国へようこそ！お昼にはみんなでおいしいらーめんを食べてちゅるちゅるしよう！レッツちゅるちゅる！"
        ,"「硬式テニス部3年」硬式テニス部3年は冷たくて甘いシューアイスを売っています！定番のバニラ味をはじめ、色々な種類の味を揃えています！ぜひMr &Mrsシューアイスに会いに来てください！"
        ,"「トッポギ」1年A組はトッポギを販売しています！場所は2号館1階の217教室です！安くて美味しいトッポギとお待ちしています。ぜひ来てください！"
        ,"「すいーと♡えんじぇる」２号館の長い道を抜けたその先に…そこにあるけれどそこにはない求めるものにのみ招かれる幻のお茶会が開かれています。さて、あなたはたどり着けるのでしょうか…？"
    ,"「起業家クラス」こんにちは！起業家クラスです！（（タピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタ…。タピオカホルダー販売も行います！"
    ,"「法政国際2年男子」私たち「法政国際2年男子」は、『映画上映会』をやります!!共学になって男子1号の笑いあり、涙ある作品をぜひご覧下さい！上映中に飲んだり食べたりできるようにお菓子やジュースを用意しています。皆さん、ぜひお越し下さい！"
        ,"「Café in The Daytime」Hello当店は午前中にフードがなくなってしまうことが多いオレンジ祭の対策として午後から開店いたします。（人材不足ではありません。決して、、、）お客様のお好みのパンケーキと紅茶をご提供いたします。"
        ,"「バレー部」こんにちは、バレー部です。バレー部ではタピオカミルクティーとお菓子を販売します。1・2・3年生全員が一丸となって出店を頑張るので是非来てください!!場所は2号館2階の223教室です。"
        ,"「硬式テニス部1・2年」硬式テニス部1・2年によるたいやき屋さんです！かわいくて美味しいたいやきを売るので、ぜひお越し下さい！"
        ,"「放送部」放送部は224教室でビデオ放送を行っています。構成やナレーションまでこだわって作成したので、ぜひ見にきて下さい。また、少し疲れてしまった時の休憩スペースとしてもどうぞ!!"
        ,"「1年H組」1年H組です。New York風のAmerican Hot dogに、少しTwistを付け加えました。インスタ映え間違いなしのコーナーや、イケメン男子が待っています！"
        ,"「1年C組」VS嵐"
        ,"「1年D組」あなたは誰がピエロか見抜けるか人狼ゲームをしていた少女たち  しかしその中には人殺しのピエロが紛れ込んでいた……               次々とピエロによって殺されていく少女たちあなたはピエロから逃げ切れるのかそれともピエロに見つかり殺されてしまうのか…     \nけっしてふりかえるな"
        ,"「アメリカンドッグ」☆ベビーカステラ ☆ミニアメリカンドッグ ☆チーズボールやります！小腹がすいたら234へ!!待ってます！"
    ,"「バドミントン部」2号館で焼き小籠包を売っています！外はパリッとこんがり焼き目をつけて、中はジューシーな肉汁が溢れ出てくる、ココでしか食べられない横浜の伝統ある焼き小籠包、ぜひ召し上がり下さい！！2号館でお待ちしています！！"
        ,"「1年E組」法政国際高校1年E組に迷いこんでしまったあなた。次々と迫りくる試練を乗り越え脱出デキルカナ...!?リアル脱出ゲーム、是非おこし下さい！"
        ,"「あなたとコンビに法政チーズ」1-Fでチーズスティックをを販売します！　最近流行りの伸びるチーズを法政コンビニで味わって見ませんか？"
    ,"「１年G組」「肉巻きおにぎりがここにある！」私たち1年G組はやみつきになるジューシー肉巻き弁当を用意してあなたをお待ちしています！売り切れごめんの肉巻きおにぎり！1Gへ急げ!!"
        ,"「家庭科部」家庭部はクッキーを販売しています。1袋100円のワンコインなので気軽にご購入いただけます。手軽に甘いものが欲しくなった時にいかがでしょうか？"]
    
    let ProgrammeName3: [String] = ["美術部"]
    let ProgrammeGenre3: [String] = ["　展示・販売　"]
    let ProgrammePicture3String: [String] = ["321"]
    var ProgrammePicture3: [UIImage?] = []
    let ProgrammeDescription3: [String] = ["「美術部」こんにちは！オレンジ祭では昨年と同様に手作りハンコと小さなオブジェ等を販売します！合作は1人1つ小さな家を作り、机の上で小さな街を作ります。"]
    let ProgrammeName4: [String] = ["RESISTANCE","有志ダンス","同窓会","PTAバザー","入試相談室"]
    let ProgrammeGenre4: [String] = ["　パフォーマンス　","　パフォーマンス　","","　販売　",""]
    let ProgrammePicture4String: [String] = ["431-1","431-2","SchoolLogo","SchoolLogo","SchoolLogo"]
    var ProgrammePicture4: [UIImage?] = []
    let ProgrammeDescription4: [String] = [
        "「RESISTANCE」こんにちは、Resistanceです。私たちは軽音部ではなく、学校外での活動を主にやっています。今回はDJの人も加えてライブもします。是非来てください！"
        ,"「有志ダンス」2年の伊東紗彩と松尾晃聖です　。私たちは外部で本格的にダンスを習っていて、様々な活動をしています。振りつけも、今日も衣装も自分たちで考え、作り出しました。ぜひ見に来てください。"
            ,"会場：同窓会室　4号館3階マルチメディアC \n時間：10:00から15:30 \n同窓会バザー・手作り販売・各期コーナー16期,19期,24期・談話コーナー \n\n会場：食堂\n卒業20年の会(50期)9月29日(日)13:30より"
        ,"今年度もバザーを催します。\n法政国際オリジナルグッズ（オリジナルトートバッグ・刺繍入りタオル）も販売します。\n数量限定となりますのでお見逃しなく！　\n皆様のお越しをお待ちしております。　\n※PTAバザー主催の売上金は、生徒たちの為に使わせていただきます"
            ,"①全体説明　4号館　4階音楽室　\n9/28 13:00 9/29 10:00 11:30 13:00 \n②個別相談 4号館　442教室 \n9/28 14:00-15:30 9/29 10:30-15:30 \n来年度、本校を受験される中学生および保護者の方々のために設けた部屋です。個別相談はなるべく全体説明をお聞きになった上で、おまわり下さい。"]
    
    let ProgrammeName5: [String] = ["太田屋","一の会","ベル　エポック","MARION CREPES","食堂"]
    let ProgrammeGenre5: [String] = ["　食品　","　食品　","　食品　","　食品　","　食品　"]
    let ProgrammePicture5String: [String] = ["clear","clear","clear","clear","clear"]
    var ProgrammePicture5: [UIImage?] = []
    let ProgrammeDescription5: [String] = ["惣菜屋","学校食堂","パン屋","クレープ屋","からあげ丼甘辛ソース・４５０円　\n豚キムチ丼温玉のせ・４５０円　\nラーメン・３５０円　\nトマトカレー夏野菜・４００円　\nコロッケパン・１００円　\nいももち・１５０円　\nアメリカンドック・１００円　\nドーナツ４種類・各１００円（キャラメル・アップルシナモン・ミルクショコラ・抹茶ミルク）　\nからあげ４個・１００円（オレンジ祭のみの企画です）"]
    
    // 遷移先のViewControllerに渡す変数
    var ProgrammeGiveData: String = ""
    var ProgrammePictureGiveData: String = ""
    var ProgrammeDescriptionGiveData: String = ""
    
    //UserDefaultsの変数
    var userDefaults = UserDefaults.standard
    var UDProgrammeName:String = ""
    var UDProgrammeDescription:String = ""
    
    @IBOutlet weak var TableView: UITableView!
    
    //admob
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for fileName in ProgrammePicture0String {
            ProgrammePicture0.append(UIImage(named: fileName))
        }
        for fileName in ProgrammePicture1String {
            ProgrammePicture1.append(UIImage(named: fileName))
        }
        for fileName in ProgrammePicture2String {
            ProgrammePicture2.append(UIImage(named: fileName))
        }
        for fileName in ProgrammePicture3String {
            ProgrammePicture3.append(UIImage(named: fileName))
        }
        for fileName in ProgrammePicture4String {
            ProgrammePicture4.append(UIImage(named: fileName))
        }
        for fileName in ProgrammePicture5String {
            ProgrammePicture5.append(UIImage(named: fileName))
        }
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4195103882736205/5671880921"
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
        return 6
    }
    
    // sectionごとのcellの数を返す関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return ProgrammeName0.count
        } else if section == 1 {
            return ProgrammeName1.count
        } else if section == 2 {
            return ProgrammeName2.count
        } else if section == 3{
            return ProgrammeName3.count
        } else if section == 4{
            return ProgrammeName4.count
        } else if section == 5{
            return ProgrammeName5.count
        }
        return 0
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
        let sectionNumber = section
        var sectionPlace: String = ""
        if sectionNumber == 0 {
            sectionPlace = "重要なご連絡"
        } else if sectionNumber == 1 {
            sectionPlace = "1号館"
        } else if sectionNumber == 2 {
            sectionPlace = "2号館"
        } else if sectionNumber == 3 {
            sectionPlace = "3号館"
        } else if sectionNumber == 4 {
            sectionPlace = "4号館"
        } else if sectionNumber == 5 {
            sectionPlace = "オレンジの間前・食堂"
        } else {
            sectionPlace = ""
        }
        return sectionPlace
    }
    
    // cellの情報を書き込む関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProgrammeCell = tableView.dequeueReusableCell(withIdentifier: "FirstProgrammeTableViewCell", for: indexPath as IndexPath) as! FirstProgrammeTableViewCell
        //UserDefaultの情報を取得
        let UDColorTest: [String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
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
        
            if indexPath.section == 0 {
                ProgrammeCell.name.text = ProgrammeName0[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture0[indexPath.row]
                ProgrammeCell.ProgrammeGenre.text = ProgrammeGenre0[indexPath.row]
                changeWhite()
                
            } else if indexPath.section == 1 {
                ProgrammeCell.name.text = ProgrammeName1[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture1[indexPath.row]
                ProgrammeCell.ProgrammeGenre.text = ProgrammeGenre1[indexPath.row]
                if UDColorTest.contains(ProgrammeName1[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 2 {
                ProgrammeCell.name.text = ProgrammeName2[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture2[indexPath.row]
                ProgrammeCell.ProgrammeGenre.text = ProgrammeGenre2[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName2[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 3 {
                ProgrammeCell.name.text = ProgrammeName3[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture3[indexPath.row]
                ProgrammeCell.ProgrammeGenre.text = ProgrammeGenre3[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName3[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 4 {
                ProgrammeCell.name.text = ProgrammeName4[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture4[indexPath.row]
                ProgrammeCell.ProgrammeGenre.text = ProgrammeGenre4[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName4[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 5 {
                ProgrammeCell.name.text = ProgrammeName5[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture5[indexPath.row]
                ProgrammeCell.ProgrammeGenre.text = ProgrammeGenre5[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName5[indexPath.item]){
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
        var getUDProgrammeName:[String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
        var getUDProgrammeDescription:[String] = userDefaults.array(forKey: "UDProgrammeDescriptionKey") as? [String] ?? []
        var getUDProgrammePicture:[String] = userDefaults.array(forKey: "UDProgrammePictureKey" ) as? [String] ?? []
        
        // タップされたボタンのtableviewの選択行を取得
        let button = sender as! UIButton
        let cell = button.superview?.superview as! UITableViewCell
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
            if section == 0 {
                //Do nothing
            }else if section == 1 {
                if getUDProgrammeName.contains(ProgrammeName1[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName1[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription1[row])!)
                    getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: ProgrammePicture1String[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName1[row])
                    getUDProgrammeDescription.append(ProgrammeDescription1[row])
                    getUDProgrammePicture.append(ProgrammePicture1String[row])
                    changeOrange()
                }
            }else if section == 2 {
                if getUDProgrammeName.contains(ProgrammeName2[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName2[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription2[row])!)
                    getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: ProgrammePicture2String[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName2[row])
                    getUDProgrammeDescription.append(ProgrammeDescription2[row])
                    getUDProgrammePicture.append(ProgrammePicture2String[row])
                    changeOrange()
                }
            }else if section == 3 {
                if getUDProgrammeName.contains(ProgrammeName3[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName3[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription3[row])!)
                    getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: ProgrammePicture3String[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName3[row])
                    getUDProgrammeDescription.append(ProgrammeDescription3[row])
                    getUDProgrammePicture.append(ProgrammePicture3String[row])
                    changeOrange()
                }
            }else if section == 4 {
                if getUDProgrammeName.contains(ProgrammeName4[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName4[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription4[row])!)
                    getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: ProgrammePicture4String[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName4[row])
                    getUDProgrammeDescription.append(ProgrammeDescription4[row])
                    getUDProgrammePicture.append(ProgrammePicture4String[row])
                    changeOrange()
                }
            }else if section == 5 {
                if getUDProgrammeName.contains(ProgrammeName5[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName5[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription5[row])!)
                    getUDProgrammePicture.remove(at: getUDProgrammePicture.firstIndex(of: ProgrammePicture5String[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName5[row])
                    getUDProgrammeDescription.append(ProgrammeDescription5[row])
                    getUDProgrammePicture.append(ProgrammePicture5String[row])
                    changeOrange()
                }
            }
        
        // userDefaultsに格納したい値
        //UserDefaultにUDProgrammeNameを保存する
        userDefaults.set(getUDProgrammeName, forKey: "UDProgrammeNameKey")
        
        userDefaults.set(getUDProgrammeDescription, forKey: "UDProgrammeDescriptionKey")
        
        userDefaults.set(getUDProgrammePicture, forKey: "UDProgrammePictureKey")
        
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
            if indexPath.section == 0 {
                performSegue(withIdentifier: "AnounceSegue", sender: nil)
            }else if indexPath.section == 1 {
                ProgrammeGiveData = ProgrammeName1[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture1String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription1[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 2 {
                ProgrammeGiveData = ProgrammeName2[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture2String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription2[indexPath.item]
                    print(ProgrammeGiveData)
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 3 {
                ProgrammeGiveData = ProgrammeName3[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture3String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription3[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 4 {
                ProgrammeGiveData = ProgrammeName4[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture4String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription4[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 5 {
                ProgrammeGiveData = ProgrammeName5[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture5String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription5[indexPath.item]
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
