//
//  TimeTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/07/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class TimeTableViewController: UIViewController {
    
    @IBOutlet weak var TimeTableImageView: UIImageView!
    
    var TimeTableReceiveData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimeTableImageView.image = UIImage(named: TimeTableReceiveData)

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
