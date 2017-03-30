//
//  AnimationPathProtocol.swift
//  SkillAnimation1
//
//  Created by adeveloper on 30.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit

protocol AnimationPathProtocol {
    func getPath()-> CGPath
}



struct AnimationPath1: AnimationPathProtocol {

    init(){
        
    }

   public var targetPoint:CGPoint =  CGPoint(x: 0, y: 0)
    
    func getPath() -> CGPath {

        let path = UIBezierPath()
        path.move(to: targetPoint)
        
            path.addCurve(to: CGPoint(x: targetPoint.x, y: targetPoint.y),
                          controlPoint1: CGPoint(x: -436, y: 373),
                          controlPoint2: CGPoint(x: 501, y: 410)
            )
            return path.cgPath
    }
}
