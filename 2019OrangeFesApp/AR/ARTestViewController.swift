//
//  ARTestViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/09/01.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ARTestViewController: UIViewController, ARSCNViewDelegate  {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var TakeImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let result = sceneView.hitTest(touch.location(in: sceneView), types: [ARHitTestResult.ResultType.featurePoint])
        guard let hitResult = result.last else {return}
        let hitTransform = SCNMatrix4(hitResult.worldTransform)
        let hitVector = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43)
        createEcoPyon(position: hitVector)
    }
    
    func createEcoPyon(position: SCNVector3){
        
        let scene = SCNScene(named: "art.scnassets/EcoPyonV2.scn")!
        let node = scene.rootNode.childNode(withName: "mesh_ekopyon", recursively: false)!
        let node2 = scene.rootNode.childNode(withName: "pSphere1", recursively: false)!
        node.position = position
        node2.position = position
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(node2)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configration = ARWorldTrackingConfiguration()
        sceneView.session.run(configration )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    @IBAction func TakeImage(_ sender: Any) {
        let noImage = UIImage(named: "hoge")
        let setImage = UIImage(named: "camera@3x.png")
        
        TakeImageButton.setBackgroundImage(noImage, for: .normal)
        
        //コンテキスト開始
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
        //viewを書き出す
        self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
        // imageにコンテキストの内容を書き出す
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        //コンテキストを閉じる
        UIGraphicsEndImageContext()
        // imageをカメラロールに保存
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        TakeImageButton.setBackgroundImage(setImage, for: .normal)
    }
    @IBAction func ResetNode(_ sender: Any) {
        let scene = SCNScene(named: "art.scnassets/EcoPyonV2.scn")!
        let node = scene.rootNode.childNode(withName: "mesh_ekopyon", recursively: false)!
        let node2 = scene.rootNode.childNode(withName: "pSphere1", recursively: false)!
        node.removeFromParentNode()
        node2.removeFromParentNode()
    }
    

}
