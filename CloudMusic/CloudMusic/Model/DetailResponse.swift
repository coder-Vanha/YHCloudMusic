//
//  DetailResponse.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation
import HandyJSON
import Moya

class DetailResponse<T: HandyJSON>: BaseResponse {
    var data:T?
}
