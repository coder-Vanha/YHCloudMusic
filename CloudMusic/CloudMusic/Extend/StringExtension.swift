//
//  StringExtension.swift
//  CloudMusic
//
//  Created by yehua1 on 2022/6/19.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation


extension String {
    
    /// 去除字符串首位空格和换行
    /// - Returns: string
    func trim() -> String? {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return trimmingCharacters(in: whitespace)
        
    }
    
    /// 是否包含文本
    /// - Parameter find: 文本
    /// - Returns: Bool
    func contans(find:String) -> Bool {
        return range(of: find) != nil
    }
    
    /// 是否包含文本（忽略大小写）
    /// - Parameter find: 文本
    /// - Returns: Bool
    func containsIgnoringCase(find:String) -> Bool {
        return range(of: find, options: .caseInsensitive) != nil
    }
    
    
    // TODO:业务相关，感觉放在此时不合适
    func isStandardNickname() -> Bool {
        if self.count >= 2 && self.count <= 15 {
            return true
        }
        return false
    }
    
    func isStandardPhone() -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@",REGX_PHONE)
        return predicate.evaluate(with: self)
        
    }
    
    func isStandardEmail() -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@",REGX_EMAIL)
        
        return predicate.evaluate(with: self)
    }
    
    func isStandardPassword() -> Bool {
        if count >= 6 && count <= 15 {
            return true
        }
        
        return false
    }
    
    func isStandardCode() -> Bool {
        if count == 4 {
            return true
        }
        return false
    }
    
    
   
}


