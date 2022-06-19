//
//  ObservableExtend.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/12.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation
import RxSwift
import HandyJSON
import Moya

public enum IxueaError: Swift.Error {
    case objectMapping
}

// 扩展 Observable
extension Observable {
    
    /// 将字符串解析为对象
    /// - Parameter type: 要转为的类
    /// - Returns: 转换后的观察者对象
    public func mapObject<T: HandyJSON>(_ type: T.Type) -> Observable<T?> {
        return self.map { data in
            // 尝试将参数转为字符串
            guard let dataString = data as? String else {
                return nil
            }
            
            if dataString.isEmpty {
                // 空字符串也返回 nil
                return nil
            }
            
            guard let result = type.deserialize(from: dataString) else {
                // 转为对象失败
                throw IxueaError.objectMapping
            }
            // 解析成功 放回解析后的对象
            
            return result
        }
    }
}



// http 网络请求观察者
public class HttpObserver<Element> : ObserverType {
    
    // ObserverType协议中用到了泛型E
    // 所以说子类中要指定E这个泛型，不然就会报错
    public typealias E = Element
    
    // 请求成功的回调
    var onSuccess: ((E) -> Void)
    // 请求失败的回调
    var onError:((BaseResponse?, Error?) -> Bool)?
    
    init (_ onSuccess: @escaping((E) -> Void), _ onError: ((BaseResponse?, Error?) -> Bool)?){
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    /// RxSwift框架里面发送了事件回调
    /// - Parameter event: 事件
    public func on(_ event: Event<Element>) {
        switch event {
            case .next(let value):
            print("HttpOberver next:\(value)")
            let baseResponse = value as? BaseResponse
            if let _ = baseResponse?.status {
                requestErrorHandler(baseResponse:baseResponse)
            }
            case .error(let error):
            print("HttpOserver error:\(error)")
            requestErrorHandler(error:error)
            case .completed:
            print("HttpObserver complete")
        }
    }
    
    // 处理请求错误
    func requestErrorHandler(baseResponse:BaseResponse? = nil, error:Error? = nil){
        if onError != nil && onError!(baseResponse,error){
            
        } else {
            // 要自动处理错误
       // TODO:
          //  HttpUtil
        }
    }
}



// MARK: 扩展ObservableType

extension ObservableType {
    
    /// 观察成功和失败事件Element
    /// - Parameters:
    ///   - onSuccess: 请求成功回调
    ///   - onError: 请求失败回调
    /// - Returns: Disposables
    func subscribe(_ onSuccess: @escaping((Element) -> Void), _ onError: @escaping((BaseResponse?, Error?) -> Bool)) -> Disposable{
        // 创建一个Disposeable
        let disposable = Disposables.create()
        
        // 创建一个HttpObserver
        let observer = HttpObserver<Element>(onSuccess,onError)
    
        // 创建并返回一个Disposanles
        return Disposables.create(self.asObservable().subscribe(observer),disposable)
    }
    
    func subcribeOnSucces(_ onSuccess: @escaping((Element)-> Void)) -> Disposable {
        let dispoable = Disposables.create()
        let observer = HttpObserver<Element>(onSuccess, nil)
        return Disposables.create(self.asObservable().subscribe(observer),dispoable)
    }
    
    
    
}

