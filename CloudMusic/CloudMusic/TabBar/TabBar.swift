//
//  TabBar.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    override func layoutSubviews() {
         super.layoutSubviews()
        
        // 更改TabBar中文本和图片的位置
        for button in subviews where button is UIControl { // 过滤出UITabBarButton
            var frame = button.frame
            frame.origin.y = -2
            button.frame = frame
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
