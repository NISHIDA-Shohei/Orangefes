//
//  LostEnterViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/13.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class LostEnterViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let ref = Database.database().reference() //FirebaseDatabaseのルートを指定
    
    @IBOutlet weak var LostItemLabel: UITextField!
    @IBOutlet var LostPlaceLabel: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    
    let PlaceList: [String] = ["１号館","２号館","３号館","４号館","体育館","グラウンド","校門付近","M棟","その他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LostItemLabel.delegate = self as UITextFieldDelegate //デリゲートをセット
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return PlaceList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return PlaceList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        LostPlaceLabel.text = PlaceList[row]
        
    }
    


    @IBAction func EnterButton(_ sender: Any) {
        //投稿のためのメソッド
        create()
    }
    
    //データの送信のメソッド
    func create() {
        //textFieldになにも書かれてない場合は、その後の処理をしない
        //childByAutoId()でユーザーIDの下に、IDを自動生成してその中にデータを入れる

        let folderRef = ref.child("ExploreFolders").childByAutoId();
        let newFolder = ["Name": LostItemLabel.text ?? [], "Place": LostPlaceLabel.text ?? [], "imageName":"Pic1.png", "when":"10:56"] as [String : Any]
        folderRef.updateChildValues(newFolder)
        
        //self.ref.child((Auth.auth().currentUser?.uid)!).childByAutoId().setValue(["user": (Auth.auth().currentUser?.uid)!,"content": text])//
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
