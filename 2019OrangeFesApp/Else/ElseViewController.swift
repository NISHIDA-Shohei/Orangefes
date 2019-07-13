//
//  ElseViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/03.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ElseViewController: UIViewController {
    
    @IBOutlet weak var ElseTitle: UINavigationItem!
    @IBOutlet weak var ElseImage: UIImageView!
    
    var ElseTitleData: String = ""
    var ElseImageData: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        ElseTitle.title = ElseTitleData
        ElseImage.image = UIImage(named: "\(ElseImageData)")
        
        
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
