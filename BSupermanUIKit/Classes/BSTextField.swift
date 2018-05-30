//
//  BSBorderColorTextField.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/3/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

public class BSTextField: UITextField {
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        layer.borderColor = BSThemeColor.BSInactiveGary_cccccc.color.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.masksToBounds = true

        let paddingView = UIView(frame: CGRect(x:0,y: 0, width:5, height:1))
        leftView = paddingView
        leftViewMode = UITextFieldViewMode.always
    }
    
    required public init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func becomeFirstResponder() -> Bool {
        let becomeFirstResponder = super.becomeFirstResponder()
        
        if becomeFirstResponder {
            layer.borderColor = BSThemeColor.BSBlue_5f97d8.color.cgColor
        }        
        return becomeFirstResponder
    }
    
    override public func resignFirstResponder() -> Bool {
        
        let resignFirstResponder = super.resignFirstResponder()
        if resignFirstResponder {
            layer.borderColor = BSThemeColor.BSInactiveGary_cccccc.color.cgColor
        }
        return resignFirstResponder
    }
    
    /// 增加了文字的内边距
    override public func textRect(forBounds bounds: CGRect) -> CGRect{
        
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 5, 0, 5))
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect{
        
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 5, 0, 5))
    }
    
}


