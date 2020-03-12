//
//  NSDate-Extension.swift
//  
//
//  Created by 1 on 16/9/19.
//  Copyright © 2016年 . All rights reserved.
//

import Foundation


extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
