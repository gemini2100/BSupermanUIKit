//
//  BSColor.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/3/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

public enum BSThemeColor {
    
    case BSTextColorTitle_333333       ///333333,重要级文字、标题颜色
    case BSTextColorNormal_666666      ///666666,普通无级别段落文字颜色
    case BSTextColorTiny_999999        ///999999,辅助次级字体颜色,灰色
    
    
    case BSDivLineColorDark_cccccc     ///cccccc,分割线深色
    case BSDivLineColorMid_e7e7e7      ///e7e7e7,分割线中色
    case BSDivLineColorLight_f5f5f5    ///f5f5f5,分割线浅色
    
    case BSModuleDivColor_efeff4       ///efeff4,用于模块分割底色
    case BSModuleBGColor_ededed        ///ededed,个别内容区域底色
    
    case BSTitleBlue_3399ff            ///3399ff 蓝色，特别强调的文字、按钮、图标
    case BSBlue_5f97d8                 ///5f97d8 蓝色，中性类标识
    case BSRed_ea1f32                  ///ea1f32 红色，退出、删除、错误、警告
    case BSYellow_eaa41f               ///eaa41f 橘黄色，用于警示等引起注意类标识
    case BSGreen_60a75b                ///60a75b 深绿色，用于成功、完成、进行等肯定类标识
    
    case BSInactiveGary_cccccc         ///cccccc 用于失去焦点、禁用颜色
    case BSWhite_ffffff                ///ffffff 白色


    ///非规范定义的特别颜色
    //任务面板中的颜色规范
    case BSTextColor_373a3d             ///373a3d,任务信息面板,黑色
    case BSTaskStatusColor_edf5fd       ///edf5fd,任务状态蓝色背景色,对应边框和文字都是3399ff
    case BSTaskStatusColor_33a72d       ///33a72d,任务状态绿色背景色
    case BSTaskStatusColor_f2fff1       ///33a72d,任务状态绿色背景色
    case BSTaskStatusColor_8e8e8e       ///8e8e8e,任务状态灰色背景色
    
    case BSTaskStatusColor_fff5e4       ///fff5e4,任务状态桔色背景色
    case BSTaskStatusColor_ffa200       ///ffa200,任务状态桔色背景色
    
    public var color: UIColor {
        switch self {
        case .BSTextColorTitle_333333:
            return UIColor("333333")
        case .BSTextColorNormal_666666:
            return UIColor("666666")
        case .BSTextColorTiny_999999:
            return UIColor("999999")
            
        case .BSDivLineColorDark_cccccc:
            return UIColor("cccccc")
        case .BSDivLineColorMid_e7e7e7:
            return UIColor("e7e7e7")
        case .BSDivLineColorLight_f5f5f5:
            return UIColor("f5f5f5")
            
        case .BSModuleDivColor_efeff4:
            return UIColor("efeff4")
        case .BSModuleBGColor_ededed:
            return UIColor("ededed")
            
        case .BSTitleBlue_3399ff:
            return UIColor("3399ff")
        case .BSBlue_5f97d8:
            return UIColor("5f97d8")
        case .BSRed_ea1f32:
            return UIColor("ea1f32")
        case .BSYellow_eaa41f:
            return UIColor("eaa41f")
        case .BSGreen_60a75b:
            return UIColor("60a75b")
            
        case .BSInactiveGary_cccccc:
            return UIColor("cccccc")
        case .BSWhite_ffffff:
            return UIColor("ffffff")
        case .BSTextColor_373a3d:
            return UIColor("373a3d")
            
        case .BSTaskStatusColor_edf5fd:
            return UIColor("edf5fd")
        case .BSTaskStatusColor_33a72d:
            return UIColor("33a72d")
        case .BSTaskStatusColor_f2fff1:
            return UIColor("f2fff1")
        case .BSTaskStatusColor_8e8e8e:
            return UIColor("8e8e8e")
        case .BSTaskStatusColor_fff5e4:
            return UIColor("fff5e4")
        case .BSTaskStatusColor_ffa200:
            return UIColor("ffa200")

            
        }
    }
}



