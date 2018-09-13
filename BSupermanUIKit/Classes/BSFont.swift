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
    ///字号：50px 特大标题，模块描述
    case BSTitle50
    ///字号：36px 少数重要标题，导航标题、分类名称
    case BSTitle36
    ///字号：32px 少数重要标题，导航标题、分类名称
    case BSTitle32
    ///字号：30px 一些重要的文字或操作按钮，首页模块名称
    case BSTitle30

    ///字号：28px 用于大多数文字，适合大段文字，如资料简介等
    case BSContent28
    ///字号：26px 用于大多数文字，如小标题，模块描述等
    case BSContent26
    ///字号：24px 用于大多数文字，如小标题，模块描述等
    case BSContent24
    ///字号：22px 用于大多数文字，如小标题，模块描述等
    case BSContent22

    
    public var font: UIFont {
        switch self {
        case .BSTitle50:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 50))
        case .BSTitle36:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 36))
        case .BSTitle32:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 32))
        case .BSTitle30:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 30))
            
        case .BSContent28:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 28))
        case .BSContent26:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 26))
        case .BSContent24:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 24))
        case .BSContent22:
            return UIFont.systemFont(ofSize: pointSizeFrom(pixelSize: 22))

        }
    }
    
    public func pointSizeFrom(pixelSize:Float) -> CGFloat {
        let pointSize:Int = Int(pixelSize / 2) + 1
        return CGFloat(pointSize)
    }
}
