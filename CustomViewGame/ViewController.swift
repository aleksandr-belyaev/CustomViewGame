//
//  ViewController.swift
//  CustomViewGame
//
//  Created by Александр Беляев on 09.02.2021.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    var customView: CustomView!
    let viewCount: Int = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = min(view.bounds.height, view.bounds.width)/4.0
        var x: CGFloat = viewSize/2
        var y: CGFloat = viewSize/2
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        panGesture.delegate = self
        
        for i in 0..<viewCount {
            customView = CustomView(frame: CGRect(x: x, y: y, width: viewSize, height: viewSize), number: String(i+1))
            customView.addGestureRecognizer(panGesture)
            view.addSubview(customView)
            if ((x + viewSize * 1.5) >= view.bounds.maxX) {
                x = viewSize/2
                y = y + viewSize + 5
            } else {
                x = x + viewSize + 5
            }
        }
    }
    
    @objc func panAction(_ gesture: UIPanGestureRecognizer) {
        let vieww = gesture.view as! CustomView
        print(vieww.elementNumberLabel.text!)
    }
}

