//
//  YHPreferenceUtil.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/4.
//  Copyright © 2020 wanwan. All rights reserved.
//

import Foundation

class YHPreferenceUtil {
    
    /// 是否展示引导页
    /// - Returns: Bool
    static func isShowGuide() -> Bool {
        let isShowGuide = UserDefaults.standard.bool(forKey: KEY_GUIDE)
        return !isShowGuide
    }
    
    static func setShowGuide(_ data:Bool) {
        UserDefaults.standard.set(data, forKey: KEY_GUIDE)
    }
    
    
    
    
    // MARK: - 常量key

    /// 是否显示引导界面常用key
    private static let KEY_GUIDE = "KEY_GUIDE"

    /// 用户Id常量key
    private static let KEY_USER_ID = "KEY_USER_ID"

    /// 用户标识常量key
    private static let KEY_USER_TOKEN = "KEY_USER_TOKEN"

    /// 最后播放音乐的Id
    private static let KEY_LAST_SONG_ID = "KEY_LAST_SONG_ID"

    /// 移除耳机后停止音乐播放Key
    private static let KEY_REMOVE_HEADSET_STOP_MUSIC="KEY_REMOVE_HEADSET_STOP_MUSIC"

    /// 夜间模式key
    private static let KEY_NIGHT="KEY_NIGHT"
}



