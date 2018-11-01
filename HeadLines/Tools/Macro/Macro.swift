//
//  Macro.swift
//  HeadLines
//
//  Created by Leo on 2018/11/1.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import UIKit
// v测试 地址
#if DEBUG
let BASE_URL = "http://120.52.98.247/"
let VERSION = "test/"
#else
let BASE_URL  = "http://lingdao.spicu.com.cn/"; // 线上环境
let VERSION = "156/"
#endif
//=========================================================
//api
let BASE_API = BASE_URL + "leaderAppApi/" + VERSION
// down upload api
let BASE_UD_API = BASE_URL + "leaderUDApi/" + VERSION
// htmlUrl
let BASE_HTML_API = BASE_URL + "leaderHTML/" + VERSION
//=========================================================
//屏幕 宽高
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
//app -version
let APPVERSION: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String;


