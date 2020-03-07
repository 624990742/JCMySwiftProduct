//
//  JCHomeViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/6.
//  Copyright © 2020 jiachen. All rights reserved.
//
private let glt_iphoneX = (UIScreen.main.bounds.height >= 812.0)

import UIKit
import MJRefresh

let JCScreenWidth = UIScreen.main.bounds.size.width
let JCScreenHeight = UIScreen.main.bounds.size.height

class JCHomeViewController: UIViewController {
    
    private lazy var titles: [String] = {
        return  ["魅力中国", "中国梦", "我爱中国", "吊事专栏"]
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        var vcs = [UIViewController]()
        for _ in titles {
            vcs.append(JCHomeContentViewController())
        }
        return vcs
    }()
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.bottomLineHeight = 4.0
        layout.bottomLineCornerRadius = 2.0
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 */
        return layout
    }()
    
    private func managerReact() -> CGRect {
        let statusBarH = UIApplication.shared.statusBarFrame.size.height
        let Y: CGFloat = statusBarH + 44
        let H: CGFloat = glt_iphoneX ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        return CGRect(x: 0, y: Y, width: view.bounds.width, height: H)
    }
    
    /*
    // 取消注释此处为自定义titleView
     private lazy var simpleManager: LTSimpleManager = {
     let customTitleView = LTCustomTitleView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44), titles: titles, layout: layout)
     customTitleView.isCustomTitleView = true
     let simpleManager = LTSimpleManager(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout, titleView: customTitleView)
     /* 设置代理 监听滚动 */
     simpleManager.delegate = self
     return simpleManager
     }()
    */
 
    

    private lazy var simpleManager: LTSimpleManager = {
        let simpleManager = LTSimpleManager(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout)
        /* 设置代理 监听滚动 */
        simpleManager.delegate = self
        return simpleManager
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(simpleManager)
        simpleManagerConfig()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("LTSimpleManagerDemo < --> deinit")
    }
}


extension JCHomeViewController {
    
    //MARK: 具体使用请参考以下
    private func simpleManagerConfig() {
        
        //MARK: headerView设置
        simpleManager.configHeaderView {[weak self] in
            guard let strongSelf = self else { return nil }
            let headerView = strongSelf.loopView()
            return headerView
        }
        
        //MARK: pageView点击事件
        simpleManager.didSelectIndexHandle { (index) in
            print("点击了 \(index) 😆")
        }
        
    }
    
    @objc private func tapLabel(_ gesture: UITapGestureRecognizer)  {
        print("tapLabel☄")
    }
}

extension JCHomeViewController: LTSimpleScrollViewDelegate {
    
    //MARK: 滚动代理方法
    func glt_scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print("offset -> ", scrollView.contentOffset.y)
    }
    
    //MARK: 控制器刷新事件代理方法
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int) {
        //注意这里循环引用问题。
        scrollView.mj_header = MJRefreshNormalHeader {[weak scrollView] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                print("对应控制器的刷新自己玩吧，这里就不做处理了🙂-----\(index)")
                scrollView?.mj_header.endRefreshing()
            })
        }
    }
}





extension JCHomeViewController {
    
    private func loopView() -> ZCycleView {
        let headerView  = ZCycleView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
                  
        let titles = ["正在直播·2017维密直播大秀\n天使惊艳合体性感开撩",
                                 "猎场-会员抢先看\n胡歌陈龙联手戳穿袁总阴谋",
                                 "我的！体育老师\n好样的！前妻献媚讨好 张嘉译一口回绝",
                                 "小宝带你模拟断案！\n开局平民，晋升全靠运筹帷幄"]
        headerView.delegate = self
            as ZCycleViewProtocol
        headerView.isInfinite = true
        headerView.isAutomatic = true
        headerView.timeInterval = 3
        headerView.setImagesGroup([#imageLiteral(resourceName: "p700-300-1"),
                                              #imageLiteral(resourceName: "p700-300-2"),
                                              #imageLiteral(resourceName: "p700-300-3"),
                                              #imageLiteral(resourceName: "p700-300-4"),
                                              #imageLiteral(resourceName: "p700-300-5")],titlesGroup: titles)
        headerView.itemSize = CGSize(width: JCScreenWidth - CGFloat(40), height: (JCScreenWidth - CGFloat(40)) * 30/70)
        headerView.itemSpacing = 5
        return headerView
    }
}

//MARK:

extension JCHomeViewController: ZCycleViewProtocol {
    func cycleViewConfigureDefaultCellImage(_ cycleView: ZCycleView, imageView: UIImageView, image: UIImage?, index: Int) {

        if cycleView == cycleView {
            imageView.image = image
        }
    }
  
    
    func cycleViewConfigureDefaultCellText(_ cycleView: ZCycleView, titleLabel: UILabel, index: Int) {

        if cycleView == cycleView {
            let title = titleLabel.text ?? ""
            let arr = title.components(separatedBy: "\n")
            let attriStr = NSMutableAttributedString(string: title)
            attriStr.addAttributes([.foregroundColor: UIColor.green, .font: UIFont.systemFont(ofSize: 13)], range: NSMakeRange(0, arr[0].count))
            if arr.count > 1 {
                attriStr.addAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 11)], range: NSMakeRange(arr[0].count+1, arr[1].count))
            }
            titleLabel.attributedText = attriStr
            
            titleLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            titleLabel.numberOfLines = 0
            var frame = titleLabel.frame
            frame.origin.y = frame.size.height+frame.origin.y-40
            frame.size.height = 40
            titleLabel.frame = frame
        }
    }
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {

        if cycleView == cycleView {
            pageControl.alignment = .right
            pageControl.spacing = 10
            pageControl.dotSize = CGSize(width: 20, height: 10)
        }
    }
}



//extension JCHomeViewController {
//    private func testLabel() -> UILabel {
//        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
//        headerView.backgroundColor = UIColor.red
//        headerView.text = "点击响应事件"
//        headerView.textColor = UIColor.white
//        headerView.textAlignment = .center
//        headerView.isUserInteractionEnabled = true
//        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:))))
//        return headerView
//    }
//}


