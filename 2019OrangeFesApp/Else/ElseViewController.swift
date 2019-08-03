//
//  ElseViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/03.
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

        // Do any additional setup after loading the view.
        
        
        StaffTitle.title = StaffTitleData
        StaffImage.image = UIImage(named: "\(StaffImageData)")
        
        
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
