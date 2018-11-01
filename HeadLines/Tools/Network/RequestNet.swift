//
//  RequestNet.swift
//  HeadLines
//
//  Created by Leo on 2018/11/1.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import Foundation
import Moya
import HandyJSON
import MBProgressHUD

enum API {
    case getHomeCarousels(status: String , tag: String) //首页轮播
    

}
//@{@"app-type":@"2",@"token":[SpicHelp token],@"app-version":kAppVersion,@"Content-Type":@"multipart/form-data",@"userID":[SpicHelp userID]};
extension API: TargetType {
    var headers: [String : String]? {
        return ["app-type":"2","token": Helper.TOKEN as! String ,"userID": Helper.USERID as! String,"app-version":APPVERSION];
    }
    
    var baseURL: URL {
       return URL(string: BASE_API)!
    }
    var path: String {
        switch self {
        case .getHomeCarousels:
            return "sys/getCarousels";
      
        }
    }
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    var task: Task {
        var parms = ["token": Helper.TOKEN as! String ,"userId": Helper.USERID as! String];
        switch self {
        case .getHomeCarousels(let status, let tag):
            parms["status"] = status
            parms["tag"] = tag
            break
            
        
        default:
            break;
        }
        return .requestParameters(parameters: parms, encoding: URLEncoding.default)
        
    }
    
}
