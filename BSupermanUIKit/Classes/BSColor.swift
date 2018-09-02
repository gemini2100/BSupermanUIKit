//
//  BSColor.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/3/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

public enum BSThemeColor {
    
    case BSColor0                      ///ffffff 颜色 0
    case BSColor1                      ///333333,颜色 1
    case BSColor2                      ///666666,颜色 2
    case BSColor3                      ///999999,颜色 3
    case BSColor4                      ///3399ff 颜色4
    case BSColor5                      ///5f97d8 颜色5
    case BSColor6                      ///ea1f32 红色，颜色6
    case BSColor7                      ///eaa41f 橘黄色，颜色7
    case BSColor8                      ///60a75b 深绿色，颜色8
    
    case BSColorL1                     ///cccccc,分割线 颜色L1
    case BSColorL2                     ///e7e7e7,分割线 颜色L2
    case BSColorL3                     ///f5f5f5,分割线 颜色L3
    case BSColorL4                     ///efeff4,分割线 颜色L4
 



    ///非规范定义的特别颜色
    case BSTaskStatusColor_edf5fd       ///edf5fd,任务状态蓝色背景色,对应边框和文字都是3399ff
    case BSTaskStatusColor_f2fff1       ///f2fff1,任务状态绿色背景色 浅色
    case BSTaskStatusColor_fff5e4       ///fff5e4,任务状态桔色背景色  浅色
    
    public var color: UIColor {
        switch self {
        case .BSColor1:
            return UIColor("333333")
        case .BSColor2:
            return UIColor("666666")
        case .BSColor3:
            return UIColor("999999")
            
        case .BSColorL1:
            return UIColor("cccccc")
        case .BSColorL2:
            return UIColor("e7e7e7")
        case .BSColorL3:
            return UIColor("f5f5f5")
            
        case .BSColorL4:
            return UIColor("efeff4")

            
        case .BSColor4:
            return UIColor("3399ff")
        case .BSColor5:
            return UIColor("5f97d8")
        case .BSColor6:
            return UIColor("ea1f32")
        case .BSColor7:
            return UIColor("eaa41f")
        case .BSColor8:
            return UIColor("60a75b")
            
       
        case .BSColor0:
            return UIColor("ffffff")
   
            
        case .BSTaskStatusColor_edf5fd:
            return UIColor("edf5fd")
   
        case .BSTaskStatusColor_f2fff1:
            return UIColor("f2fff1")

        case .BSTaskStatusColor_fff5e4:
            return UIColor("fff5e4")
      

            
        }
    }
}



