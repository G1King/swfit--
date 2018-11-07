//
//  LogFormatter.swift
//  HeadLines
//
//  Created by Leo on 2018/11/6.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import Foundation
import CocoaLumberjack
class LogFormatter: NSObject, DDLogFormatter{
    func format(message logMessage: DDLogMessage) -> String? {
        return  "\(logMessage.fileName) \(String(describing: logMessage.function)) @\(logMessage.line) \(logMessage.message)"
    }
    
}
