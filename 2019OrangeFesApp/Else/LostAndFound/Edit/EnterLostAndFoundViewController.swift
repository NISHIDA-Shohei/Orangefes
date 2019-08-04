//
//  EnterLostAndFoundViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/04.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import Firebase

class EnterLostAndFoundViewController: UIViewController {
    
    @IBOutlet weak var LostName: UITextField!
    @IBOutlet weak var LostPlace: UILabel!
    @IBOutlet weak var LostDate: UITextField!
    @IBOutlet weak var LostDescription: UITextField!
    
    let ref = Database.database().reference()
    
    var getProgrammeName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
