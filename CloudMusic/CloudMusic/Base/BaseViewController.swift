//
//  BaseViewController.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    //负责对象销毁
    //这个功能类似NotificationCenter的removeObserver
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initSubViewa()
        initData()

        // Do any additional setup after loading the view.
    }
    
    
    func initSubViewa() {}
    
    func initData() {}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
