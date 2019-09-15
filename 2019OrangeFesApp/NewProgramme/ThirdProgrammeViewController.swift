//
//  ThirdProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ThirdProgrammeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let PerformanceName11: [String] = ["応援部","弦楽部","ダンス部"]
    let PerformanceImage11: [String] = ["Meteors.png","StringMusic.png","Dance.png"]
    let PerformanceTime11: [String] = ["10:00〜10:50","11:10〜12:00","14:30〜15:30"]
    let PerformanceTime21: [String] = ["11:00〜11:50","12:10〜13:00","13:20〜14:20"]
    
    let PerformanceName12: [String] = ["合気道部","吹奏楽部"]
    let PerformanceImage12: [String] = ["Aikido.png","BrassBand.png"]
    let PerformanceTime12: [String] = ["11:10〜12:00","13:05〜13:35"]
    
    let PerformanceName13: [String] = ["ダンス部","応援部"]
    let PerformanceImage13:[String] = ["Dance.png","Meteors.png"]
    let PerformanceTime13: [String] = ["12:20〜13:00","13:50〜14:40"]
    let PerformanceTime23: [String] = ["10:00〜10:40","14:30〜15:30"]
    
    let PerformanceName14: [String] = ["ゴスペル部","英語部"]
    let PerformanceImage14: [String] = ["Gospel.png","ESS.png"]
    let PerformanceTime14: [String] = ["12:00〜13:00","13:40〜14:20"]
    let PerformanceTime24: [String] = ["12:00〜13:00","13:40〜14:20"]
    
    let PerformanceName15: [String] = ["軽音楽部"]
    let PerformanceImage15: [String] = ["SchoolBand.png"]
    let PerformanceTime15: [String] = ["10:00〜15:30"]
    
    let PerformanceName22: [String] = ["吹奏楽部","合気道部"]
    let PerformanceImage22: [String] = ["BrassBand.png","Aikido.png"]
    let PerformanceTime22: [String] = ["10:45〜11:15","11:30〜12:25"]
    
    //segment controll用関数
    var p: Int = 0
    
    var Image11: [UIImage?] = []
    var Image12: [UIImage?] = []
    var Image13: [UIImage?] = []
    var Image14: [UIImage?] = []
    var Image15: [UIImage?] = []
    
    var Image22: [UIImage?] = []
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for fileName in PerformanceImage11 {
            Image11.append(UIImage(named: fileName))
        }
        for fileName in PerformanceImage12 {
            Image12.append(UIImage(named: fileName))
        }
        for fileName in PerformanceImage13 {
            Image13.append(UIImage(named: fileName))
        }
        for fileName in PerformanceImage14 {
            Image14.append(UIImage(named: fileName))
        }
        for fileName in PerformanceImage15 {
            Image15.append(UIImage(named: fileName))
        }
        
        for fileName in PerformanceImage22 {
            Image22.append(UIImage(named: fileName))
        }
        
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
        return 115
    }
    
    // sectionの数を返す関数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // sectionごとのcellの数を返す関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return PerformanceName11.count
        } else if section == 1{
            return PerformanceName12.count
        } else if section == 2{
            return PerformanceName13.count
        } else if section == 3{
            return PerformanceName14.count
        } else {
            return PerformanceName15.count
        }
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
        
        if section == 0{
            return "体育館"
        } else if section == 1{
            return "オレンジの間"
        } else if section == 2{
            return "校庭"
        } else if section == 3{
            return "小ホール"
        } else {
            return "多目的ホール"
        }
    }
    
    // cellの情報を書き込む関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProgrammeCell = tableView.dequeueReusableCell(withIdentifier: "ThirdProgrammeTableViewCell", for: indexPath as IndexPath) as! ThirdProgrammeTableViewCell
        
        if p == 0{
            if indexPath.section == 0{
                ProgrammeCell.name.text = PerformanceName11[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image11[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime11[indexPath.row]
            } else if indexPath.section == 1{
                ProgrammeCell.name.text = PerformanceName12[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image12[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime12[indexPath.row]
            } else if indexPath.section == 2{
                ProgrammeCell.name.text = PerformanceName13[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image13[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime13[indexPath.row]
            } else if indexPath.section == 3{
                ProgrammeCell.name.text = PerformanceName14[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image14[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime14[indexPath.row]
            } else {
                ProgrammeCell.name.text = PerformanceName15[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image15[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime15[indexPath.row]
            }
        } else {
            if indexPath.section == 0{
                ProgrammeCell.name.text = PerformanceName11[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image11[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime21[indexPath.row]
            } else if indexPath.section == 1{
                ProgrammeCell.name.text = PerformanceName22[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image22[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime22[indexPath.row]
            } else if indexPath.section == 2{
                ProgrammeCell.name.text = PerformanceName13[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image13[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime23[indexPath.row]
            } else if indexPath.section == 3{
                ProgrammeCell.name.text = PerformanceName14[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image14[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime24[indexPath.row]
            } else {
                ProgrammeCell.name.text = PerformanceName15[indexPath.row]
                ProgrammeCell.PerformancePicture.image = Image15[indexPath.row]
                ProgrammeCell.PerformanceTime.text = PerformanceTime15[indexPath.row]
            }
        }
        
        return ProgrammeCell
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
        default:
            p = 0
            reload()
        }
    }
    
    func reload(){
        TableView.reloadData()
    }
}

