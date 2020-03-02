//
//  JCCustomNavgationController.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/8/14.
//  Copyright © 2019 jiachen. All rights reserved.
//

import UIKit

class JCCustomNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navBaseSetup()
    }
    
    
    func navBaseSetup() {
      self.interactivePopGestureRecognizer!.delegate = nil;
        let customApperance = UINavigationBar.appearance()
        customApperance.isTranslucent = false
        
//        appearance.setBackgroundImage(UIImage.imageWithColor(Color_NavBackground, size: CGSizeMake(1, 1)), forBarMetrics: UIBarMetrics.Default)
        customApperance.setBackgroundImage(UIImage.imageColor(color: JCNavBackgrundColor, size: CGSize.init(width: 1, height: 1)), for: UIBarMetrics.default)
        
        var textAttrs: [NSAttributedString.Key : AnyObject] = Dictionary()
        textAttrs[NSAttributedString.Key.foregroundColor] = UIColor.white
        textAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 16)
        customApperance.titleTextAttributes = textAttrs
    }
    
    lazy var backBtn: UIButton = UIButton(backTarget: self, action: #selector(JCCustomNavgationController.backBtnAction))

    
    @objc func backBtnAction() {
        self.popViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


