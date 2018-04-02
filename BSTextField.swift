//
//  BSBorderColorTextField.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/3/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class BSTextField: UITextField {
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        layer.borderColor = BSThemeColor.BSInactiveGary.color.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func becomeFirstResponder() -> Bool {
        let becomeFirstResponder = super.becomeFirstResponder()
        
        if becomeFirstResponder {
            layer.borderColor = BSThemeColor.BSBlue.color.cgColor
        }        
        return becomeFirstResponder
    }
    
    override func resignFirstResponder() -> Bool {
        
        let resignFirstResponder = super.resignFirstResponder()
        if resignFirstResponder {
            layer.borderColor = BSThemeColor.BSInactiveGary.color.cgColor
        }
        return resignFirstResponder
    }
    
}


