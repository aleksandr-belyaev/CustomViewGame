//
//  ViewController.swift
//  CustomViewGame
//
//  Created by Александр Беляев on 09.02.2021.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    var customView: CustomView!
    var panGesture = UIPanGestureRecognizer()
    let viewCount: Int = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = min(view.bounds.height, view.bounds.width)/4.0
        var x: CGFloat = viewSize/2
        var y: CGFloat = viewSize/2
        
        for i in 0..<viewCount {
            customView = CustomView(frame: CGRect(x: x, y: y, width: viewSize, height: viewSize), number: String(i+1))
            view.addSubview(customView)
            
            if ((x + viewSize * 1.5) >= view.bounds.maxX) {
                x = viewSize/2
                y = y + viewSize + 5
            } else {
                x = x + viewSize + 5
            }
        }
        customView.addGestureRecognizer(panGesture)
    }
    
    
    @objc func handlePanGesture() {
        
    }

    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        let firstViewFrame = customView.frame
        let secondViewFrame = customView.frame
        
        let gestureTranslation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.center = CGPoint (
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else {
            return
        }
        
        print("Blue view panned")
        
        for value in Int(secondViewFrame.minY)...Int(secondViewFrame.maxY) {
            if Int(firstViewFrame.origin.y) == value {
                customView.isHidden = true
            }
        }
        
    }
    
}

