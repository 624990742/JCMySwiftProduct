//
//  JCGuidePageViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/4.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

typealias SkipClickBlock = () ->()
class JCGuidePageViewController: JCBaseController {
    var skipClickBlock: SkipClickBlock!
    override func viewDidLoad() {

        setStaticGuidePage()
        
    }
    // MARK: - 静态图片引导页
    func setStaticGuidePage() {
        let imageNameArray: [String] = ["guide00", "guide01", "guide02"]
        let guideView = JCBootPageView.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
        
        guideView.skipButtonBlock = { () -> () in
            if self.skipClickBlock != nil {
                self.skipClickBlock()
            }
        }
        self.view.addSubview(guideView)
    }
    
}
