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
        button.backgroundColor = BSThemeColor.BSColor4.color
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle32.font
        return button
    }
    
    static public func createRedButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSColor0.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle32.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColor6.color), for: .normal)
        
        //20%黑色叠加
        let highLightedColor = BSThemeColor.BSColor6.color.add(overlay: UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
        
        button.setBackgroundImage(UIImage(color:highLightedColor), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColorL1.color), for: .disabled)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }
    
    static public func createBlueButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSColor0.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle32.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColor5.color), for: .normal)
        
        //20%黑色叠加
        let highLightedColor = BSThemeColor.BSColor5.color.add(overlay: UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
        
        button.setBackgroundImage(UIImage(color:highLightedColor), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColorL1.color), for: .disabled)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }
    
    static public func createGreenButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSColor0.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle32.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColor8.color), for: .normal)
        
        //20%黑色叠加
        let highLightedColor = BSThemeColor.BSColor8.color.add(overlay: UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
        
        button.setBackgroundImage(UIImage(color:highLightedColor), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColorL1.color), for: .disabled)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }
    
    static public func createGrayButton(title:String) -> UIButton
    {
        let button = UIButton(frame:CGRect.zero)
        button.setTitle(title, for: .normal)
        button.setTitleColor(BSThemeColor.BSColor4.color, for: .normal)
        button.titleLabel?.font = BSFont.BSTitle32.font
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColorL3.color), for: .normal)
        
        //20%黑色叠加
        let highLightedColor = BSThemeColor.BSColorL3.color.add(overlay: UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
        
        button.setBackgroundImage(UIImage(color:highLightedColor), for: .highlighted)
        button.setBackgroundImage(UIImage(color:BSThemeColor.BSColorL1.color), for: .disabled)
        
        return button
    }
    
    static public func createTaskStatusBlueLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSColor4.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSTaskStatusColor_edf5fd.color
        label.layer.borderColor = BSThemeColor.BSColor4.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
       
        return label
    }
    
    static public func createTaskStatusGreenLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSColor8.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSTaskStatusColor_f2fff1.color
        label.layer.borderColor = BSThemeColor.BSColor8.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
    }
    
    static public func createTaskStatusGrayLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSColor3.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSColorL2.color
        label.layer.borderColor = BSThemeColor.BSColor3.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
    }
    
    static public func createTaskStatusRedLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSColor0.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSColor6.color
        label.layer.borderColor = BSThemeColor.BSColor6.color.cgColor
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        
        return label
    }
    
    static public func createTaskStatusOrangeLabel(title:String) -> UILabel
    {
        let label = UILabel(frame:CGRect.zero)
        label.textColor = BSThemeColor.BSColor7.color
        label.font = BSFont.BSTitle32.font
        label.textAlignment = .center
        label.text = title
        label.backgroundColor = BSThemeColor.BSTaskStatusColor_fff5e4.color
        label.layer.borderColor = BSThemeColor.BSColor7.color.cgColor
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
        textField.textColor = BSThemeColor.BSColor2.color
        // 设置 文字大小
        textField.font = BSFont.BSContent26.font
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
    
    static public func createDivBlock() -> UIView
    {
        let ret = UIView(frame: CGRect.zero)
        
        ret.backgroundColor = BSThemeColor.BSColorL3.color
        ret.layer.borderColor = BSThemeColor.BSColorL1.color.cgColor
        ret.layer.borderWidth = 1.0
        
        return ret
    }
    
    static public func createDivLine() -> UIView
    {
        let ret = UIView(frame: CGRect.zero)
        ret.backgroundColor = BSThemeColor.BSColorL2.color
        return ret
    }
}
