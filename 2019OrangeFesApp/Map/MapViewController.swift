//
//  MapViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var MapTitle: UINavigationItem!
    @IBOutlet weak var MapPicture: UIImageView!
    
    
    var receiveData: String = ""
    var receiveMap: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

  
        
        MapTitle.title = receiveData
        MapPicture.image = UIImage(named: "\(receiveMap)")
    }
    
    
}
