//
//  YHGuideVC.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/2.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

class YHGuideVC: UIViewController {
    
    var bannerView: YJBannerView?
    
    lazy var footView: UIView = {
        let footView = UIView()
       // footView.backgroundColor = .blue
        footView.translatesAutoresizingMaskIntoConstraints = false
        return footView
    }()
    
    lazy var loginRegisterBtn: UIButton = {
        let loginRegisterBtn = UIButton()
        loginRegisterBtn.translatesAutoresizingMaskIntoConstraints = false
        loginRegisterBtn.setTitle("登录/注册", for: .normal)
        loginRegisterBtn.setTitleColor(.white, for: .normal)
        loginRegisterBtn.addTarget(self, action: #selector(loginRegisterBtnClicked(_:)), for: .touchUpInside)
        loginRegisterBtn.backgroundColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1)
        loginRegisterBtn.layer.cornerRadius = 20
        loginRegisterBtn.layer.masksToBounds = true
        return loginRegisterBtn
    }()
    
    lazy var experienceBtn: UIButton = {
        let experienceBtn = UIButton()
        experienceBtn.translatesAutoresizingMaskIntoConstraints = false
        experienceBtn.setTitle("立即体验", for: .normal)
        experienceBtn.setTitleColor(UIColor(red: 221/255, green: 0, blue: 0, alpha: 1), for: .normal)
        experienceBtn.addTarget(self, action: #selector(experienceBtnClicked(_:)), for: .touchUpInside)
        experienceBtn.layer.borderWidth = 1
        experienceBtn.layer.borderColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1).cgColor
        experienceBtn.backgroundColor = .white
        experienceBtn.layer.cornerRadius = 20
        experienceBtn.layer.masksToBounds = true
        
        return experienceBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
    }
    

    func initSubViews(){
        // banner View
        bannerView = YJBannerView()
        settingBannerView()
        
        view.addSubview(footView)
        footView.addSubview(loginRegisterBtn)
        footView.addSubview(experienceBtn)
        
        if let bannerView = bannerView {
            view.addSubview(bannerView)
           
           // bannerView.backgroundColor = .red
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint(item: bannerView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: bannerView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: bannerView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: bannerView, attribute: .bottom, relatedBy: .equal, toItem: self.footView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
            
          
        }
       
    
       
        // footView
        NSLayoutConstraint(item: self.footView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self.footView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self.footView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: CGFloat(-UI_SAFE_AREA_HEIGHT)).isActive = true
        NSLayoutConstraint(item: self.footView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100).isActive = true
        
        
        //  login & register Button
        NSLayoutConstraint(item: loginRegisterBtn, attribute: .leading, relatedBy: .equal, toItem: footView, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: loginRegisterBtn, attribute: .centerY, relatedBy: .equal, toItem: footView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: loginRegisterBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100).isActive = true
        NSLayoutConstraint(item: loginRegisterBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
        
        // experience Button
        NSLayoutConstraint(item: experienceBtn, attribute: .trailing, relatedBy: .equal, toItem: footView, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: experienceBtn, attribute: .centerY, relatedBy: .equal, toItem: footView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: experienceBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100).isActive = true
        NSLayoutConstraint(item: experienceBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        
       
      
    }
    

    @objc func loginRegisterBtnClicked(_: UIButton){
        print("注册点击")
        let loginOrRegisterVC = YHLoginOrRegisterVC()
        let navi = YHNaviController(rootViewController: loginOrRegisterVC)
        let keyWin = UIApplication.shared.keyWindow
        keyWin?.rootViewController = navi
        
    }
    
    @objc func experienceBtnClicked(_: UIButton){
        print("立即体验")
        let homeVC = YHHomeVC()
        let navi = YHNaviController(rootViewController: homeVC)
        let keyWin = UIApplication.shared.keyWindow
        keyWin?.rootViewController = navi
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
   

}
