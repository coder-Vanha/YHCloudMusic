//
//  ListResponse.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation
//导入JSON解析框架
import HandyJSON

class ListResponse<T: HandyJSON>: BaseResponse {
    
    /// 定义一个列表
    /// 里面的对象使用了泛型
    var data:Array<T>?
    
    /// 分页元数据
   // var meta:Meta?
    
}
