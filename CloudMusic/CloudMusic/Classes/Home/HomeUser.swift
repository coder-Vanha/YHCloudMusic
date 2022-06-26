//
//  HomeUser.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

import KakaJSON

struct HomeUser: Convertible {
    let thumb:String = ""
    let mediaum:Int = 0
    let age:String = ""
    let id:String = ""
    let name:String = ""
   
    func kj_JSONKey(from property: Property) -> JSONPropertyKey {
        if property.name == "name" {return "login"} //  服务器返回的login 映射为 本地用name
        return property.name // 其他与服务器下发一致
    }
    
}
