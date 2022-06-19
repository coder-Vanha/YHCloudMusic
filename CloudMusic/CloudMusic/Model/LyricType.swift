//
//  LyricType.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

//导入JSON解析框架
import HandyJSON

/// 歌词类型
///
/// - lrc: LRC歌词
/// - ksc: KSC歌词
enum LyricType:Int,HandyJSONEnum {
    case lrc=0
    case ksc=10
}
