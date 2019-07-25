//
//  ProgrammeTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase


class ProgrammeTableViewController: UITableViewController {
    
    // cellのlabelに書く文字列
    //1=1号館 2=2号館 3=3号館 4=4号館 5=オレンジの間前
    let ProgrammeName1: [String] = ["漫画広報部","華道部","茶道部"]
    let ProgrammePicture1String: [String] = ["112-1.png","112-2.png","114.png"]
    var ProgrammePicture1: [UIImage?] = []
    let ProgrammeDescription1: [String] = [
    "部員の「好きなもの」を詰め込んだ、『Primarera』という部誌を発行しております。その他、平面だけでなく立体でも展示をしております。お立ち寄りいただければ幸いです！"
        ,"華道部です。私たちは月2回ほどコーチの元で練習を重ねてきました。テーマは行事です。私達の作品、ぜひ見に来てください。"
        ,"お茶とお菓子が食べれます。1席200円です。正座はしないので、お気軽にお越し下さい。日頃の稽古の成果を生かせるよう頑張ります。"
    ]
    
    let ProgrammeName2: [String] = ["ゆっかいず","ドーナツショップ","お化け屋敷","ちゅるちゅるらんど","硬式テニス部３年","BEES","トッポギ","すいーと♡えんじぇる","起業家クラス","法政国際２年男子","Café in The Daytime","バレー部","硬式テニス部１・２年","放送部","１年H組","１年C組","図書委員会","アメリカンドッグ","１年E組","あなたとコンビに法政チーズ","１年G組"]
    
    let ProgrammePicture2String: [String] = ["211.png","212.png","213.png","214.png","215.png","216.png","217.png","218.png","220.png","221.png","222.png","223.png","224.png","225.png","226.png","227.png","228.png","234.png","235.png","236.png","237.png"]
    
    var ProgrammePicture2:[UIImage?] = []
    
    let ProgrammeDescription2: [String] = [
        "「ゆっかいず」こんにちは！ゆっかいずです^_^私たちゆっかいずは3年有志の団体で超ド級においしいタピオカを売っています！かんわいいフォトブースも用意しているので是非来てくだサイ！"
        ,"「ドーナツショップ」かわいくオシャレにドレスアップした女の子たちがフォトブースにもなるアットホームな空間でドーナツショップをオープンします！2号館1階手前から2番目の教室でお待ちしてます！"
        ,"「お化け屋敷」携帯を無くしたから探してくれと頼まれ電話をかけてみると、恐ろしい怪物の声が!!!切るとすぐに鳴り出す着信音。そこには090-2829-37564という番号が!!213で、怪物が待ってます！"
        ,"「ちゅるちゅるらんど」夢と魔法とら〜めんの王国へようこそ！お昼にはみんなでおいしいら〜めんを食べてちゅるちゅるしよう！レッツちゅるちゅる！"
        ,"「硬式テニス部3年」硬式テニス部3年は冷たくて甘いシューアイスを売っています！定番のバニラ味をはじめ、色々な種類の味を揃えています！ぜひMr &Mrsシューアイスに会いに来てください！"
        ,"「BEES」1年生のパワフルさと3年生のキラキラに負けません!!2年有志の「bees」です！チュロスはいかがですか？一緒に写真が撮れるフォトブースあります♡インスタ映え間違いなし...!!"
        ,"「トッポギ」1年A組はトッポギを販売しています！場所は2号館1階の217教室です！安くて美味しいトッポギとお待ちしています。ぜひ来てください！"
        ,"「すいーと♡えんじぇる」２号館の長い道を抜けたその先に…そこにあるけれどそこにはない求めるものにのみ招かれる幻のお茶会が開かれています。さて、あなたはたどり着けるのでしょうか…？"
        ,"「起業家クラス」こんにちは！起業家クラスです！（（タピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタピオカタ…。"
        ,"「法政国際2年男子」私たち「法政国際2年男子」は、『映画上映会』をやります!!共学になって男子1号の笑いあり、涙ある作品をぜひご覧下さい！上映中に飲んだり食べたりできるようにお菓子やジュースを用意しています。皆さん、ぜひお越し下さい！"
            ,"「Café in The Daytime」Hello当店は午前中にフードがなくなってしまうことが多いオレンジ祭の対策として午後から開店いたします。（人材不足ではありません。決して、、、）お客様のお好みのパンケーキと紅茶をご提供いたします。"
        ,"「バレー部」こんにちは、バレー部です。バレー部ではタピオカミルクティーとお菓子を販売します。1・2・3年生全員が一丸となって出店を頑張るので是非来てください!!場所は2号館2階の223教室です。"
            ,"「硬式テニス部1・2年」硬式テニス部1・2年によるたいやき屋さんです！かわいくて美味しいたいやきを売るので、ぜひお越し下さい！"
        ,"「放送部」放送部は224教室でビデオ放送を行っています。構成やナレーションまでこだわって作成したので、ぜひ見にきて下さい。また、少し疲れてしまった時の休憩スペースとしてもどうぞ!!"
            ,"「1年H組」1年H組です。New York風のAmerican Hot dogに、少しTwistを付け加えました。インスタ映え間違いなしのコーナーや、イケメン男子が待っています！"
        ,"「1年C組」こんにちは、1Cです!!1Cでは、美味しいチュロスを販売しています！小腹が空いた方、甘いものが好きな方、チュロスが好きな方！ぜひ、お越しください!!2号館2階、227教室でお待ちしています^_^"
        ,"「図書委員会」生徒のみなさんと先生方から読まなくなった本を寄付していただき、古本として販売します。海外文学から絵本まで様々なジャンルを用意しています！是非お気軽に足を運んでみてください！"
            ,"「アメリカンドッグ」☆ベビーカステラ ☆ミニアメリカンドッグ ☆チーズボールやります！小腹がすいたら234へ!!待ってます！"
        ,"「1年E組」法政国際高校1年E組に迷いこんでしまったあなた。次々と迫りくる試練を乗り越え脱出デキルカナ...!?リアル脱出ゲーム、是非おこし下さい！"
        ,"「あなたとコンビに法政チーズ」1-Fでチーズスティックをを販売します！　最近流行りの伸びるチーズを法政コンビニで味わって見ませんか？"
        ,"「１年G組」「肉巻きおにぎりがここにある！」私たち1年G組はやみつきになるジューシー肉巻き弁当を用意してあなたをお待ちしています！売り切れごめんの肉巻きおにぎり！1Gへ急げ!!"
    ]
    let ProgrammeName3: [String] = ["家庭科部","美術部",]
    let ProgrammePicture3String: [String] = ["310.png","321.png"]
    var ProgrammePicture3: [UIImage?] = []
    let ProgrammeDescription3: [String] = ["家庭部はクッキーを販売しています。2袋100円のワンコインなので気軽にご購入いただけます。手軽に甘いものが欲しくなった時にいかがでしょうか？","こんにちは！オレンジ祭では昨年と同様に手作りハンコと小さなオブジェ等を販売します！合作は1人1つ小さな家を作り、机の上で小さな街を作ります。"]
    let ProgrammeName4: [String] = ["バドミントン部","RESISTANCE","有志ダンス","同窓会","PTAバザー","入試相談室"]
    let ProgrammePicture4String: [String] = ["432.png","431-1.png","431-2.png","SchoolLogo.png","SchoolLogo.png","SchoolLogo.png"]
    var ProgrammePicture4: [UIImage?] = []
    let ProgrammeDescription4: [String] = [
    "「バドミントン部」４号館で焼き小籠包を売っています！外はパリッとこんがり焼き目をつけて、中はジューシーな肉汁が溢れ出てくる、ココでしか食べられない横浜の伝統ある焼き小籠包、ぜひ召し上がり下さい！！４号館でお待ちしています！！"
    ,"「RESISTANCE」こんにちは、Resistanceです。私たちは軽音部ではなく、学校外での活動を主にやっています。今回はDJの人も加えてライブもします。是非来てください！"
    ,"「有志ダンス」2年の伊東沙彩と松尾晃聖です。私たちは外部で本格的にダンスを習っていて、様々な活動をしています。振りつけも、今日も衣装も自分たちで考え、作り出しました。是非、私たちのダンスを見に来て下さいね。"
        ,"「同窓会」"
    ,"「PTAバザー」法政国際高オリジナル商品も販売します♪♪♪数限定なのでお見逃しなく！！　皆様のお越しをお待ちしております　※PTAバザー主催の売上金は、生徒たちの為に使わせていただきます"
        ,"①全体説明　9/28 13:00 9/29 10:00 11:30 13:00 ②個別相談 9/28 14:00-15:30 9/29 10:30-15:30 来年度、本校を受験される中学生および保護者の方々のために設けた部屋です。個別相談はなるべく全体説明をお聞きになった上で、おまわり下さい。"
    
    ]
    let ProgrammeName5: [String] = ["MOS BURGER","31アイスクリーム","ベル　エポック","MARION CREPES"]
    let ProgrammePicture5String: [String] = ["000.png","000.png","000.png","000.png"]
    var ProgrammePicture5: [UIImage?] = []
    let ProgrammeDescription5: [String] = ["ハンバーガー屋","アイスクリーム屋","パン屋","クレープ屋"]

    

    
    //公演一覧　統合データ部分////////////////////////////////////////////////////////////
    let Group: [String] = ["応援部","ダンス部","弦楽部","合気道部","ゴスペル部","英語部","有志演劇","軽音楽部","吹奏楽部"]
    
    let GroupPictureString: [String] = ["Meteors.png","Dance.png","StringMusic.png","Aikido.png","Gospel.png","ESS.png","Drama.png","SchoolBand.png","BrassBand.png"]
    
    var GroupPicture: [UIImage?] = []
    
    let GroupDescription: [String] = [
        "Go!METEORS!!"
        ,"是非来てください！"
    ,"ダンス部です！４月からこのオレ祭のためにたくさんの練習をしてきました！校庭公演では可愛い衣装でキラキラ笑顔で3学年の公演をお見せします！体育館公演では多くのジャンルを精一杯お見せします。お越しください！"
    ,"私たち弦楽部はヴァイオリン１８人、ヴィオラ７人、チェロ４人、コントラバス２人、フルート２人で活動しています！体育館で演奏するので是非見に来てください。"
        ,"是非来てください！"
        ,"是非来てください！"
        ,"Alice in Wonder Land ＠小ホール"
        ,"ご飯の時間！２い！"
        ,"こんにちは軽音楽部です！私たちは部員８９名という大人数で楽しく仲良くライブに向けて練習をしています！オレンジ祭では１日目１年生と３年生、２日目は２年生と３年生が演奏します！３年生はこれで引退です！ぜひ！見に来てください！♡"]
    
    let TimeTableImage: [String] = ["Day1TimeTable.jpg","Day2TimeTable.jpg"]
    
    var p: Int = 0
    func reload(){
        tableView.reloadData()
    }

    // 遷移先のViewControllerに渡す変数
    var ProgrammeGiveData: String = ""
    var ProgrammePictureGiveData: String = ""
    var ProgrammeDescriptionGiveData: String = ""
    
    
    //UserDefaultsの変数
    var userDefaults = UserDefaults.standard
    var UDProgrammeName:String = ""
    var UDProgrammeDescription:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        /* UD初期化
        if let bundleId = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleId) */
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
        for fileName in GroupPictureString {
            GroupPicture.append(UIImage(named: fileName))
        }
        
        }
    
    
    //リロードする
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        // cellの高さを返す関数
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
}
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        if p == 0 {
            //企画
            return 5
        } else if p == 1{
            //公演
            return 1
        } else {
            return 2
        }
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if p == 0 {
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
            }
        } else if p == 1 {
                return Group.count
        } else {
                return 1
        }
        return 0
    }
    
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if p == 0 {
            //labelの色
            view.tintColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha: 0.7)
            let header = view as! UITableViewHeaderFooterView
            //labelの文字
            header.textLabel?.textColor = UIColor.black
        } else if p == 1{
            //labelの色
            view.tintColor = UIColor(red: 102/255, green: 255/255, blue: 153/255, alpha: 0.7)
            let header = view as! UITableViewHeaderFooterView
            //labelの文字
            header.textLabel?.textColor = UIColor.black
        } else {
            //labelの色
            view.tintColor = UIColor(red: 204/255, green: 153/255, blue: 255/255, alpha: 0.7)
            let header = view as! UITableViewHeaderFooterView
            //labelの文字
            header.textLabel?.textColor = UIColor.black
        }

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
        
        //追加部分
        if p == 0 {
            if sectionNumber == 0 {
                sectionPlace = "1号館"
            } else if sectionNumber == 1 {
                sectionPlace = "2号館"
            } else if sectionNumber == 2 {
                sectionPlace = "3号館"
            } else if sectionNumber == 3 {
                sectionPlace = "4号館"
            } else if sectionNumber == 4 {
                sectionPlace = "オレンジの間前"
            }
        } else if p == 1 {
                sectionPlace = "公演"
        } else {
            if sectionNumber == 0 {
                sectionPlace = "9月28日(土)"
            } else {
                sectionPlace = "9月29日(日)"
            }
        }
        return "\(sectionPlace)"
    }

    // cellの情報を書き込む関数

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProgrammeCell = tableView.dequeueReusableCell(withIdentifier: "ProgrammeTableViewCell", for: indexPath as IndexPath) as! ProgrammeTableViewCell
        
        //UserDefaultの情報を取得
        let UDColorTest: [String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
        let UDColorTestPerformance: [String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        //cellに右矢印を追加する
        ProgrammeCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        // ここでcellのlabelに値を入れています。
        if p == 0 {
            if indexPath.section == 0 {
                ProgrammeCell.name.text = ProgrammeName1[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture1[indexPath.row]
                if UDColorTest.contains(ProgrammeName1[indexPath.item]){
                    ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
                }else{
                    ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                }
                
            } else if indexPath.section == 1 {
                ProgrammeCell.name.text = ProgrammeName2[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture2[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName2[indexPath.item]){
                    ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
                }else{
                    ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                }
                
            } else if indexPath.section == 2 {
                ProgrammeCell.name.text = ProgrammeName3[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture3[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName3[indexPath.item]){
                    ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
                }else{
                    ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                }
                
            } else if indexPath.section == 3 {
                ProgrammeCell.name.text = ProgrammeName4[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture4[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName4[indexPath.item]){
                    ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
                }else{
                    ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                }
                
            } else if indexPath.section == 4 {
                ProgrammeCell.name.text = ProgrammeName5[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = ProgrammePicture5[indexPath.row]
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName5[indexPath.item]){
                    ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
                }else{
                    ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                }
            }
        } else if p == 1 {
            ProgrammeCell.name.text = Group[indexPath.item]
            ProgrammeCell.ProgrammePicture.image = GroupPicture[indexPath.row]
            if UDColorTestPerformance.contains(Group[indexPath.item]){
                ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
            }else{
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
            }
        } else {
            if indexPath.section == 0 {
                ProgrammeCell.ProgrammePicture.image = UIImage(named: "000.png")
                ProgrammeCell.name.text = "公演タイムテーブル"
            } else {
                ProgrammeCell.ProgrammePicture.image = UIImage(named: "000.png")
                ProgrammeCell.name.text = "公演タイムテーブル"
            }
        }

        return ProgrammeCell
    }
    
    
    //=======================================================================
    //favorite ボタン　実装
    @IBAction func tapAddButton(sender: Any) {
        
        // userDefaultsに保存された値の取得
        var getUDProgrammeName:[String] = userDefaults.array(forKey: "UDProgrammeNameKey") as? [String] ?? []
        var getUDPerformanceName:[String] = userDefaults.array(forKey: "UDPerformanceNameKey") as? [String] ?? []
        var getUDProgrammeDescription:[String] = userDefaults.array(forKey: "UDProgrammeDescriptionKey") as? [String] ?? []
        var getUDPerformanceDescription:[String] = userDefaults.array(forKey: "UDPerformanceDescriptionKey") as? [String] ?? []
        
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
        if p == 0 {
            if section == 0 {
                if getUDProgrammeName.contains(ProgrammeName1[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName1[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription1[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName1[row])
                    getUDProgrammeDescription.append(ProgrammeDescription1[row])
                    changeOrange()
                }
            }else if section == 1 {
                if getUDProgrammeName.contains(ProgrammeName2[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName2[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription2[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName2[row])
                    getUDProgrammeDescription.append(ProgrammeDescription2[row])
                    changeOrange()
                }
            }else if section == 2 {
                if getUDProgrammeName.contains(ProgrammeName3[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName3[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription3[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName3[row])
                    getUDProgrammeDescription.append(ProgrammeDescription3[row])
                    changeOrange()
                }
            }else if section == 3 {
                if getUDProgrammeName.contains(ProgrammeName4[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName4[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription4[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName4[row])
                    getUDProgrammeDescription.append(ProgrammeDescription4[row])
                    changeOrange()
                }
            }else if section == 4 {
                if getUDProgrammeName.contains(ProgrammeName5[row]){
                    getUDProgrammeName.remove(at: getUDProgrammeName.firstIndex(of: ProgrammeName5[row])!)
                    getUDProgrammeDescription.remove(at: getUDProgrammeDescription.firstIndex(of: ProgrammeDescription5[row])!)
                    changeBlack()
                }else {
                    getUDProgrammeName.append(ProgrammeName5[row])
                    getUDProgrammeDescription.append(ProgrammeDescription5[row])
                    changeOrange()
                }
            }
            print("start\(getUDProgrammeDescription)")
        } else {
            //UDProgrammeNameにProgrammeNameを代入している
            if getUDPerformanceName.contains(Group[row]){
                getUDPerformanceName.remove(at: getUDPerformanceName.firstIndex(of: Group[row])!)
                getUDPerformanceDescription.remove(at: getUDPerformanceDescription.firstIndex(of: Group[row])!)
                button.setTitleColor(UIColor.black, for: .normal)
            }else {
                getUDPerformanceName.append(Group[row])
                getUDPerformanceDescription.append(Group[row])
                button.setTitleColor(UIColor.orange, for: .normal)
            }
        }
        
        // userDefaultsに格納したい値
        //UserDefaultにUDProgrammeNameを保存する
        userDefaults.set(getUDProgrammeName, forKey: "UDProgrammeNameKey")
        //UserDefaultにUDPerformanceNameを保存する
        userDefaults.set(getUDPerformanceName, forKey: "UDPerformanceNameKey")
        userDefaults.set(getUDProgrammeDescription, forKey: "UDProgrammeDescriptionKey")
        userDefaults.set(getUDPerformanceDescription, forKey: "UDPerformanceDescriptionKey")
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        if p == 0 {
            if indexPath.section == 0 {
                ProgrammeGiveData = ProgrammeName1[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture1String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription1[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 1 {
                ProgrammeGiveData = ProgrammeName2[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture2String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription2[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 2 {
                ProgrammeGiveData = ProgrammeName3[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture3String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription3[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 3 {
                ProgrammeGiveData = ProgrammeName4[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture4String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription4[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 4 {
                ProgrammeGiveData = ProgrammeName5[indexPath.item]
                ProgrammePictureGiveData = ProgrammePicture5String[indexPath.row]
                ProgrammeDescriptionGiveData = ProgrammeDescription5[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
            }
            
        } else if p == 2 {
            performSegue(withIdentifier: "TimeTableSegue", sender: nil)
        } else {
            ProgrammeGiveData = Group[indexPath.item]
            ProgrammePictureGiveData = GroupPictureString[indexPath.row]
            ProgrammeDescriptionGiveData = GroupDescription[indexPath.item]
            performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
        }
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProgrammeSegue" {
            let Pvc = segue.destination as! ProgrammeViewController
            Pvc.ProgrammeReceiveData = ProgrammeGiveData
            Pvc.ProgrammeDescriptionReceiveData = ProgrammeDescriptionGiveData
            Pvc.ProgrammePictureReceiveData = ProgrammePictureGiveData
        }
    }
    
    //segment controll
    @IBAction func segmentTap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            p = 0
            reload()
        case 1:
            p = 1
            reload()
        case 2:
            //self.performSegue(withIdentifier: "TimeTableSegue", sender: nil)
            p = 2
            reload()
        default:
            p = 0
            reload()
        }
    }
    
    
}
