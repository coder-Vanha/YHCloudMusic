//
//  Api.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation
import RxSwift
import HandyJSON
import Moya

//// 测试接口
//let ENDPOINT="http://dev-my-cloud-music-api-rails.ixuea.com"
//
//// 正式接口
//let ENDPOINT_PRODUCT="http://my-cloud-music-api-rails.ixuea.com"

class Api {
    
    // 单例设计模式
    static let shared = Api()
    
    // MpyaProvider
    private let provider:MoyaProvider<Service>!
    
    // 私有构造方法
    private init(){
        // 初始化MoyaProvider
        provider = MoyaProvider<Service>()
    }
    
    //注册
    func createUser(avatar:String? = nil, nickname:String, phone:String,email:String, password:String,qq_id:String?=nil,weibo_id:String?=nil) -> Observable<DetailResponse<BaseModel>?> {
        return provider.rx
            .request(.createUser(avatar: avatar, nickname: nickname, phone: phone, email:email,passwd: password, qq_id: qq_id, weibo_id: weibo_id))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(DetailResponse<BaseModel>.self)
    }
    
    // 更新用户
    
    
        
    // 歌单列表
    func sheets() -> Observable<ListResponse<Sheet>?>{
        return provider
            .rx
            .request(.sheets)
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(ListResponse<Sheet>.self)
    }

    // 歌单详情
    func sheetDetail(id:String) -> Observable<DetailResponse<Sheet>?>{
        return provider.rx
            .request(.sheetDetail(id: id))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(DetailResponse<Sheet>.self)
    }
    
    
}
