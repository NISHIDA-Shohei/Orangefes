//
//  MainProgrammeViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/09.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class MainProgrammeViewController: UIViewController {

    @IBOutlet weak var NavigationTitle: UINavigationItem!
    // this is not yet completed
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    @IBAction func tapSegmentControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func updateView() {
        if segmentControl.selectedSegmentIndex == 0 {
            NavigationTitle.title = "団体一覧"
            remove(asChildViewController: SecondProgrammeViewController)
            remove(asChildViewController: ThirdProgrammeViewController)
            add(asChildViewController: FirstProgrammeViewController)
        } else if segmentControl.selectedSegmentIndex == 1{
            NavigationTitle.title = "公演団体"
            remove(asChildViewController: FirstProgrammeViewController)
            remove(asChildViewController: ThirdProgrammeViewController)
            add(asChildViewController: SecondProgrammeViewController)
        } else {
            NavigationTitle.title = "公演時間"
            remove(asChildViewController: FirstProgrammeViewController)
            remove(asChildViewController: SecondProgrammeViewController)
            add(asChildViewController: ThirdProgrammeViewController)
        }
    }
    
    
    
    private lazy var FirstProgrammeViewController: FirstProgrammeViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "FirstProgrammeViewController") as! FirstProgrammeViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var SecondProgrammeViewController: SecondProgrammeViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "SecondProgrammeViewController") as! SecondProgrammeViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var ThirdProgrammeViewController: ThirdProgrammeViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "ThirdProgrammeViewController") as! ThirdProgrammeViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    
    private func add(asChildViewController viewController: UIViewController) {
        // 子ViewControllerを追加
        addChild(viewController)
        // Subviewとして子ViewControllerのViewを追加
        view.addSubview(viewController.view)
        // 子Viewの設定
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // 子View Controllerへの通知
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // 子View Controllerへの通知
        viewController.willMove(toParent: nil)
        // 子ViewをSuperviewから削除
        viewController.view.removeFromSuperview()
        // 子View Controllerへの通知
        viewController.removeFromParent()
    }
    
}
