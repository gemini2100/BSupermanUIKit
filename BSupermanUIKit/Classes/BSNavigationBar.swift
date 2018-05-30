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

public class BSNavigationBar: UIView {
    
    
    public enum NavBarStyle {
        case None
        case BackTitle
        case BackTitleNext(next: String)
        case LeftTitleRight(left: String, right: String)
        case LeftTitleRightWithImage(left: String, right: String, leftImage: String, rightImage: String)
    }

    
    private var resourceBundle:Bundle? = nil
    
    private var _style = NavBarStyle.None
    
    private lazy var leftButton = UIButton(frame: CGRect.zero)
    private lazy var titleLabel = UILabel(frame: CGRect.zero)
    private lazy var rightButton = UIButton(frame: CGRect.zero)
    
    
    public var leftTaps:Observable<Void>
    {
        return leftButton.rx.tap.asObservable()
    }

    public var rightTaps:Observable<Void>
    {
        return rightButton.rx.tap.asObservable()
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
        backgroundColor = BSThemeColor.BSTitleBlue_3399ff.color

        self.addSubview(leftButton)
        self.addSubview(titleLabel)
        self.addSubview(rightButton)
    }


    public var style: NavBarStyle {

        set {

            switch (newValue) {
            case .None:

                print("NavBarStyle None")

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
                titleLabel.textColor = BSThemeColor.BSWhite_ffffff.color
                titleLabel.font = BSFont.BSTitle30.font
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

