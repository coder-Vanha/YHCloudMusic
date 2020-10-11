//
//  Constant.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/4.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit


// MARK: - 颜色
/// 全局主色调
/// PRIMARY后缀其实是参考了Android中颜色的命名
let COLOR_PRIMARY=0xdd0000

/// 亮灰色
let COLOR_LIGHT_GREY=0xaaaaaa

/// 高亮颜色
let COLOR_HIGHLIGHT = 0x3385ff


// MARK: - 图片
/// 展位图
let IMAGE_PLACE_HOLDER="PlaceHolder"


// MARK: - 机型

/**
 设备名称                                                       屏幕尺寸    像素          点
 Phone 2G \ iPhone 3G \ iPhone 3GS                              3.5″    320*480    320*480 @1x
 iPhone 4 \ iPhone 4S                                           3.5″    640*960    320*480 @2x
 iPhone 5 \ iPhone 5C \ iPhone 5S \ iPhone SE(一代)               4″     640*1136    320*568 @2x
 iPhone 6 \ iPhone 6S \ iPhone 7 \ iPhone 8 \ iPhone SE(二代)    4.7″    750*1334    375*667 @2x
 iPhone 6+ \ iPhone 6S+ \ iPhone 7+ \ iPhone 8+                 5.5″    1242*2208    414*736 @3x
 iPhone X \ iPhone XS \ iPhone 11 Pro                           5.8″    1125*2436    375*812 @3x
 iPhone XR \ iPhone 11                                          6.1″    828*1792    414*896 @2x
 iPhone XS Max \ iPhone 11 Pro Max                              6.5″    1242*2688    414*896 @3x

 状态栏高度

 非全面屏：20pt
 全面屏：44pt
 安全区域高度：34pt
 */


/**
 机型的屏幕大小
 */

let isiPhoneX = __CGSizeEqualToSize(CGSize(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)

let isiPhoneXR = __CGSizeEqualToSize(CGSize(width: 828/2, height: 1792/2), UIScreen.main.bounds.size)

let isiPhoneXS = __CGSizeEqualToSize(CGSize(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)

let isiPhoneXS_Max = __CGSizeEqualToSize(CGSize(width: 1242/3, height: 2688/3), UIScreen.main.bounds.size)

let isiPhoneX_Series = isiPhoneX || isiPhoneXR || isiPhoneXS || isiPhoneXS_Max


let UI_NAVIGATION_BAR_HEIGHT = isiPhoneX_Series ? 88.0 : 64

let UI_TAB_BAR_HEIGHT = isiPhoneX_Series ? 83.0 : 49

let UI_STATUS_BAR_HEIGHT = isiPhoneX_Series ? 44.0 : 20

let UI_SAFE_AREA_HEIGHT = isiPhoneX_Series ? 34.0 : 0



let UI_SCREEN_WIDTH = UIScreen.main.bounds.size.width

let UI_SCREEN_HEIGHT = UIScreen.main.bounds.size.height


func UI_Scale_375(_ num : CGFloat) -> CGFloat {
    let scale = UI_SCREEN_WIDTH / 375
    return num * scale
}
