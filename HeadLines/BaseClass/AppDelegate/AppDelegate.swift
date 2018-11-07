//
//  AppDelegate.swift
//  HeadLines
//
//  Created by Leo on 2018/10/31.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import UIKit
import Moya
import CYLTabBarController
import CocoaLumberjack
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaults.standard.set("46db28cef871485f88fc1e1b3ba77521", forKey: "userId")
        UserDefaults.standard.set("46db28cef871485f88fc1e1b3ba77521DA3F9278E2C01FBE1E0F0B56D64EB62B", forKey: "token")
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = self.createTabBarController()
        self.window?.makeKeyAndVisible()
        DDTTYLogger.sharedInstance.logFormatter = LogFormatter()
        DDLog.add(DDTTYLogger.sharedInstance, with: .debug);
//        ApiProvider.request(API.getHomeCarousels(status: "1", tag: "1"), model: <#T##HandyJSON.Protocol#>, completion: <#T##((HandyJSON?) -> Void)?##((HandyJSON?) -> Void)?##(HandyJSON?) -> Void#>)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: UITabBarControllerDelegate {
    func createTabBarController() -> BaseTabBarController{
        let mainTabbar = BaseTabBarController.init(viewControllers: self.viewControlles(), tabBarItemsAttributes: self.tabBarItemsAttributesForController())
        return mainTabbar!
    }
    func viewControlles() -> [BaseNavigationController] {
        let conversation = BaseNavigationController.init(rootViewController: ConversationListController())
        let addressBook = BaseNavigationController.init(rootViewController: AddressBookViewController())
        let look = BaseNavigationController.init(rootViewController: LookViewController())
        let mine = BaseNavigationController.init(rootViewController: MyViewController())
        let viewcontrolles : [BaseNavigationController] = [conversation,addressBook,look,mine]
        return viewcontrolles
        
    }
    func tabBarItemsAttributesForController() ->  [[String : String]]{
        let tabBarItemOne = [CYLTabBarItemTitle:"说说",
                             CYLTabBarItemImage : "talk_unselect",
                             CYLTabBarItemSelectedImage: "talk_select"
                             ]
        
        let tabBarItemTwo = [ CYLTabBarItemTitle : "通讯录",
                              CYLTabBarItemImage : "relationship_unselect",
                              CYLTabBarItemSelectedImage : "relationship_select",
        ]
        let tabBarItemThree = [   CYLTabBarItemTitle : "看看",
                                CYLTabBarItemImage : "see_unselected",
                                CYLTabBarItemSelectedImage : "see_selected",
        ]
        let tabBarItemFour = [ CYLTabBarItemTitle : "我的",
                               CYLTabBarItemImage : "my_unselect",
                               CYLTabBarItemSelectedImage : "my_select"
        ]
        
        let items = [tabBarItemOne,tabBarItemTwo,tabBarItemThree,tabBarItemFour]
        return items;
    }
}
