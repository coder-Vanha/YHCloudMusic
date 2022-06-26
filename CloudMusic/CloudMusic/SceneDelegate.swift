//
//  SceneDelegate.swift
//  CloudMusic
//
//  Created by Vanha on 2020/9/25.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // 保存UIScene
    public var _winScene: UIWindowScene?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         
        guard let winScene = (scene as? UIWindowScene) else { return }
        
        _winScene = winScene
        
        gotoHomeVC()
        
//       // var rootVC : UIViewController
//        if YHPreferenceUtil.isShowGuide() {
//           // rootVC = YHGuideVC()
//            gotoGuideVC()
//
//        } else {
////            let homeVC = HomeViewController()
////            rootVC = UINavigationController(rootViewController: homeVC)
//            gotoHomeVC()
//        }
        
//        let win = UIWindow(windowScene: winScene)
//        win.rootViewController = rootVC
//        win.backgroundColor =  .white
//        win.makeKeyAndVisible()
//        window = win
        
    }
    
    func gotoHomeVC() {
      //  let splash = Splash.init()
     //   splash.show();
        
        setRootVC(TableBarController())
//        let homeVC = HomeViewController()
//        let root = UINavigationController(rootViewController: homeVC)
//        setRootVC(root)
    }
    
    func gotoGuideVC() {
        let guideVC = YHGuideVC()
        setRootVC(guideVC)
    }
    
    func gotoAD() {
       // setRootVC()
    }
    
    func gotoLoginOrRegisterVC(){
        let loginOrRegisterVC = YHLoginOrRegisterVC()
        setRootVC(loginOrRegisterVC)
        
    }
    
    func setRootVC(_ root: UIViewController){
       // guard let winScene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: _winScene!)
        win.rootViewController = root
        win.backgroundColor =  .white
        win.makeKeyAndVisible()
        window = win
    }
    
    
    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

