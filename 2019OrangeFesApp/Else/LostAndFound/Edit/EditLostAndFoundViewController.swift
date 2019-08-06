//
//  EditLostAndFoundViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/04.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class EditLostAndFoundViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var LostName: UITextField!
    @IBOutlet weak var LostPlace: UILabel!
    @IBOutlet weak var LostDate: UITextField!
    @IBOutlet weak var LostDescription: UITextField!
    
    var LostNameReceiveData: String = ""
    var LostKeyReceiveData: String = ""
    
    //pickerview
    @IBOutlet var PickerView: UIPickerView!
    let PlaceList: [String] = ["１号間","２号間","３号間","４号間","体育館","グラウンド","校門付近","M棟","その他"]
    
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LostName.delegate = self as UITextFieldDelegate
        LostDate.delegate = self as UITextFieldDelegate
        LostDescription.delegate = self as UITextFieldDelegate
        PickerView.delegate = self
        PickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print(LostKeyReceiveData)

        let refData = Database.database().reference().child("落し物一覧").child(LostKeyReceiveData)
        refData.observe(.value, with: { [weak self](snapshot) -> Void in
            
            let name = String(describing: snapshot.childSnapshot(forPath: "LostName").value!)
            let place = String(describing: snapshot.childSnapshot(forPath: "LostPlace").value!)
            let date = String(describing: snapshot.childSnapshot(forPath: "LostDate").value!)
            let description = String(describing: snapshot.childSnapshot(forPath: "LostDescription").value!)
            
            self?.LostName.text = name
            self?.LostPlace.text = place
            self?.LostDate.text = date
            self?.LostDescription.text = description
   
        })
        
    }
    
    
    

    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PlaceList.count
    }
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PlaceList[row]
    }
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        LostPlace.text = PlaceList[row]
    }
    
    @IBAction func AddProgrammeButton(_ sender: Any) {
        
        let LostNameString:String = LostName.text!
        
        let folderRef = ref.child("落し物一覧").child(LostKeyReceiveData);
        let key = folderRef.key
        let newFolder = ["LostName": LostNameString, "LostPlace": LostPlace.text ?? [],  "LostDate": LostDate.text ?? [], "LostDescription": LostDescription.text ?? [], "LostNameKey": key!] as [String : Any]
        folderRef.updateChildValues(newFolder)
        
    }
    @IBAction func Delete(_ sender: Any) {
        ref.child("落し物一覧").child(LostKeyReceiveData).removeValue()
    }
    
    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    func LabelShouldReturn(_ label: UILabel) -> Bool {
        // キーボードを閉じる
        label.resignFirstResponder()
        return true
    }
    
    
    
}
