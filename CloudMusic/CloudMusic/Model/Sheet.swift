//
//  Sheet.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

import HandyJSON

class Sheet : HandyJSON {
    
    // 歌单id
    var id:String!
    
    // 标题
    var title:String!
    
    // 封面
    var banner:String?
    
    // 描述
    var description:String?
    
    // 点击数
    var clicks_count:Int = 0
    
    // 收藏数
    var collections_count:Int = 0;
    
    // 评论数
    var comments_count:Int = 0;
    
    // 音乐数
    var songs_count:Int = 0
    
    /// 歌单创建者
    var user:User!
    
    /// 歌曲
    var songs:[Song]?
    
    /// 是否收藏；有值就表示收藏了
    var collection_id:Int?
    
    
    //HandyJSON需要一个init方法
    required init(){}
    
    /// 是否收藏
    ///
    /// - Returns: true:收藏；false:没有收藏
    func isCollection() -> Bool {
//        if collection_id != nil {
//            return true
//        }
//
//        return false
        
        return collection_id == nil ? false:true
    }
    
}
