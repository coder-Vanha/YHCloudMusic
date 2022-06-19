//
//  Service.swift
//  CloudMusic
//
//  Created by Vanha on 2022/5/22.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

import Moya

enum Service {
    case sheetDetail(id:String)
    case sheets
    case createSheet(id:String)
    case collectSheets(id:String)
    case createSheet(title:String)
    
    case createUser(avatar:String?,nickname:String,phone:String,email:String,passwd:String,qq_id:String?,weibo_id:String?)
    case updateUser(id:String,nickname:String?,avatar:String?,description:String?,gender:Int?,birthday:String?,province:String?,province_code:String?,city:String?,city_code:String?,area:String?,area_code:String?)
    case userDetail(id:String,nickname:String?)
    
    case bindAccount(account:String,platform:Int)
    case unbindAccount(platform:Int)
    
    case login(phone:String?,email:String?,password:String?,qq_id:String?,weibo_id:String?)
    case resetPassword(phone:String?,email:String?,code:String,password:String)
}

extension Service: TargetType {
    var baseURL: URL {
        return URL(string: ENDPOINT)!
    }
    
    var path: String {
        switch self {
        case .sheetDetail(let id):
            return "/v1/sheets/\(id).json"
        case .sheets, .createSheet:
            return "/v1/sheets.json"
            
        case .createUser:
            return "/v1/users"
        case .userDetail(let id, _): // _ : nickName
            return "/v1/users/\(id).json"
        case .bindAccount:
            return "/v1/users/bind"
    
        case .unbindAccount(let platform):
            return "/v1/users/\(platform)/unbind"
        // let id, let nickname, let avatar, let description, let gender, let birthday, let province, let province_code, let city, let city_code, let area, let area_code
        case .updateUser(let id, _, _, _, _, _, _, _, _, _, _, _):
            return "/v1/users/\(id).json"
        case .login:
            return "v1/sessions"
        case .resetPassword:
            return "v1/users/reset_password"
        default:
            return""
        }
        
    
    }
    
    // 请求方式
    var method: Moya.Method {
        switch self {
        case .createUser, .login, .bindAccount:
            return .post
        case .unbindAccount:
            return .delete
            
        case .updateUser:
            return .patch
            
        default:
            return .get
        }
        
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        return .requestPlain
    }
    
    var headers: [String : String]? {
        var headers:Dictionary<String,String> = [:]
        // 内容类型
         headers["Content-Type"]="application/json"
        // 判断是否登录了
        if  YHPreferenceUtil.isLogin(){
            let user = YHPreferenceUtil.userId()
            let token = YHPreferenceUtil.userToken()
            
            if DEBUG {
                print("Setvice headers user:\(String(describing: user)),token:\(String(describing: token))")
            }
            
            headers["User"] = user
            headers["Authorization"] = token
        }
      return headers
    }
    
    
}
