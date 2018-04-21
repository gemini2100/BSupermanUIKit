//
//  BSFont.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/4/1.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

///移动视觉规范 规定字号
public enum BSFont {
     ///字号：36px 少数重要标题，导航标题、分类名称
    case BSTitle
    ///字号：30px 一些重要的文字或操作按钮，首页模块名称
    case BSTitleTiny
   ///字号：28px 用于大多数文字，适合大段文字，如资料简介等
    case BSContent
    ///字号：26px 用于大多数文字，如小标题，模块描述等
    case BSContentTiny
    ///字号：24px 辅助性文字，如次要副标题
    case BSSub
    ///字号：22px 辅助性文字，备注信息等等
    case BSSubTiny
   
    
    public var font: UIFont {
        switch self {
        case .BSTitle:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 36))
        case .BSTitleTiny:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 30))
            
        case .BSContent:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 28))
        case .BSContentTiny:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 26))
            
        case .BSSub:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 24))
        case .BSSubTiny:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 22))

        }
    }
    
    public func pointSizeFrom(pixelSize:Float) -> CGFloat {
        let pointSize:Int = Int(pixelSize * 0.75)
        print("pointSizeFrom pixel:\(pixelSize) to point:\(pointSize)")
        return CGFloat(pointSize)
    }
}
