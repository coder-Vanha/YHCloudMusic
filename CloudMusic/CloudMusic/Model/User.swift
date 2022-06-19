//
//  User.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

class User: BaseModel {
    
    /// 昵称
    var nickname:String!
    
    /// 头像
    var avatar:String?
    
    /// 描述
    var description:String?
    
    /// 计算属性
    /// 返回格式化后的描述
    var formatDescription:String {
        get {
            if description != nil && !description!.isEmpty {
                return description!
            }
            
            return "这个人很懒，没有填写个人介绍！"
        }
    }
    
    /// 性别
    /// 0：保密，10：男，20：女
    var gender:Int = 0
    var formatGender:String{
        get {
            switch gender {
            case 10:
                return "男"
            case 20:
                return "女"
            default:
                //0
                return "保密"
            }
        }
    }
    
    /// 生日
    /// 格式为yyyy-MM-dd
    var birthday:String?
    
    /// 省
    var province:String?
    
    /// 省编码
    var province_code:String?
    
    /// 市
    var city:String?
    
    /// 市编码
    var city_code:String?
    
    /// 区
    var area:String?
    
    /// 区编码
    var area_code:String?
    
    /// 手机号
    var phone:String!
    
    /// 邮箱
    var email:String!
    
    /// QQ第三方登录Id(后面加密了的)
    var qq_id:String?
    
    /// 微博第三方登录Id
    var weibo_id:String?
    
    // MARK: - 本地过滤字段
    /// 拼音
    var pinyin:String!
    
    /// 拼音首字母
    var pinyinFrist:String!
    
    /// 拼音首字母的首字母
    var frist:String!
    
    /// 关注我的人（粉丝）
    var followers_count = 0
    
    /// 我关注的人（好友）
    var followings_count = 0
    
    /// 是否关注
    /// 1:关注
    /// 在用户详情才会返回
    var following:Int?

    /// 是否关注
    ///
    /// - Returns: <#return value description#>
    func isFollowing() -> Bool {
        return following != nil
    }
}

//{
//    "id": 1,
//    "nickname": "这是postman创建的New",
//    "avatar": "DC5A7C81FF2040768D1562F907A47BBF.jpg",
//    "description": "我们是爱学啊Android开发组哟，有什么问题可以联系我们呀！",
//    "gender": 0,
//    "birthday": "2019-09-28",
//    "province": "福建",
//    "province_code": "4",
//    "city": "龙岩",
//    "city_code": "54",
//    "area": "新罗区",
//    "area_code": "531",
//    "phone": "17360065998",
//    "email": "ixueadev@163.com",
//    "qq_id": null,
//    "wechat_id": null,
//    "weibo_id": null,
//    "created_at": "2019-05-01T05:35:10.000Z",
//    "updated_at": "2019-06-10T10:19:55.000Z",
//    "followers_count": 2,
//    "followings_count": 2
//}
