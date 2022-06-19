//
//  YHToastUtil.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/11.
//  Copyright © 2022 wanwan. All rights reserved.
//

//import Foundation
import UIKit

class YHToastUtil {

    // TODO: 不用静态的
    private static  let keyWindow:UIWindow = {
        var window:UIWindow = UIApplication.shared.keyWindow!
        if #available(iOS 13.0, *) {
            window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).last!
        }
        return window
    }()
    
    
    static func short (_ message: String) {
        
        let hud = MBProgressHUD.showAdded(to: (keyWindow.rootViewController?.view)!, animated: true)
        hud.mode = .text
        hud.bezelView.color = UIColor.black
        hud.detailsLabel.text = message
        hud.detailsLabel.textColor = UIColor.white
        hud.hide(animated: true, afterDelay: 1)
    }
    
    private static var hud: MBProgressHUD?
    static func showLoading (_ message:String) {
        if let _ = hud {
            return // 已经显示了就不再显示
        }
        
       // hud = MBProgressHUD.showAdded(to: (UIApplication.shared.delegate?.window??.rootViewController?.view)!, animated: true)
        hud = MBProgressHUD.showAdded(to: (keyWindow.rootViewController?.view)!, animated: true)
        hud!.backgroundView.style = .solidColor
        hud!.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
        hud!.bezelView.color = UIColor.black
        hud!.detailsLabel.text = message
        hud!.detailsLabel.textColor = UIColor.white
        hud!.show(animated: true)
    
    }
    
    static func showLoading(){
        showLoading("拼命加载中...")
    }
    
    static func hidenLoading(){
        if let hud = hud {
            hud.hide(animated: true)
            YHToastUtil.hud = nil
        }
    }
    
}
