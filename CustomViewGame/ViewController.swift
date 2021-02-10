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
        
        for i in 0..<viewCount {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction))
            panGesture.delegate = self
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
        
        for subview in view.subviews {
            if let currentView = gestureView as? CustomView {
                if let targetView = subview as? CustomView {
                    if currentView !== targetView {
                        let currentViewFrame = currentView.frame
                        let targetViewFrame = targetView.frame
                        
                        if (targetViewFrame.intersects(currentViewFrame)) {
                            if !targetView.isHidden {
                                print("current view \(currentView.elementNumberLabel.text!) is inside the view \(targetView.elementNumberLabel.text!)")
                                targetView.workingView.backgroundColor = .blue
                                
                                currentView.isHidden = true
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

