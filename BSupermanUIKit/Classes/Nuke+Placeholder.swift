//
//  BSCheckBox.swift
//  BSupermanUIKit
//
//  Created by 陈秋松 on 2018/5/30.
//

import Nuke

    
public func loadImageWithPlaceholder(with url: String,into view: UIImageView){
    
    let placeholder = UIImage.LoadImageFromBundle(name: "person_photo")
    
    let url:URL = URL(string: url) ?? URL(string:"https://")!
    let request = ImageRequest(url: url)
    let options = ImageLoadingOptions(placeholder: placeholder)
    Nuke.loadImage(with: request, options: options, into: view)
    
}

