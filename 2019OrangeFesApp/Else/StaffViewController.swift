//
//  StaffViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/04.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class StaffViewController: UIViewController {
        
    @IBOutlet weak var StaffTitle: UINavigationItem!
    @IBOutlet weak var StaffImage: UIImageView!
        
    var StaffTitleData: String = ""
    var StaffImageData: String = ""
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StaffTitle.title = StaffTitleData
        StaffImage.image = UIImage(named: "\(StaffImageData)")
            
    }
}
