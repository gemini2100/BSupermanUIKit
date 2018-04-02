//
//  TransitionButton.swift
//  TransitionButton
//
//  Created by Alaeddine M. on 11/1/15.
//  Copyright (c) 2015 Alaeddine M. All rights reserved.
//  REF:https://github.com/AladinWay/TransitionButton

import Foundation
import UIKit

/**
Stop animation style of the `TransitionButton`.
 
 - normal: just revert the button to the original state.
 - shake: revert the button to original state and make a shaoe animation, useful to reflect that something went wrong
 */
public enum StopAnimationStyle {
    case normal
    case shake
}

/// UIButton sublass for loading and transition animation. Useful for network based application or where you need to animate an action button while doing background tasks.
 
public class BSTransitionButton : UIButton,  CAAnimationDelegate {
    
    /// the corner radius value to have a button with rounded corners.
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    private lazy var spiner: SpinerLayer = {
        let spiner = SpinerLayer(frame: self.frame)
        self.layer.addSublayer(spiner)
        return spiner
    }()
    
    private var cachedTitle: String?
    private var cachedImage: UIImage?
    
    private let springGoEase:CAMediaTimingFunction  = CAMediaTimingFunction(controlPoints: 0.45, -0.36, 0.44, 0.92)
    private let shrinkCurve:CAMediaTimingFunction   = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    private let expandCurve:CAMediaTimingFunction   = CAMediaTimingFunction(controlPoints: 0.95, 0.02, 1, 0.05)
    private let shrinkDuration: CFTimeInterval      = 0.1
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setup()
    }
    
    private func setup() {
        self.clipsToBounds  = true
        self.setBackgroundImage(getDisabledBackgroundColor(color: UIColor("cccccc")), for: .disabled)
    }
    
    /**
     start animating the button, before starting a task, exemple: before a network call.
     */
    open func startAnimation() {
        self.isUserInteractionEnabled = false // Disable the user interaction during the animation
        self.cachedTitle            = title(for: .normal)  // cache title before animation of spiner
        self.cachedImage            = image(for: .normal)  // cache image before animation of spiner
        
        self.setTitle("",  for: .normal)                    // place an empty string as title to display a spiner
        self.setImage(nil, for: .normal)                    // remove the image, if any, before displaying the spinner
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.layer.cornerRadius = self.frame.height / 2 // corner radius should be half the height to have a circle corners
        }, completion: { completed -> Void in
            self.shrink()   // reduce the width to be equal to the height in order to have a circle
            self.spiner.animation() // animate spinner
        })
    }
    
    /**
     stop animating the button.
     
     - Parameter animationStyle: the style of the stop animation.
     - Parameter revertAfterDelay: revert the button to the original state after a delay to give opportunity to custom transition.
     - Parameter completion: a callback closure to be called once the animation finished, it may be useful to transit to another view controller, example transit to the home screen from the login screen.
     
     */
    open func stopAnimation(animationStyle:StopAnimationStyle = .normal, revertAfterDelay delay: TimeInterval = 1.0, completion:(()->Void)? = nil) {
        
        switch animationStyle {
        case .normal:
            completion?()
            // We return to original state after a delay to give opportunity to custom transition
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.setOriginalState()
            }
        case .shake:
            completion?()
            // We return to original state after a delay to give opportunity to custom transition
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.setOriginalState()
                self.shakeAnimation()
            }
        }
    }
    
    private func shakeAnimation() {
        let keyFrame = CAKeyframeAnimation(keyPath: "position")
        let point = self.layer.position
        keyFrame.values = [NSValue(cgPoint: CGPoint(x: CGFloat(point.x), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 10), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 10), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 10), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 10), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 10), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 10), y: CGFloat(point.y))),
                           NSValue(cgPoint: point)]
        
        keyFrame.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        keyFrame.duration = 0.7
        self.layer.position = point
        self.layer.add(keyFrame, forKey: keyFrame.keyPath)
    }
    
    private func setOriginalState() {
        self.animateToOriginalWidth()
        self.spiner.stopAnimation()
        self.setTitle(self.cachedTitle, for: .normal)
        self.setImage(self.cachedImage, for: .normal)
        self.isUserInteractionEnabled = true // enable again the user interaction
        self.layer.cornerRadius = self.cornerRadius
    }
 
    private func animateToOriginalWidth() {
        let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
        shrinkAnim.fromValue = (self.bounds.height)
        shrinkAnim.toValue = (self.bounds.width)
        shrinkAnim.duration = shrinkDuration
        shrinkAnim.timingFunction = shrinkCurve
        shrinkAnim.fillMode = kCAFillModeForwards
        shrinkAnim.isRemovedOnCompletion = false
        self.layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
    }
    
    private func shrink() {
        let shrinkAnim                   = CABasicAnimation(keyPath: "bounds.size.width")
        shrinkAnim.fromValue             = frame.width
        shrinkAnim.toValue               = frame.height
        shrinkAnim.duration              = shrinkDuration
        shrinkAnim.timingFunction        = shrinkCurve
        shrinkAnim.fillMode              = kCAFillModeForwards
        shrinkAnim.isRemovedOnCompletion = false
        
        layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
    }
    
    func getDisabledBackgroundColor(color: UIColor) -> UIImage?
    {
        let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image!.cgImage else { return nil }
        return UIImage(cgImage: cgImage)
    }
    
}

class SpinerLayer: CAShapeLayer {
    
    init(frame:CGRect) {
        super.init()
        let radius:CGFloat = (frame.height / 2) * 0.5
        self.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let startAngle = 0 - Double.pi/2
        let endAngle = Double.pi * 2 - Double.pi/2
        let clockwise: Bool = true
        self.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise).cgPath
        
        self.fillColor = nil
        self.strokeColor = UIColor.white.cgColor
        self.lineWidth = 1
        
        self.strokeEnd = 0.4
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation() {
        self.isHidden = false
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.fromValue = 0
        rotate.toValue = Double.pi * 2
        rotate.duration = 0.4
        rotate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        rotate.repeatCount = HUGE
        rotate.fillMode = kCAFillModeForwards
        rotate.isRemovedOnCompletion = false
        self.add(rotate, forKey: rotate.keyPath)
        
    }
    
    func stopAnimation() {
        self.isHidden = true
        self.removeAllAnimations()
    }
}
