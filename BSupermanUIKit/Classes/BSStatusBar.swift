//
//  BSStatusBar.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/5/17.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

public class BSStatusBar: UIView {
    private var _statusBarHeight = 20 //状态栏高度目前除了iphoneX都是20pt
    
    /// 返回状态栏高度
    public static var statusBarHeight: CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
    }

    public required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(frame: CGRect) {       

        super.init(frame: frame)
        backgroundColor = BSThemeColor.BSRed_ea1f32.color  //BSTitleBlue
        
    }
}

