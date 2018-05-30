//
//  BSCheckBox.swift
//  BSupermanUIKit
//
//  Created by 陈秋松 on 2018/5/30.
//

import Foundation

public class BSCheckBox: UIButton {
    // Images
    let checkedImage = UIImage.LoadImageFromBundle(name: "checkbox_s")
    let uncheckedImage = UIImage.LoadImageFromBundle(name: "checkbox_n")
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
        self.setImage(uncheckedImage, for: UIControlState.normal)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
