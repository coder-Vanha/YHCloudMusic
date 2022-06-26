//
//  Splash.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/26.
//  Copyright © 2022 wanwan. All rights reserved.
//

import UIKit

class Splash: NSObject {
    
    
    
    var splashWindow : UIWindow = UIWindow()
    
    override init() {
        super.init()
    }
    
    func show() {
        
        splashWindow.backgroundColor = .white
        let rootVC = SplashViewController.init()
        rootVC.delegate = self
        splashWindow.rootViewController = rootVC
        splashWindow.frame = UIScreen.main.bounds
        splashWindow.windowLevel = UIWindow.Level(UIWindow.Level.alert.rawValue + 10000)
        splashWindow.resignKey()
        splashWindow.makeKeyAndVisible();
        if #available(iOS 13.0, *) {
            NotificationCenter.default.addObserver(forName: UIScene.willConnectNotification, object: nil, queue: nil) { (note) in
                self.splashWindow.windowScene = note.object as? UIWindowScene
            }
            
            for windowScene in UIApplication.shared.connectedScenes {
                 // if (windowScene.activationState == UIScene.ActivationState.foregroundActive) {
                print("🍺注册window2\(splashWindow.windowLevel)")
                      splashWindow.windowScene = windowScene as? UIWindowScene
                //  }
              }
           
        } else {
            // Fallback on earlier versions
        }
        
        // 倒计时
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
            self.close()
        }
        
    }
    
    func close() {
        self.splashWindow.resignKey()
        self.splashWindow.rootViewController = nil
        self.splashWindow.removeFromSuperview()
        if #available(iOS 13.0, *) {
            self.splashWindow.windowScene = nil
        } else {
            // Fallback on earlier versions
        }
        
        // self.splashWindow.
    }

}

extension Splash : SplashViewControllerDelegate {
    
    func skipButtonDidClicked() {
        self.close()
    }
}
