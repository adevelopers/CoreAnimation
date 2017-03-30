//
//  AnimationTwoVC.swift
//  SkillAnimation1
//
//  Created by adeveloper on 29.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit

enum AnimationType:Int{
    case One
    case Two
    case Path = 3
}

class AnimationTwoVC: UIViewController {

    @IBOutlet weak var uiBall: UIImageView!
    var isImpulseEnded:Bool = false
    static var mainTimer:Timer = Timer()
    var point:CGPoint = CGPoint(x: 0, y: 0)
    static var number:Int = 0
    let animaDuration = 2.0
    let animType:AnimationType = .Path
    
    @IBOutlet weak var uiViewBall: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        point = uiBall.center
        
        /*
         let seconds = animaDuration
         AnimationTwoVC.mainTimer = Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(self.updateTask), userInfo: nil, repeats: true);
 */
 }

    @IBAction func startAnimation(_ sender: Any) {
        
       self.animationPath()
        
       
    }
    
    @IBAction func back(_ sender: Any) {
        AnimationTwoVC.mainTimer.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //MARK: animations
    func animationPulsar(){
        AnimationTwoVC.number += 1
        print("task is updated \(AnimationTwoVC.number)")
        
        if self.isImpulseEnded {
            UIView.animate(withDuration: animaDuration){
                self.uiBall.frame.size = CGSize(width: 100, height: 100)
                self.uiBall.center = self.point
            }
        }
        else {
            UIView.animate(withDuration: animaDuration){
                self.uiBall.frame.size = CGSize(width: 200, height: 200)
                self.uiBall.center = self.point
            }
        }
        self.isImpulseEnded = !isImpulseEnded
    }
    
    
    func animationTransform(){
        let fullRotation = CGFloat(M_PI * 2)
        UIView.animate(withDuration: animaDuration){
            self.uiViewBall.transform = CGAffineTransform(rotationAngle: fullRotation)
        }
    }
    
    func animationRotate(){
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.calculationModeLinear
         let fullRotation = CGFloat(M_PI * 2)
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.uiBall.transform = CGAffineTransform(rotationAngle: 1/3 * fullRotation)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
                self.uiBall.transform = CGAffineTransform(rotationAngle: 2/3 * fullRotation)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3){
                self.uiBall.transform = CGAffineTransform(rotationAngle: 3/3 * fullRotation)
            }
            
        }, completion: {finished in
            // any code entered here will be applied
            // once the animation has completed
            
        })
        
    }
    
    
    //MARK: Animation Path
    func animationPath(){
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        var orbita = AnimationPath1()
        orbita.targetPoint = self.uiBall.center
        anim.path = orbita.getPath()
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 3.0
        
        // we add the animation to the squares 'layer' property
        uiBall.layer.add(anim, forKey: "animate position along path")
    }
    
    //MARK: Timer tasks
    func updateTask(timer: Timer){

       self.animationRotate()

    }

}
