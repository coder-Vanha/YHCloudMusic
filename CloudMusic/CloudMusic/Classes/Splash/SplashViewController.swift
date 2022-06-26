//
//  SplashViewController.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/20.
//  Copyright © 2022 wanwan. All rights reserved.
//

import UIKit

protocol SplashViewControllerDelegate: NSObjectProtocol {
    func skipButtonDidClicked()
}

class SplashViewController: UIViewController {
    
    weak var delegate: SplashViewControllerDelegate?
    
    // 背景imageView
    lazy var _mainImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage.init(named: "SplashAd")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var _subImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage.init(named: "SplashAdBanner")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var _logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage.init(named: "SplashLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    lazy var _lbCopyRight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copyright © 2019 Ixuea. All Rights Reserved"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(hex: 0xAAAAAA)
        label.textAlignment = .center
      
        return label
    }()
    
    
    // 跳过
    lazy var _btSkip : UIButton = {
        let btSkip = UIButton()
        btSkip.backgroundColor = UIColor(red: 221/255, green: 0, blue: 0, alpha: 1)
        btSkip.layer.cornerRadius = 15
        btSkip.layer.masksToBounds = true
        btSkip.setTitle("跳过", for: .normal)
        btSkip.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btSkip.addTarget(self, action: #selector(skipBtnClicked), for: .touchUpInside)
        btSkip.translatesAutoresizingMaskIntoConstraints = false
        btSkip.backgroundColor = UIColor.init(hex:0x7E7E7E)
        
        return btSkip
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(_mainImageView)
        view.addSubview(_subImageView)
        view.addSubview(_btSkip)
        view.addSubview(_logoImageView)
        view.addSubview(_lbCopyRight)
        
          
        NSLayoutConstraint(item: _mainImageView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: _mainImageView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: _mainImageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: _mainImageView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -(106+UI_SAFE_AREA_HEIGHT)).isActive = true
        
        
        NSLayoutConstraint(item: _subImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 129).isActive = true
        NSLayoutConstraint(item: _subImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 311).isActive = true
        NSLayoutConstraint(item: _subImageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -100).isActive = true
        NSLayoutConstraint(item: _subImageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true


        NSLayoutConstraint(item: _btSkip, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80).isActive = true
        NSLayoutConstraint(item: _btSkip, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: _btSkip, attribute: .trailing, relatedBy: .equal, toItem: _mainImageView, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: _btSkip, attribute: .bottom, relatedBy: .equal, toItem: _mainImageView, attribute: .bottom, multiplier: 1.0, constant: -20).isActive = true
        
        
        NSLayoutConstraint(item: _logoImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 188).isActive = true
        NSLayoutConstraint(item: _logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 32).isActive = true
        NSLayoutConstraint(item: _logoImageView, attribute: .top, relatedBy: .equal, toItem: _mainImageView, attribute: .bottom, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: _logoImageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: _lbCopyRight, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: _lbCopyRight, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: _lbCopyRight, attribute: .top, relatedBy: .equal, toItem: _logoImageView, attribute: .bottom, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: _lbCopyRight, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -(20+UI_SAFE_AREA_HEIGHT)).isActive = true
        
    }
    

    @objc func skipBtnClicked(_:UIButton) {
        
        print("🍺跳过")
        
        delegate?.skipButtonDidClicked()
        
        // 协议告知外面销毁
    }

}
