//
//  String+Extensions.swift
//  rushsuperman
//
//  Created by 陈秋松 on 2018/1/22.
//  Copyright © 2018年 Nicky. All rights reserved.
//

import Foundation

public extension String
{
    func trimmed() -> String
    {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func getLocalizedString() -> String
    {
        let localizedString = NSLocalizedString(self, comment: "default")
        return localizedString
    }
}
