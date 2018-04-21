//
//  ViewController.swift
//  BSupermanUIKit
//
//  Created by gemini2100@msn.com on 03/30/2018.
//  Copyright (c) 2018 gemini2100@msn.com. All rights reserved.
//

import UIKit
import BSupermanUIKit
import SnapKit
import Then
import RxSwift
import RxCocoa


/// 我的任务首页
class TaskHometViewController: UIViewController {
        
 //       let disposeBag = DisposeBag()
        
//        lazy var tableView: UITableView = {
//            let table = UITableView()
//            table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//            return table
//        }()
    
    //        func addTableView() {
    //            view.addSubview(tableView)
    //            tableView.snp.makeConstraints { (make) in
    //                make.left.top.bottom.right.equalToSuperview()
    //            }
    //        }
    //
    //        func bindTableView() {
    //            // 1 初始化数据源
    //            let items = Observable.just((0...30).map {"\($0)" })
    //            // 2 绑定数据源到tableView
    //            items.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){ (row, element, cell) in
    //                cell.textLabel?.text = "\(element)"
    //                }
    //                .disposed(by: disposeBag)
    //            // 3 设置点击事件
    //            tableView.rx.modelSelected(String.self).subscribe(onNext: {
    //                print("tap index: \($0)")
    //            }).disposed(by: disposeBag)
    //        }
    
  
    @objc private func sayAction(_ sender: UIButton?) {
        taskLabel.text = "帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿"
        taskPublishTime.text = "帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿帮忙跑腿"
        
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            //addTableView()
            //bindTableView()
        
        testButton.setTitle("btn", for: .normal)  //set button title
        testButton.setTitleColor(UIColor.red, for: .normal) //set button title color
        testButton.backgroundColor = UIColor.black //set button background color
        testButton.addTarget(self, action: #selector(sayAction(_:)), for: .touchUpInside)

        testButton.backgroundColor = UIColor.black
        
         self.view.addSubview(testButton)
        
        
            setUIProperty()
            makeUIConstraints()
    }
    
    var contentView = UIView(frame: CGRect.zero)
    var testButton = UIButton(frame: CGRect(x: 0, y: 30, width: 100, height: 50))
   
    
    
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
        
        self.view.backgroundColor = UIColor("EDECF2")
        
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
            $0.font = BSFont.BSSubTiny.font
            $0.textColor = BSThemeColor.BSYellow.color
            $0.textAlignment = .center
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "V1"
        }
        
        //标题
        taskLabel.do{
            $0.font = BSFont.BSTitleTiny.font
            $0.textColor = BSThemeColor.BSTextColorTitle.color
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
            $0.font = BSFont.BSSubTiny.font
            $0.textColor = BSThemeColor.BSTextColorTiny.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            //$0.backgroundColor = UIColor.brown
            $0.text = "08:43 今天"
            
            
        }
        
        //任务摘要
        taskContent.do{
            $0.font = BSFont.BSContentTiny.font
            $0.textColor = BSThemeColor.BSTextColorTiny.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "我需要一份牛肉面，微微辣就可以，千万不要加太多的水，水多了太淡了"
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
                .color(BSThemeColor.BSDivLineColorLight.color)
                .image
            $0.contentMode = .scaleToFill
            self.contentView.addSubview($0)
        }
       
        //服务费标题
        taskServiceCountLabel.do{
            $0.text = NSLocalizedString("服务费", comment: "")
            $0.font = BSFont.BSSubTiny.font
            $0.textColor = BSThemeColor.BSTextColorTiny.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            
        }
        //服务费
        taskServiceCount.do{
            $0.font = BSFont.BSSub.font
            $0.textColor = BSThemeColor.BSYellow.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "1000"
            
        }
        //加号
        plusLabel.do{
            $0.text = NSLocalizedString("+", comment: "")
            $0.font = BSFont.BSSubTiny.font
            $0.textColor = BSThemeColor.BSTextColorTiny.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            
        }
        //小费标题
        taskFeeLabel.do{
            $0.text = NSLocalizedString("小费", comment: "")
            $0.font = BSFont.BSSubTiny.font
            $0.textColor = BSThemeColor.BSTextColorTiny.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            
        }
        //小费
        taskFee.do{
            $0.font = BSFont.BSSub.font
            $0.textColor = BSThemeColor.BSYellow.color
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
            $0.font = BSFont.BSSubTiny.font
            $0.textColor = BSThemeColor.BSWhite.color
            $0.textAlignment = .left
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.backgroundColor = BSThemeColor.BSBlue.color
            
        }
        //任务状态
        taskStatus.do{
            $0.textColor = BSThemeColor.BSTextColorNormal.color
            $0.font = BSFont.BSSubTiny.font
            $0.textAlignment = .center
            $0.lineBreakMode = .byTruncatingTail
            self.contentView.addSubview($0)
            
            //test
            $0.text = "已发布"
            $0.backgroundColor = BSThemeColor.BSDivLineColorLight.color
            
        }
        
        //分割线
        divLine2.do{
            $0.image = UIImage.size(width: 1 , height: 1)
                .color(BSThemeColor.BSDivLineColorMid.color)
                .image
            $0.contentMode = .scaleToFill
            self.contentView.addSubview($0)
        }
        
        
    }
    
    
    let headSize = 48
    let clockSize = 16 //时钟图标大小
    let taskStatusSize = 100 //具体任务状态的最小宽度
    
    let contentViewMargin = 10 //左右两边留白
    let contentMinSzie = 10 //标题和摘要最小大小
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
        taskContent.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)//设置可以压缩

        //任务右箭头
        taskContentIcon.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(ContentLineHeight)
            make.top.equalTo(taskPublishTime.snp.bottom)
            make.trailing.equalToSuperview().inset(contentViewMargin)
            
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

