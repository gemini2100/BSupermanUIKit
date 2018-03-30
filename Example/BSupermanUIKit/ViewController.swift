//
//  ViewController.swift
//  BSupermanUIKit
//
//  Created by gemini2100@msn.com on 03/30/2018.
//  Copyright (c) 2018 gemini2100@msn.com. All rights reserved.
//

import UIKit
import BSupermanUIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let image = UIImage.resizable()
            .color(.white)
            .border(color: .blue)
            .border(width: 5)
            .corner(radius: 10)
            .image
        
        let imageview = UIImageView()
        imageview.image = image
        imageview.frame = CGRect(x: 0.0, y: 0.0, width: 200, height: 200)
        
        self.view.addSubview(imageview)
}

}

