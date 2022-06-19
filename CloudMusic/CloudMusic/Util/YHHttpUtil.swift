//
//  HttpUtil.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/15.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation
import HandyJSON
import Moya

class YHHttpUtil {
    
    static func handlerRequest(baseResponse:BaseResponse? = nil, error:Error?=nil){
        print("HttpUtil handlerRequest:\(String(describing: baseResponse)),\(String(describing: error))")
        if let error = error as? MoyaError {
            switch error {
            case .imageMapping(let response):
                print("HttpUtil handleRequest imageMapping:\(response)")
            case .stringMapping(let response):
                print("HttpUtil handleRequest stringMapping:\(response)")
                YHToastUtil.short("转为字符创错误，请稍后再试")
            case .statusCode(let response):
                let code = response.statusCode
                switch code {
                case 401:
                    // TODO
                    // AppDelegate.shared.logout()
                    YHToastUtil.short("登录信息过期，请重新登录！")
                case 403:
                    YHToastUtil.short("您没有权限访问！")
                case 404:
                    YHToastUtil.short("您访问的内容不存在！")
                case 500...599:
                    YHToastUtil.short("服务器错误，请稍后再试！")
                default:
                    YHHttpUtil.showUnkowError()
                }
            case .underlying(let nsError as NSError, _):
                switch nsError.code {
                case NSURLErrorNotConnectedToInternet:
                    YHToastUtil.short("网络不太好，请稍后重试")
                case NSURLErrorTimedOut:
                    YHToastUtil.short("连接超时，请稍后重试")
                default:
                    YHHttpUtil.showUnkowError()
                }
            case .requestMapping:
                YHToastUtil.short("请求映射错误，请稍后再试")
            case .objectMapping(_, _):
                YHToastUtil.short("对象映射错误，请稍后再试！")
            case .parameterEncoding(_):
                YHToastUtil.short("参数格式错误，请稍后再试！")
                
            default:
                YHToastUtil.short("HttpUtil handlerRequest other error")
            }
        } else {
            // 业务错误
            if let baseResponse = baseResponse {
                if let message = baseResponse.message {
                    // 有错误提示
                    YHToastUtil.short(message)
                } else {
                    YHHttpUtil.showUnkowError()
                }
            } else {
                YHHttpUtil.showUnkowError()
            }
        }
    }
    static func showUnkowError() {
        YHToastUtil.short("未知错误 请稍后再试！")
    }
    
    /// 返回JSON编码参数
    /// - Parameter parameters: parameters
    /// - Returns: 编码参数
    static func jsonRequestParamters(_ parameters:[String:Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
    
    /// 返回URL编码参数
    /// - Parameter parameters: parameters
    /// - Returns: 编码参数
    static func urlRequestParamters(_ parameters:[String:Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
    
}




