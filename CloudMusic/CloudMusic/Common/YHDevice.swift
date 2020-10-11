//
//  YHDevice.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/8.
//  Copyright © 2020 wanwan. All rights reserved.
//

import Foundation

extension UIDevice {
    
    func isiPhonX() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize(width: 1125, height: 2436)))! {
            return true
        }
        
        return false
    }
}
