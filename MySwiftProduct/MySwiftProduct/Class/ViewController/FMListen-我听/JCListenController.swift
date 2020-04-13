//
//  JCListenController.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/8/14.
//  Copyright © 2019 jiachen. All rights reserved.
//

import UIKit
import LTScrollView

class JCListenController: UIViewController,LTAdvancedScrollViewDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我听"
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(advanceManager)
        advancedManagerConfig()
        //导航栏按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: self.leftButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.rightButton)
        

        // Do any additional setup after loading the view.
    }
    //反初始化
    deinit {
        print("JCListenController deinit")
    }
    private lazy var viewcontrollers:[UIViewController] = {
        let onevc = JCListenChannelViewController()
        let twovc = JCListenSubscibeViewController()
        let threevc = JCRecommendViewController()
        return [onevc,twovc,threevc]
        
    }()
    private lazy var titles:[String] = {
        return ["一键听","订阅","推荐"]
    }()
    private lazy var layout:LTLayout = {
        let layout = LTLayout()
        layout.isAverage = true
        layout.sliderWidth = 80
        layout.titleViewBgColor = UIColor.white
        layout.titleSelectColor = UIColor(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor(r: 16, g: 16, b: 16)
        layout.bottomLineColor = UIColor.red
        layout.sliderHeight = 56
        return layout
    }()
    
    private lazy var advanceManager:LTAdvancedManager = {
        let statusBarH = UIApplication.shared.statusBarFrame.size.height
        let advanceManager = LTAdvancedManager(frame: CGRect(x: 0, y: JC_NavBarHeight, width: JC_SCREEN_WIDTH, height: (JC_SCREEN_HEIGHT-JC_NavBarHeight)), viewControllers: self.viewcontrollers, titles: self.titles, currentViewController: self, layout: self.layout) { [weak self] in
            guard let strongSelf = self else {
                
                return UIView()
            }
            let headerView = UIView()
            return headerView
            
        }
        advanceManager.delegate = self

        return advanceManager
    }()
    
    
    private lazy var rightButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(named: "右边"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(rightBarButtonClick), for: UIControl.Event.touchUpInside)
        return button
        
    }()
    
    private lazy var leftButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(named: "左边"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(leftBarButtonClick), for: UIControl.Event.touchUpInside)
        return button
        
    }()
    
    @objc func rightBarButtonClick()  {
        print("rightBarButtonClick")
    }

    
    @objc func leftBarButtonClick()  {
        print("leftBarButtonClick")
    }

    private func advancedManagerConfig() {
        advanceManager.advancedDidSelectIndexHandle = {
            print("选中了 -> \($0)")
        }
    }
    func glt_scrollViewOffsetY(_ offsetY:CGFloat)  {
        
    }

}
