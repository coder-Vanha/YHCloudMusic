//
//  BaseResponse.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation
import HandyJSON

class BaseResponse:HandyJSON {
    // 状态码
    var status: Int?
    // 错误信息
    var message:String?
    // HandyJSON 要求有一个init 方法
    required init(){}
}
