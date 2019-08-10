//
//  AgreementViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/08/10.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class AgreementViewController: UIViewController {
    
    @IBOutlet weak var AgreementTitleLabel: UINavigationItem!
    
    var AgreementTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        AgreementTitleLabel.title = AgreementTitle

    }
    
}
