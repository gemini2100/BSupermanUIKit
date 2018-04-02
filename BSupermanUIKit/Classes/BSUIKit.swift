//
//  BSSpinerButton.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/3/30.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

public class BSUIKit{
    
    static public func createTransitionButton(title:String) -> BSTransitionButton
    {
        let button = BSTransitionButton(frame: CGRect.zero)
        button.backgroundColor = BSThemeColor.BSTitleBlue.color
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = BSFont.BSContent.font
        return button
    }
    
    static public func createRedButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = BSFont.BSTitleTiny.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSRed.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSYellow.color), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary.color), for: .disabled)
        return button
    }
    
    static public func createBlueButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = BSFont.BSTitleTiny.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSBlue.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSYellow.color), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary.color), for: .disabled)
        return button
    }
    
    static public func createGreenButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = BSFont.BSTitleTiny.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSGreen.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSYellow.color), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary.color), for: .disabled)
        return button
    }
    
    static public func createTextField(placeholderString:String) -> UITextField
    {
        // UITextField 的定义
        let textField = BSTextField(frame:CGRect.zero)

        // 设置 样式 (.none 无边框  .line 直线边框  .roundedRect 圆角矩形边框  .bezel 边线+阴影)
        textField.borderStyle = UITextBorderStyle.roundedRect

        // 设置边框宽度
        textField.layer.borderWidth = 2
        // 设置圆角
        textField.layer.cornerRadius = 5.0
        textField.layer.masksToBounds = true
        
        // 设置 提示字
        textField.placeholder = placeholderString
        // 设置 文字颜色   (颜色系统默认为 nil )
        textField.textColor = BSThemeColor.BSTextColorNormal.color
        // 设置 文字大小
        textField.font = UIFont.systemFont(ofSize: 26)
        // 设置 水平对齐
        textField.textAlignment = NSTextAlignment.left // 居中对齐
        // 设置 文字超出文本框时自适应大小
        textField.adjustsFontSizeToFitWidth = true
        // 设置 最小可缩小的字号
        textField.minimumFontSize = 13
        // 设置 清理按钮 (.never 从不出现 .whileEditing 编辑时出现 .unlessEditing 编辑时不出现 编辑完后出现 .always 一直出现)
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        //  设置 键盘样式
        textField.keyboardType = UIKeyboardType.default

        return textField
    }
    
}
