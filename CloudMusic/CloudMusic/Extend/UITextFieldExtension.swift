//
//  UITextFieldExtension.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/8.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

extension UITextField {
    func showLeftIcon(name:String){
        leftView = UIImageView(image: UIImage(named: name))
        leftViewMode = .always
    }
}
