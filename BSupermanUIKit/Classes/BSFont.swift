//
//  BSFont.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/4/1.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

public enum BSFont {
    case BSTitle            ///字号：30 少数重要标题，导航标题、分类名称
    case BSTitleTiny        ///字号：28 一些重要的文字或操作按钮，首页模块名称
   
    case BSContent          ///字号：26 用于大多数文字，适合大段文字，如资料简介等
    case BSContentTiny      ///字号：24 用于大多数文字，如小标题，模块描述等
    
    case BSSub              ///字号：22 辅助性文字，如次要副标题
    case BSSubTiny          ///字号：20 辅助性文字，备注信息等等
   
    
    public var font: UIFont {
        switch self {
        case .BSTitle:
            return UIFont.systemFont(ofSize: 30)
        case .BSTitleTiny:
            return UIFont.systemFont(ofSize: 28)
            
        case .BSContent:
            return UIFont.systemFont(ofSize: 24)
        case .BSContentTiny:
            return UIFont.systemFont(ofSize: 20)
            
        case .BSSub:
            return UIFont.systemFont(ofSize: 18)
        case .BSSubTiny:
            return UIFont.systemFont(ofSize: 16)

        }
    }
}
