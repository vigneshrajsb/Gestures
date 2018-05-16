//
//  ViewController.swift
//  Gestures
//
//  Created by Vigneshraj Sekar Babu on 5/15/18.
//  Copyright © 2018 Vigneshraj Sekar Babu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    

 
    @IBOutlet weak var bananaView: UIImageView!
    @IBOutlet weak var monkeyView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGestures(view: monkeyView)
        loadGestures(view: bananaView)
 
    }
    
    func loadGestures(view : UIView) {
        let tapGesture =  UITapGestureRecognizer(target: self,
                                                 action:#selector(tapGestureHandler))
        
      view.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    @IBAction func panGestureHandler(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x,
                                  y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if sender.state == .ended {
            if view.frame.intersects(monkeyView.frame) {
                UIView.animate(withDuration: 0.3) {
                    self.bananaView.alpha = 0.0
                }
            }
        }
        
    }
    
    @IBAction func pinchGestureHandler(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            
        }
        sender.scale = 1
        
    }
    
    @IBAction func rotateGestureHandler(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
        }
        sender.rotation = 0
    }
    
    @IBAction func tapGestureHandler(_ sender: UITapGestureRecognizer) {
    
        print("tap method")
 
    }
    
    // UI Gesture delegate method to use simultaneous gestures
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer is UIPanGestureRecognizer || gestureRecognizer is UIRotationGestureRecognizer) {
           // print("multiple")

        return true
            
        } else {
            
            return false
         
        }
    }
    
}


