//
//  PanGesture.swift
//  CustomViewGame
//
//  Created by Александр Беляев on 10.02.2021.
//

import UIKit

class PanGesture: UIPanGestureRecognizer {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        guard let touch = touches.first else {
            return
        }
        let touchedView = touch.view as! CustomView
        print("RABOTAET BLYA!")
        print(touchedView.elementNumberLabel.text!)
    }

}
