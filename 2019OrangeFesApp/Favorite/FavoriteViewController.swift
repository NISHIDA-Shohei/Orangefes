//
//  FavoriteViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/06.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var FavoriteTitle: UINavigationItem!
    @IBOutlet weak var FavoriteDescriptionText: UITextView!
 
    
    var receiveData: String = ""
    var receiveDescriptionData: String = ""

    

    override func viewDidLoad() {
        super.viewDidLoad()

        FavoriteDescriptionText.text = receiveDescriptionData
        FavoriteTitle.title = receiveData

        // Do any additional setup after loading the view.
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
