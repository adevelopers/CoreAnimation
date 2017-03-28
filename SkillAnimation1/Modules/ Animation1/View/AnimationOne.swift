//
//  AnimationOne.swift
//  SkillAnimation1
//
//  Created by adeveloper on 28.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit


class AnimationOne: UIViewController {

    @IBOutlet weak var uiLogo: UIImageView!
    @IBOutlet weak var uiTarget: UIButton!
    
    var isShowed:Bool = true
    var isMoved:Bool = true
    var prevPoint:CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.prevPoint = uiLogo.center
        
    }


    @IBAction func clickOnStartAnimation(_ sender: Any) {
        
            self.animationMove()
            self.animationFade()
        
    }
    
    
    
    func animationMove(){
        let timeDuration = 2.0
        var newPoint:CGPoint = CGPoint(x: 0, y: 0)
        
        if self.isMoved {
           newPoint = self.uiTarget.center
            self.isMoved = false
        }
        else{
            newPoint = prevPoint
            self.isMoved = true
        }
        
        UIView.animate(withDuration: timeDuration){

    
            self.uiLogo.center = newPoint
        }
    }
    
    
    func animationFade(){
        let step1 = 3.0
        var alpha = 1.0
        
        if self.isShowed
        {
            alpha = 0.0
            self.isShowed = false
        }
        else
        {
            alpha = 1.0
            self.isShowed = true
        }
        
        UIView.animate(withDuration: step1, animations: {
            
            self.uiLogo.alpha = CGFloat(alpha)
            self.uiLogo.layoutIfNeeded()
        })
        
        print("status: \(self.isShowed)")
    }
}
