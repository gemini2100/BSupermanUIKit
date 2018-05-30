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
        button.backgroundColor = BSThemeColor.BSTitleBlue_3399ff.color
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = BSFont.BSContent28.font
        return button
    }
    
    static public func createRedButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSWhite_ffffff.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle30.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSRed_ea1f32.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSYellow_eaa41f.color), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary_cccccc.color), for: .disabled)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }
    
    static public func createBlueButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSWhite_ffffff.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle30.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSBlue_5f97d8.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSYellow_eaa41f.color), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary_cccccc.color), for: .disabled)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }
    
    static public func createGreenButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSWhite_ffffff.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle30.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSGreen_60a75b.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSYellow_eaa41f.color), for: .selected)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary_cccccc.color), for: .highlighted)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }
    
    static public func createGrayButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSTitleBlue_3399ff.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle30.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSDivLineColorLight_f5f5f5.color), for: .normal)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSDivLineColorMid_e7e7e7.color), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSInactiveGary_cccccc.color), for: .disabled)
        
        return button
    }
    
    static public func createTaskStatusBlueLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSTitleBlue_3399ff.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSTaskStatusColor_edf5fd.color
        label.layer.borderColor = BSThemeColor.BSTitleBlue_3399ff.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
       
        return label
    }
    
    static public func createTaskStatusGreenLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSTaskStatusColor_33a72d.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSTaskStatusColor_f2fff1.color
        label.layer.borderColor = BSThemeColor.BSTaskStatusColor_33a72d.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
    }
    
    static public func createTaskStatusGrayLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSTaskStatusColor_8e8e8e.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSDivLineColorMid_e7e7e7.color
        label.layer.borderColor = BSThemeColor.BSTaskStatusColor_8e8e8e.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
    }
    
    static public func createTaskStatusRedLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSWhite_ffffff.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSRed_ea1f32.color
        label.layer.borderColor = BSThemeColor.BSRed_ea1f32.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
    }
    
    static public func createTaskStatusOrangeLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSTaskStatusColor_ffa200.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSTaskStatusColor_fff5e4.color
        label.layer.borderColor = BSThemeColor.BSTaskStatusColor_ffa200.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
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
        textField.textColor = BSThemeColor.BSTextColorNormal_666666.color
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
    
    static public func createCheckBox() -> BSCheckBox
    {
        return BSCheckBox(frame: CGRect.zero)
    }
    
    static public func createRadioBox() -> BSRadioBox
    {
        return BSRadioBox(frame: CGRect.zero)
    }
    
    static public func createTaskInfoPanel() -> BSTaskInfoPanel
    {
        return BSTaskInfoPanel(frame: CGRect.zero)
    }
    
    static public func createUserInfoPanel() -> BSUserInfoPanel
    {
        return BSUserInfoPanel(frame: CGRect.zero)
    }
}
