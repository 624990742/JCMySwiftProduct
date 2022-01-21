//
//  AppDelegate.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/4/24.
//  Copyright © 2019年 jiachen. All rights reserved.
//

import UIKit
import RealmSwift
/*
 fileprivate
 1.范围是同一源文件。
 2.修饰的类在同一源文件中可以被继承。
 3.修饰的方法在同一源文件中可以被访问，可以被子类override。
 4.修饰的变量在同一源文件中可以被访问。
 */
extension AppDelegate {
       /// 动态启动图
       fileprivate func setupLaunchImage() {
           let launchVC = UIStoryboard(name: "TestLaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "LaunchScreenID")
           let launchView = launchVC.view
           window?.addSubview(launchView!)

           // 动画效果
           UIView.animate(withDuration: 1.0, animations: {
               launchView?.alpha = 0.0
               launchView?.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0)

           }) { (success) in
               launchView?.removeFromSuperview()
             
            
            let vc = JCGuidePageViewController.init()
             vc.skipClickBlock  = { () -> () in
             print("点击了启动图")
             let tabbarVC = JCCustomTabbarVC()
             self.window?.rootViewController = tabbarVC
            }
               let nav = UINavigationController.init(rootViewController: vc)
               nav.isNavigationBarHidden = true
               self.window?.rootViewController = nav
           }
       }
    
    
    
    func darkConfiguration(_ application: UIApplication) {
        let configuration = DMEnvironmentConfiguration()
        configuration.themeChangeHandler = {
          print("theme changed")
        }
        if #available(iOS 13.0, *) {
          configuration.windowThemeChangeHandler = { window in
            print("\(window) theme changed")
          }
        }
        DarkModeManager.setup(with: configuration)
        DarkModeManager.register(with: application)
      }
    
    static func createNewWindow(with window: UIWindow) -> UIWindow {
      guard #available(iOS 13.0, *), let scene = window.windowScene else {
        return createNewWindow()
      }
      return createNewWindow(with: scene)
    }

    static func createNewWindow() -> UIWindow {
      let window = UIWindow()
      window.rootViewController = JCCustomTabbarVC()
      return window
    }

    @available(iOS 13.0, *)
    static func createNewWindow(with windowScene: UIWindowScene) -> UIWindow {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = JCCustomTabbarVC()
      return window
    }
    
    
   }

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        JCRealmTestTool.configRealm()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
//        setupLaunchImage()
//        let defalutVC = UIViewController.init()
//        self.window!.rootViewController = defalutVC
        darkConfiguration(application)
        let tabbarVC = JCCustomTabbarVC()
        self.window?.rootViewController = tabbarVC
        self.window?.makeKeyAndVisible()
    
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

