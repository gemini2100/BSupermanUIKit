//
//  BSUserInfoPanel.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/5/29.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import BSupermanFoundation
import Nuke

fileprivate let LineMargin:CGFloat = 8  //行距
fileprivate let DivLineHight:CGFloat = 1  //分割线高度
fileprivate let TitleIconWidth:CGFloat = 20
fileprivate let AvatarIconWidth:CGFloat = 64


public class BSUserInfoPanel: UIStackView {
    
    ///布局Stack View控件
    
    // 标题图标+文字
    private let titleStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = LineMargin
    }
    
    // 下面整体
    private let contentStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = LineMargin
    }
    
    private let left_contentStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = LineMargin/2
    }
    
    private let right_contentStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = LineMargin
    }
    
    // 昵称+签名
    private let right_1_contentStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = LineMargin
    }
    
    // 完成任务数
    private let right_2_contentStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = LineMargin
    }
    
    
    // 放三个评价标签
    private let right_3_contentStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = LineMargin
    }
    
    ///具体控件
    
    
    // 分割线1
    private let divLine = UIView(frame: CGRect.zero).then{
        $0.backgroundColor = BSThemeColor.BSDivLineColorMid_e7e7e7.color
    }
    // 分割线2
    private let divLine2 = UIView(frame: CGRect.zero).then{
        $0.backgroundColor = BSThemeColor.BSDivLineColorMid_e7e7e7.color
    }
    
    //标题部分
    private let titleIcon = UIImageView(frame: CGRect.zero)
    private let titleLabel = UILabel(frame: CGRect.zero) //超人/急客信息 文字labels
    
    //左边信息
    private let avatar = UIImageView(frame: CGRect.zero)
    private let level = UILabel(frame: CGRect.zero)
    
    //右边信息
    private let nickname = UILabel(frame: CGRect.zero)
    private let signature = UILabel(frame: CGRect.zero)
    
    private let taskNumberLabel = UILabel(frame: CGRect.zero)
    private let taskNumber = UILabel(frame: CGRect.zero)
    
    //评价
    private let ratingA = UILabel(frame: CGRect.zero)
    private let ratingB = UILabel(frame: CGRect.zero)
    private let ratingC = UILabel(frame: CGRect.zero)
    
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUIStackView()
        setUIProperty()
        makeUIConstraints()
    }
    
//    var theData = (titleLabel:"急客超人",
//                   avatar:"https://",
//                   level:"",
//                   nickname:"",
//                   signature:"",
//                   taskNumber:"",
//                   ratingA:"好评（0）",
//                   ratingB:"中评（0）",
//                   ratingC:"差评（0）"
//                   )
    
    public func setTheData(theData:(titleLabel:String,
        avatar:String,
        level:String,
        nickname:String,
        signature:String,
        taskNumber:String,
        ratingA:String,
        ratingB:String,
        ratingC:String)){
                
        titleLabel.text = theData.titleLabel
        
        loadImageWithPlaceholder(with: theData.avatar, into: avatar)
        
        level.text = theData.level
        nickname.text = theData.nickname
        signature.text = theData.signature
        taskNumber.text = theData.taskNumber
        ratingA.text = theData.ratingA
        ratingB.text = theData.ratingB
        ratingC.text = theData.ratingC
        
    }
    
}

extension BSUserInfoPanel{
    private func makeUIStackView() {
        
        //最外层的sv
        self.addArrangedSubview(titleStackView)
        self.addArrangedSubview(divLine)
        self.addArrangedSubview(contentStackView)
        self.addArrangedSubview(divLine2)
        //整体四行全体边距右下移LineMargin
        self.layoutMargins = UIEdgeInsets(top: LineMargin, left: LineMargin, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
        
        //标题子stackview
        titleStackView.addArrangedSubview(titleIcon)
        titleStackView.addArrangedSubview(titleLabel)
        
        //内容区域子stackview
        contentStackView.addArrangedSubview(left_contentStackView)
        contentStackView.addArrangedSubview(right_contentStackView)
        
        //左内容区域子stackview
        left_contentStackView.addArrangedSubview(avatar)
        left_contentStackView.addArrangedSubview(level)
        
        //右内容区域子stackview
        right_contentStackView.addArrangedSubview(right_1_contentStackView)
        right_contentStackView.addArrangedSubview(right_2_contentStackView)
        right_contentStackView.addArrangedSubview(right_3_contentStackView)
        
        //右内容区域子stackview 第一行
        right_1_contentStackView.addArrangedSubview(nickname)
        right_1_contentStackView.addArrangedSubview(signature)
        
        //右内容区域子stackview 第二行
        right_2_contentStackView.addArrangedSubview(taskNumberLabel)
        right_2_contentStackView.addArrangedSubview(taskNumber)
        
        //右内容区域子stackview 第三行
        right_3_contentStackView.addArrangedSubview(ratingA)
        right_3_contentStackView.addArrangedSubview(ratingB)
        right_3_contentStackView.addArrangedSubview(ratingC)
    }
    
    private func setUIProperty(){
        
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = LineMargin
        
        //标题部分
        let frameworkBundle = Bundle(for: BSUserInfoPanel.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("BSupermanUIKit.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        
        let iconImage = UIImage(named: "c4",
                                in: resourceBundle,
                                compatibleWith: nil)
        titleIcon.image = iconImage
 
        //titleLabel.text = theData.titleLabel
        titleLabel.textColor = BSThemeColor.BSTitleBlue_3399ff.color
        titleLabel.font = BSFont.BSContent24.font
        titleLabel.textAlignment = .left
        titleLabel.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
            
        
        //左边信息
        avatar.contentMode = .scaleAspectFill
        //设置遮罩
        avatar.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形
        avatar.layer.cornerRadius = AvatarIconWidth / 2
        //设置边框
        avatar.layer.borderColor = BSThemeColor.BSDivLineColorDark_cccccc.color.cgColor
        avatar.layer.borderWidth = 2.0
 
        
        level.textColor = BSThemeColor.BSTextColorTiny_999999.color
        level.font = BSFont.BSSubTiny16.font
        level.textAlignment = .center
        //level.text = theData.level
        
        
        //右边信息
        nickname.textColor = BSThemeColor.BSTextColor_373a3d.color
        nickname.font = BSFont.BSContent22.font
        nickname.textAlignment = .left
        //nickname.backgroundColor = UIColor.green
        
        signature.textColor = BSThemeColor.BSTextColorTiny_999999.color
        signature.font = BSFont.BSContent22.font
        signature.textAlignment = .left
        //signature.backgroundColor = UIColor.red
        signature.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
        taskNumberLabel.textColor = BSThemeColor.BSTextColor_373a3d.color
        taskNumberLabel.font = BSFont.BSSubTiny20.font
        taskNumberLabel.textAlignment = .left
        taskNumberLabel.text = "完成任务数:"
        
        taskNumber.textColor = BSThemeColor.BSTextColor_373a3d.color
        taskNumber.font = BSFont.BSSubTiny20.font
        taskNumber.textAlignment = .left
        taskNumber.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
        //ratingLabel
        ratingA.textColor = BSThemeColor.BSRed_ea1f32.color
        ratingA.font = BSFont.BSContent22.font
        ratingA.textAlignment = .left
        //ratingA.text = theData.ratingA
        
        ratingB.textColor = BSThemeColor.BSYellow_eaa41f.color
        ratingB.font = BSFont.BSContent22.font
        ratingB.textAlignment = .left
        //ratingB.text = theData.ratingB
        
        ratingC.textColor = BSThemeColor.BSTextColorTiny_999999.color
        ratingC.font = BSFont.BSContent22.font
        ratingC.textAlignment = .left
        //ratingC.text = theData.ratingC
        ratingC.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
    }
    
    private func makeUIConstraints() {
        
        
        titleIcon.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(TitleIconWidth)
        }
        
        
        divLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(DivLineHight)
        }
        
        avatar.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(AvatarIconWidth)
        }
        
        divLine2.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(DivLineHight)
        }
        
    }
}
