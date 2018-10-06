//
//  BSRadioBox.swift
//  BSupermanUIKit
//
//  Created by 陈秋松 on 2018/5/30.
//

import Foundation

public class BSRadioBox: UIButton {
    // Images
    let checkedImage = UIImage.LoadImageFromBundle(name: "radio_selected")
    let uncheckedImage = UIImage.LoadImageFromBundle(name: "radio_n")
    
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
    
    public required init?(coder aDecoder: NSCoder) {
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
