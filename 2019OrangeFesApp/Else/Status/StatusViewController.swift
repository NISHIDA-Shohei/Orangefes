//
//  StatusViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/11.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class StatusViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    let ref = Database.database().reference()
    
    @IBOutlet var StatusLabel: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var ProgrammeTitle: UINavigationItem!
    
    let StatusList: [String] = ["空いています","運営中","5分待ち","10分待ち","15分待ち","20分待ち","25分待ち","30分以上待ち","整理券を配っています","準備中","終了","データがありません" ]
    
    var ProgrammeReceiveData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        ProgrammeTitle.title = ProgrammeReceiveData
        
    }
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return StatusList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return StatusList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        StatusLabel.text = StatusList[row]
        
    }
    
    @IBAction func EnterButton(_ sender: Any) {
        //投稿のためのメソッド
        create()
    }
    
    //データの送信のメソッド
    func create() {
        let folderRef = ref.child("団体状況").child(ProgrammeReceiveData);
        let newFolder = ["Status": StatusLabel.text ?? []] as [String : Any]
        folderRef.updateChildValues(newFolder)
    }

}
