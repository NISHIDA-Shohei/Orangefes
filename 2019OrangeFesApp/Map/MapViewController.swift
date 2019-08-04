//
//  MapViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var MapTitle: UINavigationItem!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var receiveData: String = ""
    var receiveMap: String = ""
    
    var selectedImg: UIImage!
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapTitle.title = receiveData
        
        // デリゲートを設定
        scrollView.delegate = self
        
        // 最大・最小の大きさを決める
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1.0
        
        // imageViewを生成
        imageView = UIImageView()
        imageView.frame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height)
        scrollView.addSubview(imageView)
        
        // imageViewにセグエで飛ばされてきた画像を設定
        imageView.image = UIImage(named: "\(receiveMap)")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        // ダブルタップ対応
        let doubleTap = UITapGestureRecognizer(target:self,action:#selector(MapViewController.doubleTap(gesture:)))
        doubleTap.numberOfTapsRequired = 2
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(doubleTap)
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("end zoom")
    }
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("start zoom")
    }
    @objc func doubleTap(gesture:UITapGestureRecognizer) -> Void {
        if(self.scrollView.zoomScale < 3){
            let newScale:CGFloat = self.scrollView.zoomScale*3
            let zoomRect:CGRect = self.zoomForScale(scale:newScale, center:gesture.location(in:gesture.view))
            self.scrollView.zoom(to:zoomRect, animated: true)
        } else {
            self.scrollView.setZoomScale(1.0, animated: true)
        }
    }
    func zoomForScale(scale:CGFloat, center: CGPoint) -> CGRect{
        var zoomRect: CGRect = CGRect()
        zoomRect.size.height = self.scrollView.frame.size.height / scale
        zoomRect.size.width = self.scrollView.frame.size.width  / scale
        
        zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
        zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        
        return zoomRect
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
