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
import Firebase
import FirebaseUI

class ARTestViewController: UIViewController, ARSCNViewDelegate  {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var TakeImageButton: UIButton!
    
    private var node: SCNNode?
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        
        // タップイベントハンドラの登録
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        sceneView.addGestureRecognizer(tapGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressView))
        sceneView.addGestureRecognizer(longPressGesture)

    }
    
    @objc func tapView(sender: UITapGestureRecognizer) {
        let result = sceneView.hitTest(sender.location(in: sceneView), types: [ARHitTestResult.ResultType.featurePoint])
        guard let hitResult = result.last else {return}
        //let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
        //let rotateTransform = simd_mul(hitResult.worldTransform, rotate)
        let hitTransform = SCNMatrix4(hitResult.worldTransform)
        let hitVector = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43)
        createEcoPyon(position: hitVector)
    }
    
    func createEcoPyon(position: SCNVector3){
        let scene = SCNScene(named: "art.scnassets/Ecopyon_Final.scn")!
        node = scene.rootNode.childNode(withName: "model_ekopyon", recursively: false)!
        node!.position = position
        sceneView.scene.rootNode.addChildNode(node!)
    }
    
    
    @objc func longPressView(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let location = sender.location(in: sceneView)
            let hitTest  = sceneView.hitTest(location)
            if let result = hitTest.first  {
                if result.node.name == "model_ekopyon"
                {
                    result.node.removeFromParentNode();
                }
            }
        }
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
        let setImage = UIImage(named: "camera")
        
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
    
    private func reset() {
        //nodeの全削除
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode() }
    }
    

    
    
    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
    
    
    


}
