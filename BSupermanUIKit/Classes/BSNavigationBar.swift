//
//  BSNavigationBar.swift
//  BSupermanUIKit_Example
//
//  Created by 陈秋松 on 2018/4/29.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Action

public class BSNavigationBar: UIView {
    
    
    public enum NavBarStyle {
        case None
        case Home
        case BackTitle
        case BackTitleNext(next: String)
        case LeftTitleRight(left: String, right: String)
        case LeftTitleRightWithImage(left: String, right: String, leftImage: String, rightImage: String)
    }

    
    private var resourceBundle:Bundle? = nil
    
    private var _style = NavBarStyle.None
    
    private lazy var leftButton = UIButton(type:.custom)
    private lazy var titleLabel = UILabel(frame: CGRect.zero)
    private lazy var rightButton = UIButton(type:.custom)
    
    
    public var leftTaps:Observable<Void>
    {
        return leftButton.rx.tap.asObservable()
    }

    public var rightTaps:Observable<Void>
    {
        return rightButton.rx.tap.asObservable()
    }
    
    func bindAction(leftAction:CocoaAction , rightAction:CocoaAction)
    {
        leftButton.rx.action = leftAction
        rightButton.rx.action = rightAction
    }
    
    /// 返回导航栏高度
    public static var navBarHeight: Int {
        return 44
    }

    public required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = BSThemeColor.BSColor4.color

        self.addSubview(leftButton)
        self.addSubview(titleLabel)
        self.addSubview(rightButton)
    }


    public var style: NavBarStyle {

        set {

            switch (newValue) {
            case .None:

                print("NavBarStyle None")

            case .Home:
                let frameworkBundle = Bundle(for: BSNavigationBar.self)
                let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("BSupermanUIKit.bundle")
                let resourceBundle = Bundle(url: bundleURL!)
                
                let backImage = UIImage(named: "list",
                                         in: resourceBundle,
                                         compatibleWith: nil)
                
                leftButton.setImage(backImage, for: .normal)
                leftButton.setImage(backImage, for: .highlighted)
                leftButton.contentHorizontalAlignment = .left
                
                // 添加背景色测试用代码
            
//                let black = UIImage.size(width: 10, height: 10)
//                    .color(.black)
//                    .image
//                leftButton.setBackgroundImage(black, for: .normal)
//                rightButton.setBackgroundImage(black, for: .normal)
                
                //
                titleLabel.text = "急客超人"
                titleLabel.textColor = BSThemeColor.BSColor0.color
                titleLabel.font = BSFont.BSTitle36.font
                titleLabel.textAlignment = .center
                
                let addImage = UIImage(named: "addbutton",
                                        in: resourceBundle,
                                        compatibleWith: nil)
                
                rightButton.setImage(addImage, for: .normal)
                rightButton.setImage(addImage, for: .highlighted)
                rightButton.contentHorizontalAlignment = .right
                
                titleLabel.snp.makeConstraints { (make) -> Void in
                    make.height.equalToSuperview()
                    make.center.equalToSuperview()
                }
                
                leftButton.snp.makeConstraints { (make) -> Void in
                    
                    make.left.equalToSuperview().offset(4)
                    make.height.equalToSuperview()
                    make.width.equalTo(60)
                    make.centerY.equalTo(titleLabel)
                    
                }
                
                rightButton.snp.makeConstraints { (make) -> Void in
                    
                    make.right.equalToSuperview().offset(-4)
                    make.height.equalToSuperview()
                    make.width.equalTo(60)
                    make.centerY.equalTo(titleLabel)
                    
                }
            case .BackTitle:
                
                let frameworkBundle = Bundle(for: BSNavigationBar.self)
                let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("BSupermanUIKit.bundle")
                let resourceBundle = Bundle(url: bundleURL!)
                
                let backImageP = UIImage(named: "title_button_back_p",
                                         in: resourceBundle,
                                         compatibleWith: nil)
                
                let backImageN = UIImage(named: "title_button_back_n",
                                         in: resourceBundle,
                                         compatibleWith: nil)

                
                leftButton.setImage(backImageP, for: .normal)
                leftButton.setImage(backImageN, for: .highlighted)


                titleLabel.text = "急客超人"
                titleLabel.textColor = BSThemeColor.BSColor0.color
                titleLabel.font = BSFont.BSTitle36.font
                titleLabel.textAlignment = .center

                titleLabel.snp.makeConstraints { (make) -> Void in
                    make.height.equalToSuperview()
                    make.center.equalToSuperview()
                }

                leftButton.snp.makeConstraints { (make) -> Void in

                    make.leading.equalToSuperview()
                    make.height.equalToSuperview()
                    make.lastBaseline.equalTo(titleLabel)

                }

            case .BackTitleNext(let next):
                print("BackTitleNext: \(next)")

            case .LeftTitleRight(let left, let right):
                print("LeftTitleRight: \(left),\(right)")

            case .LeftTitleRightWithImage(let left, let right, let leftImage, let rightImage):
                print("LeftTitleRight: \(left), \(right) , \(leftImage) , \(rightImage)")

            }

            _style = newValue


        }
        
        get {
            
            return _style
        }

    }


}

extension BSNavigationBar{
    
    func loadImageBundle(named imageName:String) -> UIImage? {
        let podBundle = Bundle(for: self.classForCoder)
        if let bundleURL = podBundle.url(forResource: "Update with directory name", withExtension: "bundle")
        {
            let imageBundel = Bundle(url:bundleURL )
            let image = UIImage(named: imageName, in: imageBundel, compatibleWith: nil)
            return image
        }
        return nil
    }
    
    var getBundle:Bundle{
  
        if resourceBundle == nil
        {
            let frameworkBundle = Bundle(for: BSNavigationBar.self)
            let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("BSupermanUIKit.bundle")
            resourceBundle = Bundle(url: bundleURL!)
            
        }
        return resourceBundle!
    }
    
}

