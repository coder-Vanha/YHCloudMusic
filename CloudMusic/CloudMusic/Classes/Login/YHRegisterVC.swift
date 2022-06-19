//
//  YHRegisterVC.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/5.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

import Moya
import RxSwift

class YHRegisterVC: BaseViewController {
    
    var avatar:String! // 暂时不支持
    // 第三方登录后的OpenId
    var openId: String?
    
//    /// 第三方登录类型
//    var type:SSDKPlatformType?
//
    
    // 昵称
    lazy var tfNickname : UITextField = {
        let tfNickname = UITextField()
        // userNameTF.backgroundColor = .green
        tfNickname.translatesAutoresizingMaskIntoConstraints = false
        tfNickname.placeholder = "请输入昵称（2~15位）"
        tfNickname.showLeftIcon(name: "LoginItemPhone")
        
        return tfNickname
    }()
    
    // 手机号
    lazy var tfPhone : UITextField = {
        let tfPhone = UITextField()
        //  passWordTF.backgroundColor = .red
        tfPhone.translatesAutoresizingMaskIntoConstraints = false
        tfPhone.placeholder = "请输入手机号"
        tfPhone.showLeftIcon(name: "LoginItemPhone")
        
        
        return tfPhone
    }()
    
    // 邮箱
    lazy var tfEmail : UITextField = {
        let tfEmail = UITextField()
        //  passWordTF.backgroundColor = .red
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        tfEmail.placeholder = "请输入邮箱"
        tfEmail.showLeftIcon(name: "LoginItemPhone")
        
        
        return tfEmail
    }()
    
    // 密码
    lazy var tfPassword : UITextField = {
        let tfPassword = UITextField()
        //  passWordTF.backgroundColor = .red
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.placeholder = "请设置密码（6~15位）"
        tfPassword.showLeftIcon(name: "LoginItemPhone")
        
        
        return tfPassword
    }()
    
    // 确认密码
    lazy var tfConfirmPassword : UITextField = {
        let tfConfirmPassword = UITextField()
        //  passWordTF.backgroundColor = .red
        tfConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        tfConfirmPassword.placeholder = "请确认密码"
        tfConfirmPassword.showLeftIcon(name: "LoginItemPhone")
        
        
        return tfConfirmPassword
    }()
    
    // 注册
    lazy var btRegister : UIButton = {
        let btRegister = UIButton()
        btRegister.backgroundColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1)
        btRegister.layer.cornerRadius = 20
        btRegister.layer.masksToBounds = true
        btRegister.setTitle("注册", for: .normal)
        btRegister.addTarget(self, action: #selector(registerBtnClicked), for: .touchUpInside)
        btRegister.translatesAutoresizingMaskIntoConstraints = false
        
        return btRegister
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = openId {
            self.title = "补充资料"
        } else {
            self.title = "注册"
        }
       
        
    }
    
    override func initSubViewa() {
        super.initSubViewa()
        view.addSubview(tfNickname)
        view.addSubview(tfPhone)
        view.addSubview(tfEmail)
        view.addSubview(tfPassword)
        view.addSubview(tfConfirmPassword)
        view.addSubview(btRegister)
        
        NSLayoutConstraint(item: tfNickname, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: tfNickname, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: tfNickname, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: CGFloat(UI_NAVIGATION_BAR_HEIGHT)+40).isActive = true
        NSLayoutConstraint(item: tfNickname, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        
        NSLayoutConstraint(item: tfPhone, attribute: .top, relatedBy: .equal, toItem: tfNickname, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: tfPhone, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: tfPhone, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: tfPhone, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        
        NSLayoutConstraint(item: tfEmail, attribute: .top, relatedBy: .equal, toItem: tfPhone, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: tfEmail, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: tfEmail, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: tfEmail, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        NSLayoutConstraint(item: tfPassword, attribute: .top, relatedBy: .equal, toItem: tfEmail, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: tfPassword, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: tfPassword, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: tfPassword, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        NSLayoutConstraint(item: tfConfirmPassword, attribute: .top, relatedBy: .equal, toItem: tfPassword, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: tfConfirmPassword, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: tfConfirmPassword, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: tfConfirmPassword, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        NSLayoutConstraint(item: btRegister, attribute: .top, relatedBy: .equal, toItem: tfConfirmPassword, attribute: .bottom, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: btRegister, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: btRegister, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        
        NSLayoutConstraint(item: btRegister, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
        
    }
    
    
    @objc func registerBtnClicked(_:UIButton) {
        
        // 昵称
        let nickName = tfNickname.text!.trim()!
        if nickName.isEmpty {
            YHToastUtil.short("请输入昵称")
            return
        }
        
        guard nickName.isStandardNickname() else{
            YHToastUtil.short("昵称长度不对")
            return
        }
        
        // 获取手机
        let phoneNum = tfPhone.text!.trim()!
        
        if phoneNum.isEmpty {
            YHToastUtil.short("请输入手机号！")
        }
        
        guard phoneNum.isStandardPhone() else {
            YHToastUtil.short("手机号格式不正确！")
            return
        }
        
        // 获取邮箱
        let email = tfEmail.text!.trim()!
        
        if email.isEmpty {
            YHToastUtil.short("请输入邮箱！")
        }
        
        guard email.isStandardEmail() else{
            YHToastUtil.short("邮箱格式不正确！")
            return
        }
        
        // 密码
        let password = tfPassword.text!.trim()!
        
        if password.isEmpty {
            YHToastUtil.short("请输入密码！")
            return
        }
        
        guard password.isStandardPassword() else {
            YHToastUtil.short("密码格式不正确")
            return
        }
        
        // 确认密码
        let confirmPassword = tfConfirmPassword.text!.trim()!
        
        if confirmPassword.isEmpty {
            YHToastUtil.short("请输入确认密码！")
            return
        }
        
        guard confirmPassword.isStandardPassword() else {
            YHToastUtil.short("密码格式不正确！")
            return
        }
        
        guard password == confirmPassword else {
            YHToastUtil.short("两次密码不一致！")
            return
        }

//        TODO: 第三方注册
//        var qq_id:String?
//        var weibo_id:String?
//
//        if type == .typeQQ {
//            <#code#>
//        }
//
        
                
        Api.shared.createUser(avatar: avatar, nickname: nickName, phone: phoneNum, email: email, password: password, qq_id: "", weibo_id: "").subscribe({ data in
            if let data = data?.data {
                // 注册成功
                print("🍺注册成功")
                // 直接登录
                
            } else {
                // 注册失败
            }
        },{ (BaseResponse, error) -> Bool in
            
            return false // 让父类自动处理错误
        }).disposed(by: disposeBag)

        
       
        
        
        
        // 使用网络活动指示器插件
//        let networkPlugin = NetworkActivityPlugin { change, target in
//            if change == .began {
//                print("start request")
//                YHToastUtil.showLoading()
//            } else {
//                print("end request")
//                YHToastUtil.hidenLoading()
//
//            }
//        }
        
        // Test API by Maya
//        let provider = MoyaProvider<Service>(plugins: [networkPlugin])
//
//        provider.request(.sheets) { result in
//            switch result {
//            case let .success(response):
//                let data = response.data
//               // let code = response.statusCode
//
//                let dataString = String(data: data, encoding: .utf8)
//
//                print("🍺 success:\(String(describing: dataString))")
//
//
//            case let .failure(error):
//                print("❌ failure:\(error)")
//            }
//        }
//
       
        
        // Test API by RXSwift
        
//        let provider = MoyaProvider<Service>()
//        provider.rx.request(.sheetDetail(id: "1")).subscribe { (event) in
//            // event 的类型是 SingleEvent<Response>
//
//            switch event {
//            case let .success(response):
//                // 请求成功
//                let data = response.data
//                let code = response.statusCode
//                let dataString = String(data:data, encoding: String.Encoding.utf8)
//                print("RegisterController request success :\(code), dataString:\(String(describing: dataString ?? nil))")
//            case let .error(error):
//                // 请求失败
//                print("RegisterController request failure :\(error)")
//            }
//        }
        
//        // 扩展RxSwift 完成请求详情对象解析
//        let provider = MoyaProvider<Service>()
//        provider.rx
//            .request(.sheetDetail(id: "1"))
//            .asObservable()
//            .mapString()
//            .mapObject(DetailResponse<Sheet>.self)
//            .subscribe(onNext: {data in
//                print("OnNext:\(data?.data!.title ?? "为空")")
//            }) { error in
//                print("Error:\(error)")
//            } onCompleted: {
//                print("onCompleted")
//            } onDisposed: {
//                print("onDisposed")
//            }
    
        // APi 封装测试
//        Api.shared.sheets()
//            .subscribe { data in
//                print("OnNext:\(String(describing: data?.data?.count))")
//            } onError: { error in
//                print("Error:\(error)")
//            } onCompleted: {
//                print("onCompleted")
//            } onDisposed: {
//                print("onDisposed")
//            }
//
//        Api.shared.sheets()
//            .subscribe()
            
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
