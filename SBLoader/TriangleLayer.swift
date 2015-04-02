//
//  TriangleLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-19.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
    
    let innerPadding: CGFloat = 30.0
    
    override init!() {
        super.init()
        fillColor = Colors.red.CGColor
        strokeColor = Colors.red.CGColor
        lineWidth = 7.0
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        path = trianglePathSmall().CGPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func trianglePathSmall() -> UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0 + innerPadding, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    func trianglePathLeftExtension() -> UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    func trianglePathRightExtension() -> UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    func trianglePathTopExtension() -> UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5))
        trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }

    func animate() {
        var triangeAnimationLeft: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangeAnimationLeft.fromValue = trianglePathSmall().CGPath
        triangeAnimationLeft.toValue = trianglePathLeftExtension().CGPath
        triangeAnimationLeft.beginTime = 0.0
        triangeAnimationLeft.duration = 0.3
        
        var triangeAnimationRight: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangeAnimationRight.fromValue = trianglePathLeftExtension().CGPath
        triangeAnimationRight.toValue = trianglePathRightExtension().CGPath
        triangeAnimationRight.beginTime = triangeAnimationLeft.beginTime + triangeAnimationLeft.duration
        triangeAnimationRight.duration = 0.25
        
        var triangeAnimationTop: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangeAnimationTop.fromValue = trianglePathRightExtension().CGPath
        triangeAnimationTop.toValue = trianglePathTopExtension().CGPath
        triangeAnimationTop.beginTime = triangeAnimationRight.beginTime + triangeAnimationRight.duration
        triangeAnimationTop.duration = 0.20

        var triangeAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        triangeAnimationGroup.animations = [triangeAnimationLeft, triangeAnimationRight, triangeAnimationTop]
        triangeAnimationGroup.duration = triangeAnimationTop.beginTime + triangeAnimationTop.duration
        triangeAnimationGroup.fillMode = kCAFillModeForwards
        triangeAnimationGroup.removedOnCompletion = false
        addAnimation(triangeAnimationGroup, forKey: nil)
    }
}
