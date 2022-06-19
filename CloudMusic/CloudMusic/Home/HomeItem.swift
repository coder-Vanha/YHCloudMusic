//
//  HomeItem.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

//

import KakaJSON

struct HomeItem: Convertible {
    let content:String = ""
    let commentsCount:Int = 0
    let lowUrl:String = ""
    let highUrl:String = ""
    let originUrl:String = ""
    let publishedAt:String = ""
    let user: HomeUser! = nil
    let hotComment:HomeComment? = nil
    
    func kj_JSONKey(from property: Property) -> JSONPropertyKey {
        return property.name.kj.underlineCased()
    }
    
}
