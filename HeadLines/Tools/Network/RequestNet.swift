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
import Toast_Swift

enum API {
    case getHomeCarousels(status: String , tag: String) //首页轮播
    case postUserLogin(mobile: String , password: String)//登录

}
//@{@"app-type":@"2",@"token":[SpicHelp token],@"app-version":kAppVersion,@"Content-Type":@"multipart/form-data",@"userID":[SpicHelp userID]};
extension API: TargetType {
    var headers: [String : String]? {
        return ["app-type":"2","token": Helper.TOKEN ?? "" ,"userId": Helper.USERID ?? "","app-version":APPVERSION];
    }
    
    var baseURL: URL {
       return URL(string: BASE_API)!
    }
    var path: String {
        switch self {
        case .getHomeCarousels:
            return "sys/getCarousels";
        case .postUserLogin:
            return "user/login";
        }
    }
    var method: Moya.Method {
        switch self {
        case .postUserLogin:
        return .post
        default:
        return  .get
     }
        
    }
    
    var parameterEncoding: ParameterEncoding {
        if method == .get {
            return URLEncoding.default
        }
        return JSONEncoding.default
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    var task: Task {
        var parms = ["token": Helper.TOKEN ?? "" ,"userId": Helper.USERID ?? ""];
        switch self {
        case .getHomeCarousels(let status, let tag) :
            parms["status"] = status
            parms["tag"] = tag
           break
            
        case .postUserLogin(let mobile, let password):
            parms["mobile"] = mobile
            parms["password"] = password
             break
            
        }
       return .requestParameters(parameters: parms, encoding: parameterEncoding)
        
    }
    
}

extension Response {

    func mapModel<U:HandyJSON>(_ type: U.Type) throws -> U {
        let json = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<U>.deserializeFrom(json: json) else {
            throw MoyaError.jsonMapping(self)
            
        }
        if self.statusCode == 401{
            //退出登录
        }
        return model
    }
}
extension MoyaProvider {
    open func request<T: HandyJSON>(_ target: Target,model: T.Type,completion:((_ response: T?) -> Void)?) -> Cancellable? {
        return request(target, completion: { (result) in
            guard let completion = completion else {return}
            guard let returnData = try? result.value?.mapModel(ResponseData<T>.self) else {
                completion(nil)
                return
            }
            completion(returnData?.data?.data)
        })
    }
}
//配置
//let headerFields: Dictionary<String, String> = [
//    "platform": "iOS",
//    "sys_ver": String(UIDevice.version())
//]


let timeoutClourse = {
    (endpoit: Endpoint, clourse: MoyaProvider<API>.RequestResultClosure) -> Void in
    if var urlRequest = try? endpoit.urlRequest() {
        urlRequest.timeoutInterval = 20
        clourse(.success(urlRequest))
    }else {
        clourse(.failure(MoyaError.requestMapping(endpoit.url)))
    }
    
}
let loadingPlugin = NetworkActivityPlugin {
    (type , target) in
    guard let vc = topVC else {return}
    switch type {
    case .began:
       vc.view.makeToastActivity(.center)
    case .ended:
       vc.view.hideAllToasts()
    }
}

let ApiProvider = MoyaProvider<API>(requestClosure:timeoutClourse)

let ApiLoadingProvider = MoyaProvider<API>(requestClosure: timeoutClourse,plugins: [loadingPlugin])

