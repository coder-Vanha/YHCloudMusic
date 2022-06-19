//
//  BaseModel.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

//导入JSON解析框架
import HandyJSON

class BaseModel: HandyJSON {
    
    /// Id
    var id:String!
    
    /// 创建时间
    var created_at:String = ""
    
    /// 创建时间
    var updated_at:String = ""
    
    
    //JSON解析框架需要一个默认的init方法
    required init() {}
}
