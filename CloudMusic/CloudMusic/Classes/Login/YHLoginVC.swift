//
//  YHLoginVC.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/4.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

class YHLoginVC: BaseViewController {
    // 用户名
    lazy var _userNameTextField : UITextField = {
        let userNameTF = UITextField()
       // userNameTF.backgroundColor = .green
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.placeholder = "请输入手机号/邮箱"
        userNameTF.showLeftIcon(name: "LoginItemPhone")
        
        return userNameTF
    }()
    lazy var _passWordTextField : UITextField = {
        let passWordTF = UITextField()
      //  passWordTF.backgroundColor = .red
        passWordTF.translatesAutoresizingMaskIntoConstraints = false
        passWordTF.placeholder = "请输入密码"
        passWordTF.showLeftIcon(name: "LoginItemPhone")
        
        
        return passWordTF
    }()
    
    lazy var _loginBtn : UIButton = {
        let loginBtn = UIButton()
        loginBtn.backgroundColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1)
        loginBtn.layer.cornerRadius = 20
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        return loginBtn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        initSubViews()
    }
    
    func initSubViews() {
        
        view.addSubview(_userNameTextField)
        view.addSubview(_passWordTextField)
        view.addSubview(_loginBtn)
        
    
        NSLayoutConstraint(item: _userNameTextField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: _userNameTextField, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: _userNameTextField, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: CGFloat(UI_NAVIGATION_BAR_HEIGHT)+40).isActive = true
        NSLayoutConstraint(item: _userNameTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        
        NSLayoutConstraint(item: _passWordTextField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: _passWordTextField, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: _passWordTextField, attribute: .top, relatedBy: .equal, toItem: _userNameTextField, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: _passWordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        
        NSLayoutConstraint(item: _loginBtn, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: _loginBtn, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: _loginBtn, attribute: .top, relatedBy: .equal, toItem: _passWordTextField, attribute: .bottom, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: _loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
    }
    
    @objc func loginBtnClicked(_: UIButton) {
        
    // TODO: 接口登录请求
        
        
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
