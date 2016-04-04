//
//  ViewController.swift
//  eventos
//
//  Created by usu27 on 24/11/15.
//  Copyright © 2015 usu27. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIGestureRecognizerDelegate {

func gestureRecognizer(gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWithGestureRecognizer
    otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
    }
    
    @IBOutlet weak var minion: UIImageView!
    @IBOutlet weak var piter: UIImageView!
    
    
@IBAction func handleRotation(sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = CGAffineTransformRotate(view.transform, sender.rotation)
                sender.rotation = 0
            }
    }
        
@IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform =
                CGAffineTransformScale(view.transform, sender.scale,
                    sender.scale)
            sender.scale = 1
        }
    }
    

//func CGRectIntersectsRect(sender: minion.frame, sender: piter.frame)->Bool{return true}
    
@IBAction func handlePan(sender: UIPanGestureRecognizer) {
    //print("hola")
        let translation = sender.translationInView(self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x +
                translation.x, y: view.center.y + translation.y)
        }
   //print(sender.view)
    if(sender.view == minion){
        if(piter != nil){
            if(CGRectIntersectsRect(minion.frame, piter.frame)){
                piter.removeFromSuperview()
            }
        }
        
    
    }
   /* if(CGRectIntersectsRect(mario.frame, seta.frame)){
        
    }*/
        sender.setTranslation(CGPointZero, inView: self.view)
        //Volvemos a poner la cantidad de movimiento a 0
        //Comenta la instrucción anterior y prueba la aplicación
    }

    

        override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }


}

