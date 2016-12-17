//
//  ViewController.swift
//  Gravity Blocks
//
//  Created by JOGENDRA on 12/12/16.
//  Copyright © 2016 Jogendra Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var greenSquare : UIView?
    var redSquare : UIView?
    var blueSquare : UIView?
    var blackSquare : UIView?
    var animator : UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create the shapes of blocks
        var dimen = CGRect(x: 25, y: 25, width: 30, height: 30)
        greenSquare = UIView(frame: dimen)
        greenSquare?.backgroundColor = UIColor.green
        
        dimen = CGRect(x: 75, y: 25,width: 60, height: 60)
        redSquare = UIView(frame: dimen)
        redSquare?.backgroundColor = UIColor.red
        
        dimen = CGRect(x: 160, y: 25,width: 90, height: 90)
        blueSquare = UIView(frame: dimen)
        blueSquare?.backgroundColor = UIColor.blue
        
        dimen = CGRect(x: 270, y: 25,width: 120, height: 120)
        blackSquare = UIView(frame: dimen)
        blackSquare?.backgroundColor = UIColor.black

        
        //Add them to the screen
        self.view.addSubview(greenSquare!)
        self.view.addSubview(redSquare!)
        self.view.addSubview(blueSquare!)
        self.view.addSubview(blackSquare!)

        
        //Initialixze the animator
        animator = UIDynamicAnimator(referenceView: self.view)
        
        //Add Gravity to blocks
        let gravity = UIGravityBehavior(items: [greenSquare!, redSquare!, blueSquare!, blackSquare!])
        let direction = CGVector(dx: 0.0, dy: 1.0)
        gravity.gravityDirection = direction
        
        //collision
        let boundries = UICollisionBehavior(items: [greenSquare!, redSquare!, blueSquare!, blackSquare!])
        boundries.translatesReferenceBoundsIntoBoundary = true
        
        //Elasticity
        let bounce = UIDynamicItemBehavior(items: [greenSquare!, redSquare!, blueSquare!, blackSquare!])
        bounce.elasticity = 0.8
        
        animator?.addBehavior(bounce)
        animator?.addBehavior(boundries)
        animator?.addBehavior(gravity)
    }


}

