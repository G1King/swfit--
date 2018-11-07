//
//  BaseViewController.swift
//  HeadLines
//
//  Created by Leo on 2018/11/1.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import UIKit
import CocoaLumberjack
//基类
class BaseViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.hex(hexString: "0xffffff");
  
        if #available(iOS 11.0, *){
          UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        configUI()
    }
    func configUI(){}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          DDLogInfo("进入===\(type(of: self))====控制器")
    }
    deinit {
        DDLogInfo("控制器===\(type(of: self))===得到了释放")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
