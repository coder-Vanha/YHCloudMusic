//
//  YHRegisterVC.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/5.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

class YHRegisterVC: YHBaseVC {
    
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
