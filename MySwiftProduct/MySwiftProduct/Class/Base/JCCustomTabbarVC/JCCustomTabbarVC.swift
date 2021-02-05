
//
//  JCCustomTabbarVC.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/8/14.
//  Copyright © 2019 jiachen. All rights reserved.
//

import UIKit

class JCCustomTabbarVC: UITabBarController {

    var customTabBarBgImg:UIImageView?
    var customTabBarBgImgSelected:UIImageView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpAllChildViewController()
        self.baseSetup()
        
    }
    
    

    
    
    func baseSetup() {
       

    let  tabBarAppearance = UITabBar.appearance()
    tabBarAppearance.backgroundImage = UIImage.initImageWithColor(color: .white)
      tabBarAppearance.shadowImage = UIImage.initImageWithColor(color: UIColor(r: 247, g: 247, b: 247))
    
    self.tabBar.unselectedItemTintColor = UIColor(r: 51, g: 51, b: 51)
    self.tabBar.layer.shadowColor = UIColor.black.cgColor;
    self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5);
    self.tabBar.layer.shadowOpacity = 0.05;
    self.view.backgroundColor = .white
    
    
    }
    
    
 
    func setUpAllChildViewController() {
        
        self.setUpOneChildViewController(viewController: JCHomeViewController(), image: UIImage.init(named: "tabBar_essence_icon")!, selectedImage: UIImage.init(named: "tabBar_essence_click_icon")!, title: "首页")
        
        self.setUpOneChildViewController(viewController: JCListenController(), image: UIImage.init(named: "tabBar_new_icon")!, selectedImage: UIImage.init(named: "tabBar_new_click_icon")!, title: "我听")
        
        self.setUpOneChildViewController(viewController: JCFindController(), image: UIImage.init(named: "tabBar_friendTrends_icon")!, selectedImage: UIImage.init(named: "tabBar_friendTrends_click_icon")!, title: "发现")
        
        self.setUpOneChildViewController(viewController: JCMeViewController(), image: UIImage.init(named: "tabBar_me_icon")!, selectedImage: UIImage.init(named: "tabBar_me_click_icon")!, title: "我的")
    }
    
    
    
    func setUpOneChildViewController(viewController: UIViewController, image: UIImage, selectedImage: UIImage, title: NSString) {
        
        let navVC = UINavigationController.init(rootViewController: viewController)
        // 让图片显示图片原始颜色  “UIImage” 后+ “.imageWithRenderingMode(.AlwaysOriginal)”
//        navVC.tabBarItem = UITabBarItem.init(title: title as String, image: image, selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
//
    let  barItem  = UITabBarItem.init(title: title as String, image: image, selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        

//        barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor.orange,NSAttributedString.Key.backgroundColor: UIColor.green], for: .normal)

        barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.orange], for: .selected)
//
//
//        if #available(iOS 13.0, *) {
//            let uitabApp:UITabBarAppearance = UITabBarAppearance()
//            uitabApp.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.green]
//
//            uitabApp.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
//            barItem.standardAppearance = uitabApp
//        } else {
//            // Fallback on earlier versions
//        }
//
        
        navVC.tabBarItem = barItem
            
        self.addChild(navVC)
    }

  
    
/*
     
     //
     //        if #available(iOS 13.0, *) {
     //            let itemBarAppearance = UITabBarAppearance.init()
     //
     //            itemBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green,NSAttributedString.Key.backgroundColor: UIColor.red]
     //
     //            itemBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red,NSAttributedString.Key.backgroundColor: UIColor.green]
     //
     //            barItem.standardAppearance = itemBarAppearance
     //
     //        } else { }
     
     
     
方法二：
     
     private func addChildViewControllers(){
     addChildViewController(JCFirstViewController(), title: "玩一", imageName: "tabbar_home")
     addChildViewController(JCFirstViewController(), title: "玩二", imageName: "tabbar_gift")
     addChildViewController(ClassifyViewController(), title: "玩三", imageName: "tabbar_category")
     addChildViewController(JCFirstViewController(), title: "玩四", imageName: "tabbar_me")
     }
     
     private func addChildViewController(controller: UIViewController, title:String, imageName:String){
     
     controller.tabBarItem.image = UIImage(named: imageName)
     controller.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
     controller.tabBarItem.title = title
     
     let nav = NavigationController()
     nav.addChildViewController(controller)
     addChildViewController(nav)
     }
     }

*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
