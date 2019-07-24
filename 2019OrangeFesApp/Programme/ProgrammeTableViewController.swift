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
    
    let ProgrammeName2: [String] = ["ゆっかいず","ドーナツショップ","お化け屋敷","ちゅるちゅるらんど","硬式テニス部３年","BEES","たこやき","すいーと♡えんじぇる","起業家クラス","法政国際男子２年","バレー部","硬式テニス部１・２年","放送部","１年H組","１年C組","図書委員会","アメリカンドッグ","１年E組","あなたとコンビに法政チーズ","１年G組"]
    
    let ProgrammePicture2String: [String] = ["211.png","212.png","213.png","214.png","215.png","216.png","217.png","218.png","220.png","221.png","223.png","224.png","225.png","226.png","227.png","228.png","234.png","235.png","236.png","237.png"]
    
    var ProgrammePicture2:[UIImage?] = []
    
    let ProgrammeDescription2: [String] = [
        "法政国際内に仮装した人が紛れ込んでしまった！？人混みの中に隠れている人々を探し、スタンプを獲得せよ！果たしてあなた達は探し出すことができるのだろうか・・・？"
        ,"#1B映えのB楽しい３つの縁日ゲームに挑戦できます！高得点のアナタにはヨーヨーやお菓子をプレゼント♡フォトスポットも用意してお待ちしております♪1Bに来ればインスタ映え間違いナシ！"
        ,"ちょっと暑いな〜と思っているそこのキミ！可愛い子たちが売っているジュースで涼んでみませんか！？美女ばっかりの天然オアシスですよ！！！色んな種類があるので是非飲みに来てね♡"
        ,"キャラメル味、チョコレート味、メープル味の３種類のワッフル屋さんせです！！とっても美味しくて、可愛いお店なので、ぜひ来てください！！"
        ,"「朗報」２号館１階に休憩スペース有り！エアコンの効いた部屋で休めます！総オレンジのフォトジェニックな空間なのでカワイイ写真も撮れます♡"
        ,"暑い時はやっぱアイスでしょ！！！食べるしかないぞそこの君！！冷たいマンゴーアイス食べて気分爽快〜♡３−３のマンゴーアイス食べに来てね！"
        ,"可愛い、美味しい、ドーナツはいかがですか？ソースやトッピングも貴方次第⭐︎お気に入りの組み合わせにカスタマイズしてポップでスイートなひと時をエンジョイして下さい♡"
        ,"３年１組です！！私たちはタピオカを売ります。味は２種類でカルピス味とミルクティー味があります。ぜひ来て下さい！！"
        ,"毎年恒例の家庭部のクッキーを売ります！３枚で１００円！２号館１階のロビーにて販売しています。買わないと損！家庭部部員が１から丁寧に作りました。"
        ,"2-Aの出し物は来てからのお楽しみです。"
        ,"私たち２Bは冷やしパインとラムネを売ります！！暑くても寒くてもパインとラムネを食べると夏に戻れる！？私たちと平成最後の夏を取り戻しましょう！お待ちしています！"
        ,"トンネルをくぐった先の公衆電話でお化けと話せるという噂が・・・あなたの悩みにまさるくんが答えてくれる！？新感覚お化け屋敷！雑談でもOK※お互いの顔は見えないようになっています。"
        ,"オレンジ祭に来た思い出をSNSにアップしてくれるあなたへ！！４つの色の系統に分けてそれぞれのテーマの可愛カッコイイ素敵な写真を残していきませんか？タトゥーシールや小物もあります！ぜひ来て下さい♡"
        ,"1-Hの出し物は来てからのお楽しみです。"
        ,"1年E組は海外風をテーマに展示、フェイスペイントを行っています！カラフルでかわいい部屋はインスタ映え間違いなし！！おしゃれ女子必見ですよ！！"
        ,"アメリカ、マナブーセッツ州には廃病院がある。最近そこでは心霊現象が多発しているらしい。君たちにはその現象を調査してきてほしい。ただし命の保証はできない・・・。"
        ,"101年前、とある１人の研究者が雪山の研究所にいた。噂では得体の知れない化け物を作り出したそう。肝も体も冷えるお化け屋敷なんて行くしかないでしょ！"
        ,"おにぎり売ってます！ぜひ来てね！！"
        ,"＜クリア率17%＞脱出ゲームを１年間で１００種類以上クリアした猛者たちからの挑戦状。ホラー脱出ゲーム！試されるのはあなたの５つの能力。分析能力・閃き力・注意力・推理力・精神力。あなたは脱出できるのか。"
        ,"1-Gにはかわいくてカラフルなインスタ映えスポットがたくさん！撮らなきゃ損ですよ？！"
        ,"こんにちは！3年7組です！私たちのクラスはディッtピンドッツというつぶつぶアイスをご提供します！普段のアイスでは味わえないつぶつぶ食感味わってみませんか？法政国際になって初めての文化祭です！ぜひ楽しんでいって下さい！"
    ]
    let ProgrammeName3: [String] = ["家庭科部","美術部",]
    let ProgrammePicture3String: [String] = ["310.png","321.png"]
    var ProgrammePicture3: [UIImage?] = []
    let ProgrammeDescription3: [String] = ["家庭部はクッキーを販売しています。2袋100円のワンコインなので気軽にご購入いただけます。手軽に甘いものが欲しくなった時にいかがでしょうか？","こんにちは！オレンジ祭では昨年と同様に手作りハンコと小さなオブジェ等を販売します！合作は1人1つ小さな家を作り、机の上で小さな街を作ります。"]
    let ProgrammeName4: [String] = ["バドミントン部","RESISTANCE","有志ダンス","同窓会","PTAバザー","入試相談室"]
    let ProgrammePicture4String: [String] = ["432.png","431-1.png","431-2.png","SchoolLogo.png","SchoolLogo.png","SchoolLogo.png"]
    var ProgrammePicture4: [UIImage?] = []
    let ProgrammeDescription4: [String] = [
        "食堂の説明"
        ,"同窓会バザー・手作り品販売　談話コーナー　お茶を用意してお待ちしています。"
        ,"法政国際高オリジナル商品も販売します♪♪♪数限定なのでお見逃しなく！！　皆様のお越しをお待ちしております　※PTAバザー主催の売上金は、生徒たちの為に使わせていただきます"
        ,"成田国際空港の説明ビデオを流しています"
        ,"①全体説明　9/15 13:00 9/16 10:00 11:30 13:00 ②個別相談 9/15 14:00-15:30 9/16 10:30-15:30 来年度、本校を受験される中学生および保護者の方々のために設けた部屋です。個別相談はなるべく全体説明をお聞きになった上で、おまわり下さい。"
    
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
            // ここでcellのlabelに値を入れています。//ここに新たな文字をい入れる
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
                ProgrammeDescriptionGiveData = ProgrammeDescription1[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 1 {
                ProgrammeGiveData = ProgrammeName2[indexPath.item]
                ProgrammeDescriptionGiveData = ProgrammeDescription2[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 2 {
                ProgrammeGiveData = ProgrammeName3[indexPath.item]
                ProgrammeDescriptionGiveData = ProgrammeDescription3[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 3 {
                ProgrammeGiveData = ProgrammeName4[indexPath.item]
                ProgrammeDescriptionGiveData = ProgrammeDescription4[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
                
            } else if indexPath.section == 4 {
                ProgrammeGiveData = ProgrammeName5[indexPath.item]
                performSegue(withIdentifier: "ProgrammeSegue", sender: nil)
            }
            
        } else if p == 2 {
            performSegue(withIdentifier: "TimeTableSegue", sender: nil)
        } else {
            ProgrammeGiveData = Group[indexPath.item]
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
