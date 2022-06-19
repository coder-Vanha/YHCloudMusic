//
//  Song.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

class Song: BaseModel {
    
    /// 标题
    var title:String!
    
    /// 封面图
    var banner:String!
    
    /// 音乐地址
    var uri:String!
    
    /// 点击数
    var clicks_count = 0
    
    /// 评论数
    var comments_count:Int = 0
    
    /// 歌词类型
    var style:LyricType!
    
    /// 歌词内容
    var lyric:String?
    
    /// 创建该音乐的人
    var user:User!
    
    /// 歌手
    var singer:User!
    
    /// 是否在播放列表中
    var playList = false
    
    
    // MARK: - 播放后才有值
    
    /// 时长
    var duration:Float = 0
    
    /// 播放进度
    var progress:Float = 0
    
    /// 将Song转为SongLocal对象
    ///
//    /// - Returns: <#return value description#>
//    func toSongLocal() -> SongLocal {
//        //创建一个对象
//        let songLocal = SongLocal()
//        
//        //将要保存的字段赋值到songLocal对象
//        songLocal.id = id
//        songLocal.title=title
//        songLocal.banner = banner
//        songLocal.uri=uri
//        songLocal.singer_id = singer.id
//        songLocal.singer_nickname=singer.nickname
//        songLocal.singer_avatar=singer.avatar
//        songLocal.playList=playList
//        
//        //音乐时长
//        songLocal.duration = duration
//        
//        //播放进度
//        songLocal.progress = progress
//        
//        return songLocal
//    }
    
}


