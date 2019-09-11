//
//  FirstProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class FirstProgrammeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // cellのlabelに書く文字列
    //1=1号館 2=2号館 3=3号館 4=4号館 5=オレンジの間前
    let ProgrammeName1: [String] = ["漫画広報部","華道部","茶道部"]
    let ProgrammePicture1String: [String] = ["112-1.png","112-2.png","114.png"]
    let ProgrammeDescription1: [String] = [
        "「漫画広報部」部員の「好きなもの」を詰め込んだ、『Primarera』という部誌を発行しております。その他、平面だけでなく立体でも展示をしております。お立ち寄りいただければ幸いです！"
        ,"「華道部」華道部です。私たちは月2回ほどコーチの元で練習を重ねてきました。テーマは行事です。私達の作品、ぜひ見に来てください。"
        ,"「茶道部」お茶とお菓子が食べれます。1席150円です。正座はしないので、お気軽にお越し下さい。日頃の稽古の成果を生かせるよう頑張ります。"]
    
    let ProgrammeName2: [String] = ["ゆっかいず","ドーナツショップ","お化け屋敷","ちゅるちゅるらんど","硬式テニス部３年","BEES","トッポギ","すいーと♡えんじぇる","起業家クラス","法政国際２年男子","Cafe in The Daytime","バレー部","硬式テニス部１・２年","放送部","１年H組","１年C組","図書委員会","アメリカンドッグ","１年E組","あなたとコンビに法政チーズ","１年G組"]
    
    let ProgrammePicture2String: [String] = ["211.png","212.png","213.png","214.png","215.png","216.png","217.png","218.png","220.png","221.png","222.png","223.png","224.png","225.png","226.png","227.png","228.png","234.png","235.png","236.png","237.png"]
    
    
    let ProgrammeDescription2: [String] = [
        "「ゆっかいず」こんにちは！ゆっかいずです^_^私たちゆっかいずは3年有志の団体で超ド級においしいタピオカを売っています！かんわいいフォトブースも用意しているので是非来てくだサイ！"
        ,"「ドーナツショップ」かわいくオシャレにドレスアップした女の子たちがフォトブースにもなるアットホームな空間でドーナツショップをオープンします！2号館1階手前から2番目の教室でお待ちしてます！"
        ,"「お化け屋敷」携帯を無くしたから探してくれと頼まれ電話をかけてみると、恐ろしい怪物の声が!!!切るとすぐに鳴り出す着信音。そこには090-2829-37564という番号が!!213で、怪物が待ってます！"
        ,"「ちゅるちゅるらんど」夢と魔法とらーめんの王国へようこそ！お昼にはみんなでおいしいらーめんを食べてちゅるちゅるしよう！レッツちゅるちゅる！"
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
        ,"「１年G組」「肉巻きおにぎりがここにある！」私たち1年G組はやみつきになるジューシー肉巻き弁当を用意してあなたをお待ちしています！売り切れごめんの肉巻きおにぎり！1Gへ急げ!!"]
    
    let ProgrammeName3: [String] = ["家庭科部","美術部",]
    let ProgrammePicture3String: [String] = ["310.png","321.png"]
    let ProgrammeDescription3: [String] = ["「家庭科部」家庭部はクッキーを販売しています。2袋100円のワンコインなので気軽にご購入いただけます。手軽に甘いものが欲しくなった時にいかがでしょうか？","「美術部」こんにちは！オレンジ祭では昨年と同様に手作りハンコと小さなオブジェ等を販売します！合作は1人1つ小さな家を作り、机の上で小さな街を作ります。"]
    let ProgrammeName4: [String] = ["バドミントン部","RESISTANCE","有志ダンス","同窓会","PTAバザー","入試相談室"]
    let ProgrammePicture4String: [String] = ["432.png","431-1.png","431-2.png","SchoolLogo.png","SchoolLogo.png","SchoolLogo.png"]
    var ProgrammePicture4: [UIImage?] = []
    let ProgrammeDescription4: [String] = [
        "「バドミントン部」４号館で焼き小籠包を売っています！外はパリッとこんがり焼き目をつけて、中はジューシーな肉汁が溢れ出てくる、ココでしか食べられない横浜の伝統ある焼き小籠包、ぜひ召し上がり下さい！！４号館でお待ちしています！！"
        ,"「RESISTANCE」こんにちは、Resistanceです。私たちは軽音部ではなく、学校外での活動を主にやっています。今回はDJの人も加えてライブもします。是非来てください！"
        ,"「有志ダンス」2年の伊東紗彩と松尾晃聖です。私たちは外部で本格的にダンスを習っていて、様々な活動をしています。振りつけも、今日も衣装も自分たちで考え、作り出しました。ぜひ見に来てください。"
        ,"説明文はありません"
        ,"今年度もバザーを催します。\n法政国際オリジナルグッズ（オリジナルトートバッグ・刺繍入りタオル）も販売します。　数量限定となりますのでお見逃しなく！　\n皆様のお越しをお待ちしております。　\n※PTAバザー主催の売上金は、生徒たちの為に使わせていただきます"
        ,"①全体説明　9/28 13:00 9/29 10:00 11:30 13:00 ②個別相談 9/28 14:00-15:30 9/29 10:30-15:30 来年度、本校を受験される中学生および保護者の方々のために設けた部屋です。個別相談はなるべく全体説明をお聞きになった上で、おまわり下さい。"]
    
    let ProgrammeName5: [String] = ["太田屋","一の会","ベル　エポック","MARION CREPES","食堂"]
    let ProgrammePicture5String: [String] = ["clear.png","clear.png","clear.png","clear.png","clear.png"]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 5
    }
    
    // sectionごとのcellの数を返す関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            sectionPlace = "1号館"
        } else if sectionNumber == 1 {
            sectionPlace = "2号館"
        } else if sectionNumber == 2 {
            sectionPlace = "3号館"
        } else if sectionNumber == 3 {
            sectionPlace = "4号館"
        } else if sectionNumber == 4 {
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
        //cellに右矢印を追加する
        //ProgrammeCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        // ここでcellのlabelに値を入れています。
        
        func changeBlack(){
            ProgrammeCell.button.setTitle("☆", for: .normal)
            ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
        }
        func changeOrange(){
            ProgrammeCell.button.setTitle("★", for: .normal)
            ProgrammeCell.button.setTitleColor(UIColor.orange, for: .normal)
            
        }
        
            if indexPath.section == 0 {
                ProgrammeCell.name.text = ProgrammeName1[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = UIImage(named: ProgrammePicture1String[indexPath.row])
                if UDColorTest.contains(ProgrammeName1[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 1 {
                ProgrammeCell.name.text = ProgrammeName2[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = UIImage(named: ProgrammePicture2String[indexPath.row])
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName2[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 2 {
                ProgrammeCell.name.text = ProgrammeName3[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = UIImage(named: ProgrammePicture3String[indexPath.row])
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName3[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 3 {
                ProgrammeCell.name.text = ProgrammeName4[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = UIImage(named: ProgrammePicture4String[indexPath.row])
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName4[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
                
            } else if indexPath.section == 4 {
                ProgrammeCell.name.text = ProgrammeName5[indexPath.item]
                ProgrammeCell.ProgrammePicture.image = UIImage(named: ProgrammePicture5String[indexPath.row])
                ProgrammeCell.button.setTitleColor(UIColor.black, for: .normal)
                if UDColorTest.contains(ProgrammeName5[indexPath.item]){
                    changeOrange()
                }else{
                    changeBlack()
                }
            }
        
        return ProgrammeCell
    }
    
    
    func reload(){
        TableView.reloadData()
    }
    

}