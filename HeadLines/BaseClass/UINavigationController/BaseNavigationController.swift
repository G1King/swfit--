//
//  BaseNavigationController.swift
//  HeadLines
//
//  Created by Leo on 2018/11/1.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
          viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "returnBt"), selectImage: nil, imageEdgeInsets: .zero, target: self, action: #selector(clickBack))
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    @objc func clickBack(){
        self.popViewController(animated: true)
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
