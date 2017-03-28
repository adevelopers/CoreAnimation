//
//  ViewController.swift
//  SkillAnimation1
//
//  Created by adeveloper on 28.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }


    @IBAction func animationOne(_ sender: Any) {
        let vcAnimationOne = AnimationOne(nibName: "AnimationOne", bundle: nil)
        self.present(vcAnimationOne, animated: true, completion: nil)
    }

}

