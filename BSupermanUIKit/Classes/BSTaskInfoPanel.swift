//
//  TaskInfoPanel.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/5/23.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation
import SnapKit

//行高间隙
fileprivate let LineMargin:CGFloat = 8  //行距
fileprivate let DivLineHight:CGFloat = 1  //分割线高度
fileprivate let LableWidth:CGFloat = 80  //标题Label的宽度
fileprivate let TitleIconWidth:CGFloat = 20  //标题Label的宽度
fileprivate let EleButtonHight:CGFloat = 80  //电子协议的按钮高度
fileprivate let TitleString = ["任务编号:","区域范围:","任务标签:","任务描述:","接单条件:","约定地点:","任务时效:","支付方式:","服务费:","小费:","超人垫付:"] //固定的标题字符
fileprivate let NumberOfCellLines = 11 //列表的行数
fileprivate let EleProtocolURL = """
http://superman-protocol.oss-cn-shanghai.aliyuncs.com/v0.1/protocol-1.html
"""
//--任务信息面板--

public class BSTaskInfoPanel: UIStackView {
    
    ///第一行标题行
    private let titleStackView = UIStackView()
    
    /// 内容具体列表repeatElement
    private let contentString = [String](repeating:"", count:NumberOfCellLines)
    private let taskInfoCellArray = [TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero),
                                     TaskInfoCell(frame: CGRect.zero)]
    
    
    /// 电子协议按钮 Stack View
    private let eleStackView = UIStackView()
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUIProperty()
        makeUIConstraints()
    }
    
    public func setContenString(stringArray:[String]) {
        
        var tempArray = [String](repeating:"", count:NumberOfCellLines)
        let stringArrayEnumerated = stringArray.enumerated()
        for item in stringArrayEnumerated where item.offset < NumberOfCellLines {
            tempArray[item.offset] = item.element
        }
        
        let taskInfoCellArrayEnum = taskInfoCellArray.enumerated()
        for item in taskInfoCellArrayEnum {
            item.element.contentLabel.text = tempArray[item.offset]
        }
        
    }
    
}


extension BSTaskInfoPanel
{
    @objc private func openEleURL() {

        if let url = URL(string: EleProtocolURL) {
            //根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    //设置第一行标题
    private func setTitleStackView(){
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.distribution = .fill
        titleStackView.spacing = LineMargin
        titleStackView.layoutMargins = UIEdgeInsets(top: LineMargin, left: LineMargin, bottom: 0, right: 0)
        titleStackView.isLayoutMarginsRelativeArrangement = true
        
        
        let frameworkBundle = Bundle(for: BSTaskInfoPanel.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("BSupermanUIKit.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        
        let iconImage = UIImage(named: "c1",
                                 in: resourceBundle,
                                 compatibleWith: nil)
        
        let titleIcon = UIImageView(image: iconImage)
        let titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.text = "任务信息"
        titleLabel.textColor = BSThemeColor.BSColor4.color
        titleLabel.font = BSFont.BSTitle32.font
        titleLabel.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
        titleStackView.addArrangedSubview(titleIcon)
        titleStackView.addArrangedSubview(titleLabel)
        
        titleIcon.snp.makeConstraints{ (make) -> Void in
            make.width.height.equalTo(TitleIconWidth)
        }
    }
    
    private func setTaskInfoCellTitle() {
        
        let taskInfoCellArrayEnum = taskInfoCellArray.enumerated()
        for item in taskInfoCellArrayEnum {
            item.element.titleLabel.text = TitleString[item.offset]
        }
        
    }
    
    private func setEleStackView(){
        
        eleStackView.axis = .vertical
        eleStackView.alignment = .fill
        eleStackView.distribution = .fill
        
        //顶端分割线
        let divLine = UIView(frame: CGRect.zero)
        divLine.backgroundColor = BSThemeColor.BSColorL2.color
        
        let eleButton = BSUIKit.createGrayButton(title: "查看电子协议内容")
        
        eleStackView.addArrangedSubview(divLine)
        eleStackView.addArrangedSubview(eleButton)
        
        divLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(DivLineHight)
        }
        
        eleButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(EleButtonHight)
        }
        
        eleButton.addTarget(self, action: #selector(openEleURL), for: .touchUpInside)
        
    }
    
    private func setUIProperty(){
        
        setTitleStackView()
        setTaskInfoCellTitle()
        setEleStackView()
        
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = LineMargin
        
        self.addArrangedSubview(titleStackView)
        taskInfoCellArray.forEach{
            self.addArrangedSubview($0)
        }
        self.addArrangedSubview(eleStackView)
        
    }
    
    private func makeUIConstraints() {
        
        //        titleStackView.snp.makeConstraints { (make) -> Void in
        //            make.width.equalToSuperview()
        //            make.leading.equalToSuperview().offset(LineMargin)
        //        }
        //        taskInfoCellArray.forEach{
        //            $0.snp.makeConstraints { (make) -> Void in
        //                make.width.equalToSuperview()
        //            }
        //        }
        //
        //        eleButton.snp.makeConstraints { (make) -> Void in
        //            make.width.equalToSuperview()
        //            make.height.equalTo(EleButtonHight)
        //        }
        
    }
    
}

///
fileprivate class TaskInfoCell: UIStackView {
    
    var divLine = UIView(frame: CGRect.zero)
    var titleLabel = UILabel(frame: CGRect.zero)
    var contentLabel = UILabel(frame: CGRect.zero)
    var contentStackView = UIStackView()
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUIProperty()
        makeUIConstraints()
    }
    
}


extension TaskInfoCell
{
    var titleText:String {
        
        get{
            return titleLabel.text ?? ""
        }
        set{
            titleLabel.text = newValue
        }
    }
    
    var contentText:String {
        
        get{
            return contentLabel.text ?? ""
        }
        set{
            contentLabel.text = newValue
        }
    }
}

extension TaskInfoCell
{
    func setUIProperty(){
        
        //这个是cell总体最外层stack view
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = LineMargin
        
        self.layoutMargins = UIEdgeInsets(top: 0, left: LineMargin, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
        
        //顶端分割线
        divLine.backgroundColor = BSThemeColor.BSColorL2.color
        
        //标题和内容
        titleLabel.textColor = BSThemeColor.BSColor3.color
        titleLabel.font = BSFont.BSTitle32.font
        titleLabel.textAlignment = .left
        
        contentLabel.textColor = BSThemeColor.BSColor1.color
        contentLabel.font = BSFont.BSTitle30.font
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        
        //
        contentStackView.axis = .horizontal
        contentStackView.alignment = .fill
        contentStackView.distribution = .fill
        contentStackView.spacing = LineMargin
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(contentLabel)
        
        self.addArrangedSubview(divLine)
        self.addArrangedSubview(contentStackView)
        
    }
    
    func makeUIConstraints() {
        
        //分割线
        divLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(DivLineHight)
        }
        
        //contentStackView 里面的titleLabel、contentLabel里面的两个Label
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(LableWidth)
        }
        //让内容区域可以自由拉伸
        contentLabel.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
    }
}


