//
//  Service.swift
//  CloudMusic
//
//  Created by Vanha on 2022/5/22.
//  Copyright © 2022 wanwan. All rights reserved.
//

import Foundation

import Moya

enum Service {
    case sheetDetail(id:String)
    case sheets
}

extension Service: TargetType {
    var baseURL: URL {
        return URL(string: ENDPOINT)!
    }
    
    var path: String {
        switch self {
        case .sheetDetail(let id):
            return "/v1/sheets/\(id).json"
        case .sheets:
            return "/v1/sheets.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
