//
//  SheetWrapper.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

import  HandyJSON

class SheetWrapper : HandyJSON {
    
    /// 歌单数据
    var data:Sheet!
    
    //因为HandyJSON解析框架要求有一个init方法
    required init() {}
}
