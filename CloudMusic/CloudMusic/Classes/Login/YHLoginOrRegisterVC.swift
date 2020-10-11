//
//  YHLoginOrRegisterVC.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/5.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

class YHLoginOrRegisterVC: UIViewController {
   
    lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LoginLogo")
        return logo
    }()
    
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor(red: 221/255, green: 0, blue: 0, alpha: 1), for: .normal)
        loginBtn.addTarget(self, action: #selector(loginBtnClicked(_:)), for: .touchUpInside)
       // loginBtn.backgroundColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1)
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1).cgColor
        loginBtn.layer.cornerRadius = 20
        loginBtn.layer.masksToBounds = true
        return loginBtn
    }()
    
    lazy var registerBtn: UIButton = {
        let registerBtn = UIButton()
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.setTitle("注册", for: .normal)
        registerBtn.setTitleColor(UIColor(red: 221/255, green: 0, blue: 0, alpha: 1), for: .normal)
        registerBtn.addTarget(self, action: #selector(registerBtnClicked(_:)), for: .touchUpInside)
        registerBtn.layer.borderWidth = 1
        registerBtn.layer.borderColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1).cgColor
        registerBtn.backgroundColor = .white
        registerBtn.layer.cornerRadius = 20
        registerBtn.layer.masksToBounds = true
        
        return registerBtn
    }()
    
    lazy var footView: UIView = {
        let footView = UIView()
         footView.backgroundColor = .blue
        footView.translatesAutoresizingMaskIntoConstraints = false
        return footView
    }()
    
    lazy var textLb: UILabel = {
        let textLb = UILabel()
        textLb.translatesAutoresizingMaskIntoConstraints = false
        textLb.text = "其他登录方式"
        textLb.font = UIFont.systemFont(ofSize: 16)
        textLb.textColor = UIColor.lightGray
        textLb.textAlignment = .center
       // textLb.backgroundColor = .green
        return textLb
    }()
    
    // 微信
    lazy var weChatBtn: UIButton = {
        let weChatBtn = UIButton()
        weChatBtn.translatesAutoresizingMaskIntoConstraints = false
        weChatBtn.setTitle("微信", for: .normal)
        weChatBtn.setImage(UIImage(named: "LoginWechat"), for: .normal)
        weChatBtn.setImage(UIImage(named: "LoginWechatSelected"), for: .selected)
        weChatBtn.setTitleColor(.lightGray, for: .normal)
        weChatBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        weChatBtn.addTarget(self, action: #selector(weChatBtnClicked(_:)), for: .touchUpInside)
     
       // weChatBtn.backgroundColor = .green
        weChatBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        weChatBtn.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        weChatBtn.setupButtonImageAndTitlePossitionWith(padding: 3, style: .imageIsTop)
  
        
        return weChatBtn
    }()
    
    // QQ
      lazy var qqBtn: UIButton = {
          let qqBtn = UIButton()
          qqBtn.translatesAutoresizingMaskIntoConstraints = false
          qqBtn.setTitle("QQ", for: .normal)
          qqBtn.setImage(UIImage(named: "LoginQQ"), for: .normal)
          qqBtn.setImage(UIImage(named: "LoginQQSelected"), for: .selected)
          qqBtn.setTitleColor(.lightGray, for: .normal)
          qqBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
          qqBtn.addTarget(self, action: #selector(qqBtnClicked(_:)), for: .touchUpInside)
       
         // qqBtn.backgroundColor = .green
          qqBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
          qqBtn.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
          qqBtn.setupButtonImageAndTitlePossitionWith(padding: 3, style: .imageIsTop)
    
          
          return qqBtn
      }()
    
    // 微博
      lazy var sinaBlogBtn: UIButton = {
          let sinaBlogBtn = UIButton()
          sinaBlogBtn.translatesAutoresizingMaskIntoConstraints = false
          sinaBlogBtn.setTitle("微博", for: .normal)
          sinaBlogBtn.setImage(UIImage(named: "LoginWeibo"), for: .normal)
          sinaBlogBtn.setImage(UIImage(named: "LoginWeiboSelected"), for: .selected)
          sinaBlogBtn.setTitleColor(.lightGray, for: .normal)
          sinaBlogBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
          sinaBlogBtn.addTarget(self, action: #selector(sinaBlogBtnClicked(_:)), for: .touchUpInside)
       
         // sinaBlogBtn.backgroundColor = .green
          sinaBlogBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
          sinaBlogBtn.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
          sinaBlogBtn.setupButtonImageAndTitlePossitionWith(padding: 3, style: .imageIsTop)
    
          
          return sinaBlogBtn
      }()
    
    // 网易
      lazy var netEaseBtn: UIButton = {
          let netEaseBtn = UIButton()
          netEaseBtn.translatesAutoresizingMaskIntoConstraints = false
          netEaseBtn.setTitle("网易", for: .normal)
          netEaseBtn.setImage(UIImage(named: "LoginNetease"), for: .normal)
          netEaseBtn.setImage(UIImage(named: "LoginNeteaseSelected"), for: .selected)
          netEaseBtn.setTitleColor(.lightGray, for: .normal)
          netEaseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
          netEaseBtn.addTarget(self, action: #selector(netEaseBtnClicked(_:)), for: .touchUpInside)
       
        //  netEaseBtn.backgroundColor = .green
          netEaseBtn.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
          netEaseBtn.setupButtonImageAndTitlePossitionWith(padding: 3, style: .imageIsTop)
    
          
          return netEaseBtn
      }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .red
        self.title = "登录/注册"
        initSubViews()
    }
    
    // MARK - UI
    func initSubViews(){
        view.addSubview(logoImageView)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.addSubview(textLb)
        view.addSubview(weChatBtn)
        view.addSubview(qqBtn)
        view.addSubview(sinaBlogBtn)
        view.addSubview(netEaseBtn)
        
        
        //  logoImageView
        NSLayoutConstraint(item: logoImageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: UI_Scale_375(150)).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 76).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 76).isActive = true
        
        
        //  login Button
        NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: logoImageView, attribute: .bottom, multiplier: 1.0, constant: 150).isActive = true
        NSLayoutConstraint(item: loginBtn, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: loginBtn, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
        
        // register Button
        NSLayoutConstraint(item: registerBtn, attribute: .top, relatedBy: .equal, toItem: loginBtn, attribute: .bottom, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: registerBtn, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: registerBtn, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: registerBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
        
        
         // rtextLb
        NSLayoutConstraint(item: textLb, attribute: .bottom, relatedBy: .equal, toItem: weChatBtn, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: textLb, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: textLb, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: textLb, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
        
        
        
        let viewDic = ["view1": weChatBtn,"view2": qqBtn,"view3": sinaBlogBtn,"view4": netEaseBtn]
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[view1]-10-[view2(==view1)]-10-[view3(==view2)]-10-[view4(==view3)]-20-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics: nil, views: viewDic)
        self.view.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view1(100)]-\(UI_SAFE_AREA_HEIGHT)-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics: nil, views: viewDic)
        self.view.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view2(100)]-\(UI_SAFE_AREA_HEIGHT)-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics: nil, views: viewDic)
        self.view.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view3(100)]-\(UI_SAFE_AREA_HEIGHT)-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics: nil, views: viewDic)
        self.view.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view4(100)]-\(UI_SAFE_AREA_HEIGHT)-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics: nil, views: viewDic)
        self.view.addConstraints(constraints)
        
    
    }
    
    
    
    // MARK - Event
    @objc func loginBtnClicked(_: UIButton) {
        
        navigationController?.pushViewController(YHLoginVC(), animated: true)
        
    }
    
    @objc func registerBtnClicked(_: UIButton) {
        navigationController?.pushViewController(YHRegisterVC(), animated: true)
    }
    
    @objc func weChatBtnClicked(_: UIButton) {
        
    }
    
    @objc func qqBtnClicked(_: UIButton) {
        
    }
    @objc func sinaBlogBtnClicked(_: UIButton) {
        
    }
    
    @objc func netEaseBtnClicked(_: UIButton) {
        
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
