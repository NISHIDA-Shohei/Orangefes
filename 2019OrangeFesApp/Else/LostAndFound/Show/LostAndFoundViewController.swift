//
//  LostAndFoundViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/04.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class LostAndFoundViewController: UIViewController {
    
    @IBOutlet weak var LostName: UINavigationItem!
    @IBOutlet weak var LostPlace: UILabel!
    @IBOutlet weak var LostDate: UILabel!
    @IBOutlet weak var LostDescription: UITextView!
    
    var LostNameReceiveData: String = ""
    var LostKeyReceiveData: String = ""
    
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let refData = Database.database().reference().child("落し物一覧").child(LostKeyReceiveData)
        refData.observe(.value, with: { [weak self](snapshot) -> Void in
            
            let name = String(describing: snapshot.childSnapshot(forPath: "LostName").value!)
            let place = String(describing: snapshot.childSnapshot(forPath: "LostPlace").value!)
            let date = String(describing: snapshot.childSnapshot(forPath: "LostDate").value!)
            let description = String(describing: snapshot.childSnapshot(forPath: "LostDescription").value!)
            
            self?.LostName.title = name
            self?.LostPlace.text = place
            self?.LostDate.text = date
            self?.LostDescription.text = description
            
        })
    }
}
