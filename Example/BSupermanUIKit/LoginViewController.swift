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

class LoginViewController: UIViewController {

    
    let statusBar = BSStatusBar(frame: CGRect.zero) //状态栏
    private let navigationBar = BSNavigationBar(frame: CGRect.zero) //导航栏
    
    let lbl_title = UILabel().then
    {
        $0.text = "急客超人"
        $0.textColor = BSThemeColor.BSColor4.color
        $0.font = UIFont.systemFont(ofSize: 46)
        $0.textAlignment = .center
        //$0.backgroundColor = UIColor.yellow
        
    }
    
    let tx_username = BSTextField().then
    {
        $0.placeholder = "你的手机号码/用户ID"
        $0.font = BSFont.BSTitle30.font
        //$0.backgroundColor = UIColor.green

    }
    
    let tx_password = BSTextField().then
    {
        $0.placeholder = "请填写密码"
        $0.font = BSFont.BSTitle30.font
        //$0.backgroundColor = UIColor.red
    }
 
    lazy var btn_login = //{BSUIKit.createTransitionButton(title: "登录")}()
        { () -> UIButton in
            let button = UIButton(frame:CGRect.zero)
            button.setTitle("title", for: .normal)
            button.setTitleColor(BSThemeColor.BSColor0.color, for: .normal)
            button.titleLabel?.font = BSFont.BSTitle32.font
            button.setBackgroundImage(UIImage(color:BSThemeColor.BSColor6.color), for: .normal)
            
            let colorAdd:UIColor = BSThemeColor.BSColor6.color.add(overlay: UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
            button.setBackgroundImage(UIImage(color:colorAdd), for: .highlighted)

            return button
            
    }()
    
    
    let btn_forget = UIButton().then
    {
        $0.setTitle("忘记密码?", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = BSFont.BSTitle30.font
        $0.setTitleColor(BSThemeColor.BSColor2.color, for: .normal)
        $0.contentHorizontalAlignment = .left
        
        //$0.backgroundColor = UIColor.black
    }
    
    let btn_signup = UIButton().then
    {
        $0.setTitle("注册账号", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = BSFont.BSTitle30.font
        $0.setTitleColor(BSThemeColor.BSColor2.color, for: .normal)
        $0.contentHorizontalAlignment = .right
        
        //$0.backgroundColor = UIColor.brown
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(lbl_title);
        self.view.addSubview(tx_username);
        self.view.addSubview(tx_password);
        self.view.addSubview(btn_login);
        self.view.addSubview(btn_forget);
        self.view.addSubview(btn_signup);
        
        statusBar.do{
            
            self.view.addSubview($0)
        }
        
        navigationBar.do{
            $0.style = .Home
            self.view.addSubview($0)
        }
        
        makeUIConstraints()
    }
    
    func makeUIConstraints() {
        
        //状态栏
        statusBar.snp.makeConstraints{ (make) -> Void in
            
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(BSStatusBar.statusBarHeight)
            
        }
        
        
        //导航栏
        navigationBar.snp.makeConstraints{ (make) -> Void in
            
            make.top.equalTo(statusBar.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(BSNavigationBar.navBarHeight)
            
        }
        
        lbl_title.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.height.equalTo(80)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.snp.bottom).multipliedBy(0.15)
        }
        
        tx_username.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).multipliedBy(0.8)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
            make.top.equalTo(lbl_title.snp.bottom).offset(30)
        }
        
        tx_password.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(tx_username)
            make.height.equalTo(tx_username)
            make.centerX.equalTo(tx_username)
            make.top.equalTo(tx_username.snp.bottom).offset(10)
        }
        
        btn_login.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(tx_username.snp.width)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
            make.top.equalTo(tx_password.snp.bottom).offset(30)
        }
        
        btn_forget.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(tx_username.snp.width).multipliedBy(0.5)
            make.height.equalTo(40)
            make.leading.equalTo(btn_login)
            make.top.equalTo(btn_login.snp.bottom).offset(20)
        }
        
        btn_signup.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(btn_forget.snp.width)
            make.height.equalTo(btn_forget)
            make.leading.equalTo(btn_forget.snp.trailing)
            make.top.equalTo(btn_forget)
           
        }
    }
//    func buttonAction(_ button: BSTransitionButton) {
//        button.startAnimation() // 2: Then start the animation when the user tap the button
//        let qualityOfServiceClass = DispatchQoS.QoSClass.background
//        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
//        backgroundQueue.async(execute: {
//
//            sleep(3)
//            DispatchQueue.main.async(execute: { () -> Void in
//                button.stopAnimation(animationStyle: .shake, completion: nil)
//            })
//        })
//    }

}

