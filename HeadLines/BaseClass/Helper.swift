//
//  Helper.swift
//  HeadLines
//
//  Created by Leo on 2018/11/1.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import UIKit
class Helper: NSObject {
    public static  let TOKEN = UserDefaults.standard.object(forKey: "token") as? String
    public static  let USERID = UserDefaults.standard.object(forKey: "userId") as? String
    
   
}
