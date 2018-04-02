//
//  BSColor.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/3/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

enum BSThemeColor {
    
    case BSTextColorTitle       ///333333,重要级文字、标题颜色
    case BSTextColorNormal      ///666666,普通无级别段落文字颜色
    case BSTextColorTiny        ///999999,辅助次级字体颜色
    
    case BSDivLineColorDark     ///cccccc,分割线深色
    case BSDivLineColorMid      ///e7e7e7,分割线中色
    case BSDivLineColorLight    ///f5f5f5,分割线浅色
    
    case BSModuleDivColor       ///efeff4,用于模块分割底色
    case BSModuleBGColor        ///ededed,个别内容区域底色
    
    case BSTitleBlue            ///3399ff 蓝色，特别强调的文字、按钮、图标
    case BSBlue                 ///5f97d8 蓝色，中性类标识
    case BSRed                  ///ea1f32 红色，退出、删除、错误、警告
    case BSYellow               ///eaa41f 用于警示等引起注意类标识
    case BSGreen                ///60a75b 用于成功、完成、进行等肯定类标识
    
    case BSInactiveGary         ///cccccc 用于失去焦点、禁用颜色
    
    var color: UIColor {
        switch self {
        case .BSTextColorTitle:
            return UIColor("333333")
        case .BSTextColorNormal:
            return UIColor("666666")
        case .BSTextColorTiny:
            return UIColor("999999")
            
        case .BSDivLineColorDark:
            return UIColor("cccccc")
        case .BSDivLineColorMid:
            return UIColor("e7e7e7")
        case .BSDivLineColorLight:
            return UIColor("f5f5f5")
            
        case .BSModuleDivColor:
            return UIColor("efeff4")
        case .BSModuleBGColor:
            return UIColor("ededed")
            
        case .BSTitleBlue:
            return UIColor("3399ff")
        case .BSBlue:
            return UIColor("5f97d8")
        case .BSRed:
            return UIColor("ea1f32")
        case .BSYellow:
            return UIColor("eaa41f")
        case .BSGreen:
            return UIColor("60a75b")
            
        case .BSInactiveGary:
            return UIColor("cccccc")
            
            
        }
    }
}



