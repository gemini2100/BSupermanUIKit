//
//  ViewController.swift
//  BSupermanUIKit
//
//  Created by gemini2100@msn.com on 03/30/2018.
//  Copyright (c) 2018 gemini2100@msn.com. All rights reserved.
//

import UIKit
import BSupermanUIKit
import BSupermanFoundation
import SnapKit
import RxSwift
import RxCocoa


/// 我的任务首页
class TaskHometViewController: UIViewController {
    
    var contentView = UIView(frame: CGRect.zero)

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let userInfoPanel = BSUIKit.createUserInfoPanel()
    let testBtn = BSUIKit.createTaskStatusOrangeLabel(title: "任务状态:超人已接单")
    
    let testBtn2 = BSUIKit.createGreenButton(title: "联系超人")
    
    let testBtn3 = BSUIKit.createCheckBox()
    let testBtn4 = BSUIKit.createRadioBox()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //setUIProperty()
        //makeUIConstraints()
        
        //setNavProperty()
        //makeNavConstraints()
        //navbar.style = .BackTitle

        //self.view.addSubview(testButton)
        
//        testButton.snp.makeConstraints{ (make) in
//
//            make.top.equalToSuperview().offset(60)
//            make.width.equalTo(80)
//            make.height.equalTo(50)
//
//        }
        
        view.addSubview(userInfoPanel)
        view.addSubview(testBtn)
        view.addSubview(testBtn2)
        view.addSubview(testBtn3)
        view.addSubview(testBtn4)
        
        let theData = (titleLabel:"超人信息",
                           avatar:"https://superman-headimage.oss-cn-hangzhou.aliyuncs.com/8b74def4-eb0d-4780-a9e1-c1513f1baff0.jpg",
                           level:"",
                           nickname:"",
                           signature:"",
                           taskNumber:"",
                           ratingA:"好评（0）",
                           ratingB:"中评（0）",
                           ratingC:"差评（0）"
                           )
        
        userInfoPanel.setTheData(theData: theData)
        userInfoPanel.snp.makeConstraints{ (make) in
            
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview()
            
            
        }
        
                testBtn.snp.makeConstraints{ (make) in
        
                    make.top.equalToSuperview().offset(400)
                    make.centerX.equalToSuperview()
                    make.width.equalToSuperview().inset(10)
                    make.height.equalTo(50)
        
                }
        
        testBtn2.snp.makeConstraints{ (make) in
            
            make.top.equalTo(testBtn.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(50)
            
        }
        
        testBtn3.snp.makeConstraints{ (make) in
            
            make.top.equalTo(testBtn2.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.width.height.equalTo(20)
            
            
        }
        
        testBtn4.snp.makeConstraints{ (make) in
            
            make.top.equalTo(testBtn2.snp.bottom).offset(20)
            make.left.equalTo(testBtn3.snp.right).offset(20)
            make.width.height.equalTo(20)
            
        }
        
        
    }
    
    func setNavProperty()
    {
        self.view.addSubview(statusbar)
        self.view.addSubview(navbar)
        
//        navbar.leftTaps
//        .subscribe(onNext: { print("touch me")})

        
    }

    func makeNavConstraints()
    {
        statusbar.snp.makeConstraints { (make) -> Void in

            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(BSStatusBar.statusBarHeight)
           
        }

        navbar.snp.makeConstraints { (make) -> Void in

            make.top.equalTo(statusbar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(BSNavigationBar.navBarHeight)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 11.0, *)
        {
            print("Origin SafeAreaInsets :" + "\(self.view.safeAreaInsets)")
        }
        //self.additionalSafeAreaInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        //print("view controller's additionalSafeAreaInsets set to " + "\(self.additionalSafeAreaInsets)")
        //print("Adjusted  SafeAreaInsets :" + "\(self.view.safeAreaInsets)")
    }

    
    
    /// Start---Test Button Code
   
    @objc private func sayAction(_ sender: UIButton?) {
        taskLabel.text = "帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿"
        taskPublishTime.text = "帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿"
        taskContent.text = "帮忙跑腿帮忙跑帮忙帮忙腿帮忙跑腿帮忙跑腿帮忙跑腿"
    }
    
//    lazy var testButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50)).then{
//        $0.setTitle("btn", for: .normal)  //set button title
//        $0.setTitleColor(UIColor.red, for: .normal) //set button title color
//        $0.backgroundColor = UIColor.black //set button background color
//        $0.addTarget(self, action: #selector(sayAction(_:)), for: .touchUpInside)
//    }
    
    
    lazy var testButton = BSUIKit.createGrayButton(title: "任务编号")
    
   /// End---Test Button Code
    
    var navbar = BSNavigationBar(frame: CGRect.zero)
    var statusbar = BSStatusBar(frame: CGRect.zero)

    var head = UIImageView()
    var level = UILabel()
    
    var taskLabel = UILabel()
    var taskPublishTimeIcon = UIImageView()     //闹钟图标
    var taskPublishTime = UILabel()
    
    var taskContent = UILabel()
    var taskContentIcon = UIImageView()         //右箭头
    
    var divLine = UIImageView()                 //分割线
    
    var taskServiceCountLabel = UILabel()       //服务费标题
    var taskServiceCount = UILabel()
    var plusLabel = UILabel()                   //+符号
    var taskFeeLabel = UILabel()                //小费
    var taskFee = UILabel()
    
    
    var taskStatusLabel = UILabel()             //任务状态标签 背景色根据任务状态修改
    var taskStatus = UILabel()
    
    var divLine2 = UIImageView()                 //底部分割线
    
    fileprivate func setUIProperty() {        
        
        contentView.do{
            $0.backgroundColor = UIColor.white
            self.view.addSubview(contentView)
        }
        
        //头像
        head.do{
            $0.image = UIImage(named: "person_photo")
            $0.contentMode = .scaleAspectFill
            //设置遮罩
            $0.layer.masksToBounds = true
            //设置圆角半径(宽度的一半)，显示成圆形。
            $0.layer.cornerRadius = 24
            
            self.contentView.addSubview($0)
        }
        //用户等级
        level.do{
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSYellow_eaa41f.color
            $0.textAlignment = .center
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "V1"
        }
        
        //标题
        taskLabel.do{
            $0.font = BSFont.BSTitle30.font
            $0.textColor = BSThemeColor.BSTextColorTitle_333333.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "帮忙跑腿"
            //$0.backgroundColor = UIColor.blue
            
            
        }
        //时钟图标
        taskPublishTimeIcon.do{
            $0.image = UIImage(named: "time_out")
            $0.contentMode = .scaleAspectFit
            self.contentView.addSubview($0)
            
        }
        //发布时间
        taskPublishTime.do{
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSTextColorTiny_999999.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            //$0.backgroundColor = UIColor.brown
            $0.text = "08:43 今天"
            
            
        }
        
        //任务摘要
        taskContent.do{
            $0.font = BSFont.BSContent24.font
            $0.textColor = BSThemeColor.BSTextColorTiny_999999.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "我需要一份牛肉面"//，微微辣就可以，千万不要加太多的水，水多了太淡了"
            //$0.backgroundColor = UIColor.cyan
            
        }
        //任务右箭头
        taskContentIcon.do{
            $0.image = UIImage(named: "arr_r2")
            $0.contentMode = .center
            self.contentView.addSubview($0)
           
        }
        
        //分割线
        divLine.do{
            $0.image = UIImage.size(width: 1 , height: 1)
                .color(BSThemeColor.BSDivLineColorLight_f5f5f5.color)
                .image
            $0.contentMode = .scaleToFill
            self.contentView.addSubview($0)
        }
       
        //服务费标题
        taskServiceCountLabel.do{
            $0.text = NSLocalizedString("服务费", comment: "")
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSTextColorTiny_999999.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            
        }
        //服务费
        taskServiceCount.do{
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSYellow_eaa41f.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "1000"
            
        }
        //加号
        plusLabel.do{
            $0.text = NSLocalizedString("+", comment: "")
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSTextColorTiny_999999.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            
        }
        //小费标题
        taskFeeLabel.do{
            $0.text = NSLocalizedString("小费", comment: "")
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSTextColorTiny_999999.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            
        }
        //小费
        taskFee.do{
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSYellow_eaa41f.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "200"
            //$0.backgroundColor = UIColor.gray
            
        }
        
        //任务状态标签
        taskStatusLabel.do{
            $0.text = NSLocalizedString("任务状态", comment: "")
            $0.font = BSFont.BSSubTiny20.font
            $0.textColor = BSThemeColor.BSWhite_ffffff.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.backgroundColor = BSThemeColor.BSBlue_5f97d8.color
            
        }
        //任务状态
        taskStatus.do{
            $0.textColor = BSThemeColor.BSTextColorNormal_666666.color
            $0.font = BSFont.BSSubTiny20.font
            $0.textAlignment = .center
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "已发布"
            $0.backgroundColor = BSThemeColor.BSDivLineColorLight_f5f5f5.color
            
        }
        
        //分割线
        divLine2.do{
            $0.image = UIImage.size(width: 1 , height: 1)
                .color(BSThemeColor.BSDivLineColorMid_e7e7e7.color)
                .image
            $0.contentMode = .scaleToFill
            self.contentView.addSubview($0)
        }
        
        
    }
    
    
    let headSize = 48
    let clockSize = 16 //时钟图标大小
    let taskStatusSize = 100 //具体任务状态的最小宽度
    
    let contentViewMargin = 10 //左右两边留白
    let contentMinSzie = 100 //标题和摘要最小大小
    let HeadMargin = 10 //右边内容和头像的边距
    let levelMargin = 4 //等级和头像上边距
    let FeeMargin = 4 //费用间距
    let DivMargin = 6 //底部分割线和上面间距
    
    let TitleLineHeight = 24 //标题的行高
    let ContentLineHeight = 24 //摘要的行高
    let FeeLineHeight = 24 //费用的行高
    let StatusLineHeight = 24 //状态的行高
    
    fileprivate func makeUIConstraints() {
        
        contentView.snp.makeConstraints { (make) -> Void in
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(120)
            make.center.equalToSuperview()
        }
        
        //头像
        head.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(headSize)
            make.top.equalToSuperview().offset(contentViewMargin)
            make.leading.equalToSuperview().offset(contentViewMargin)
        }
        
        //用户等级
        level.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(head)
            make.centerX.equalTo(head)
            make.top.equalTo(head.snp.bottom).offset(levelMargin)
           
        }
        
        //标题,参照taskPublishTime位置，从右向左
        taskLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(TitleLineHeight)
            make.lastBaseline.equalTo(taskPublishTime)
            make.leading.equalTo(head.snp.trailing).offset(HeadMargin)
            make.trailing.equalTo(taskPublishTimeIcon.snp.leading)
            make.width.greaterThanOrEqualTo(contentMinSzie) //最小宽度
        }
        taskLabel.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)//设置可以压缩

        //时钟图标,参照taskPublishTime位置，从右向左
        taskPublishTimeIcon.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(clockSize)
            make.centerY.equalTo(taskPublishTime)
            make.trailing.equalTo(taskPublishTime.snp.leading)
        }

        //发布时间
        taskPublishTime.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(TitleLineHeight)
            make.top.equalTo(head)
            make.trailing.equalToSuperview().inset(contentViewMargin)
        }
        
        
        //任务摘要,参照taskContentIcon位置，从右向左
        taskContent.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(ContentLineHeight)
            make.leading.equalTo(head.snp.trailing).offset(HeadMargin)
            make.trailing.equalTo(taskContentIcon.snp.leading)
            make.top.equalTo(taskContentIcon)
        }
        taskContent.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)//设置可以压缩

        //任务右箭头
        taskContentIcon.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(ContentLineHeight)
            make.top.equalTo(taskPublishTime.snp.bottom)
            make.trailing.equalToSuperview().inset(contentViewMargin).priority(.high)
            
        }
        
        //分割线
        divLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(1)
            make.top.equalTo(taskContentIcon.snp.bottom)
            make.leading.equalTo(head.snp.trailing).offset(HeadMargin)
            make.trailing.equalToSuperview().inset(contentViewMargin)
            
        }


        //服务费标题,参照taskServiceCountLabel位置从左向右
        taskServiceCountLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(FeeLineHeight)
            make.leading.equalTo(head.snp.trailing).offset(HeadMargin)
            make.top.equalTo(divLine.snp.bottom)
        }
        //服务费
        taskServiceCount.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(FeeLineHeight)
            make.lastBaseline.equalTo(taskServiceCountLabel)
            make.leading.equalTo(taskServiceCountLabel.snp.trailing).offset(FeeMargin)
        }

        //加号
        plusLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(FeeLineHeight)
            make.lastBaseline.equalTo(taskServiceCountLabel)
            make.leading.equalTo(taskServiceCount.snp.trailing).offset(FeeMargin)
        }

        //小费标题
        taskFeeLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(FeeLineHeight)
            make.lastBaseline.equalTo(taskServiceCountLabel)
            make.leading.equalTo(plusLabel.snp.trailing).offset(FeeMargin)
        }
        //小费
        taskFee.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(FeeLineHeight)
            make.lastBaseline.equalTo(taskServiceCountLabel)
            make.leading.equalTo(taskFeeLabel.snp.trailing).offset(FeeMargin)
            make.width.greaterThanOrEqualTo(contentMinSzie)
        }
        taskFee.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)//设置可以压缩

        //任务状态标签 参照taskStatusLabel位置从左向右
        taskStatusLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(StatusLineHeight)
            make.leading.equalTo(head.snp.trailing).offset(HeadMargin)
            make.top.equalTo(taskServiceCountLabel.snp.bottom)
        }
        //任务状态.priority(ConstraintPriority.high)
        taskStatus.snp.makeConstraints { (make) -> Void in
            make.width.greaterThanOrEqualTo(taskStatusSize)
            make.height.equalTo(StatusLineHeight)
            make.leading.equalTo(taskStatusLabel.snp.trailing)
            make.lastBaseline.equalTo(taskStatusLabel)
        }
        taskStatus.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)//设置可以压缩
        
        //底部分割线
        divLine2.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(1)
            make.leading.equalToSuperview().offset(HeadMargin)
            make.trailing.equalToSuperview()
        }
        
        
        
    }
    
}

//／tableView.separatorStyle = UITableViewCellSeparatorStyleNone;



//tableView.snp.makeConstraints { (make) -> Void in
//    make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
//}


//self.view.addSubview(tableView)
//tableView.snp.makeConstraints { (make) -> Void in
//    make.top.equalTo(self.topLayoutGuide.snp.bottom)
//    make.left.equalTo(view)
//    make.right.equalTo(view)
//    make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
//}
//}

