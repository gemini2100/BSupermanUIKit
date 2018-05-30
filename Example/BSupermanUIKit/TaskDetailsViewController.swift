//
//  TaskDetailsViewController.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/5/26.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import BSupermanUIKit
import BSupermanFoundation
import SnapKit


class TaskDetailsViewController: UIViewController {
    
    //整体scrollview
    let scrollView = UIScrollView(frame: CGRect.zero).then{

        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.isDirectionalLockEnabled = true
        $0.alwaysBounceVertical = false  //控制控件遇到边框是否反弹k
        $0.delaysContentTouches = false  //延迟响应
    }
    
    //内容面板,所有控件都添加在内容面板上
    let theCoView = UIView(frame: CGRect.zero)

    //测试字符
    let TestString = ["任务编号:","区域范围:","任务标签:任务编号任务编号任务编号任务编号任务编号","任务描述:","接单条件:","约定地点:任务编号任务编号任务编号任务编号任务编号任务编号任务编号","任务时效:","支付方式:","服务费:任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号任务编号","小费:","超人垫付:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUIProperty()
        makeUIConstraints()
        
        taskInfoPanel.setContenString(stringArray: TestString)
    }
    
    //列表
    let taskInfoPanel = BSUIKit.createTaskInfoPanel()
    
    
    func makeUIConstraints() {
        
        scrollView.snp.makeConstraints{ (make) -> Void in
            
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        theCoView.snp.makeConstraints{ (make) -> Void in
            
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            
        }
        
        taskInfoPanel.snp.makeConstraints{ (make) -> Void in
            
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            
            
        }
        
    }
    
    func setUIProperty(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(theCoView)
        theCoView.addSubview(taskInfoPanel)
        theCoView.backgroundColor = BSThemeColor.BSWhite_ffffff.color //for test
        
    }

    
}

