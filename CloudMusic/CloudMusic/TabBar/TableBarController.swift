//
//  TableBarController.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

import UIKit

class TableBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(TabBar(), forKeyPath: "tabBar")
        _addChild("推荐", "index_Label_find", "", HomeViewController.self)
        _addChild("视频", "index_Label_video", "", YHShortVideoVC.self)
        _addChild("发现", "index_Label_me", "", YHShortVideoVC.self)
        _addChild("朋友", "index_Label_friend", "", YHShortVideoVC.self)
        _addChild("我的", "index_Label_number", "", YHShortVideoVC.self)
        self.tabBar.tintColor = .red
        self.tabBar.backgroundColor = .white
    }
    
    
    func _addChild(_ title: String,
                   _ image: String,
                   _ selectedImage: String,
                   _ type: UIViewController.Type) {
        let child = YHNaviController(rootViewController:type.init())
        child.title = title;
        child.tabBarItem.image = UIImage(named: image)
        child.tabBarItem.selectedImage = UIImage(named: image)
        addChild(child)
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
