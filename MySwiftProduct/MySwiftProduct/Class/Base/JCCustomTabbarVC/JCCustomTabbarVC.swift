
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
//        self.tabBar.tintColor = UIColor.orange;
        self.setUpAllChildViewController()
        // Do any additional setup after loading the view.
    }
    
    

    
 
    func setUpAllChildViewController() {
        
        self.setUpOneChildViewController(viewController: JCHomeViewController(), image: UIImage.init(named: "tabBar_essence_icon")!, selectedImage: UIImage.init(named: "tabBar_essence_click_icon")!, title: "首页")
        
        self.setUpOneChildViewController(viewController: JCSecondViewController(), image: UIImage.init(named: "tabBar_new_icon")!, selectedImage: UIImage.init(named: "tabBar_new_click_icon")!, title: "分区一")
        
        self.setUpOneChildViewController(viewController: JCThreeViewController(), image: UIImage.init(named: "tabBar_friendTrends_icon")!, selectedImage: UIImage.init(named: "tabBar_friendTrends_click_icon")!, title: "分区二")
        
        self.setUpOneChildViewController(viewController: JCMeViewController(), image: UIImage.init(named: "tabBar_me_icon")!, selectedImage: UIImage.init(named: "tabBar_me_click_icon")!, title: "我的")
    }
    
    
    
    func setUpOneChildViewController(viewController: UIViewController, image: UIImage, selectedImage: UIImage, title: NSString) {
        
        let navVC = UINavigationController.init(rootViewController: viewController)
        // 让图片显示图片原始颜色  “UIImage” 后+ “.imageWithRenderingMode(.AlwaysOriginal)”
        navVC.tabBarItem = UITabBarItem.init(title: title as String, image: image, selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        
        self.addChild(navVC)
    }
    
    
    
/*
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
