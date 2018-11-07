//
//  BaseModel.swift
//  HeadLines
//
//  Created by Leo on 2018/11/6.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import HandyJSON





struct ReturnData<T: HandyJSON>: HandyJSON {
    var message: String?
    var status: String?
    var data: T?
}
struct ResponseData<T: HandyJSON>: HandyJSON{
    var code: Int = 0
    var data: ReturnData<T>?
}
