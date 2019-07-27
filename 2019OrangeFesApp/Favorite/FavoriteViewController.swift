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
    @IBOutlet weak var FavoritePicture: UIImageView!
 
    var receiveData: String = ""
    var receiveDescriptionData: String = ""
    var receivePictureStringData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        FavoriteDescriptionText.layer.borderColor = UIColor.orange.cgColor
        // 枠の幅
        FavoriteDescriptionText.layer.borderWidth = 1.0
        // 枠を角丸にする場合
        FavoriteDescriptionText.layer.cornerRadius = 10.0
        FavoriteDescriptionText.layer.masksToBounds = true
        
        FavoriteDescriptionText.text = receiveDescriptionData
        FavoriteTitle.title = receiveData
        FavoritePicture.image = UIImage(named: receivePictureStringData)

    }
}
