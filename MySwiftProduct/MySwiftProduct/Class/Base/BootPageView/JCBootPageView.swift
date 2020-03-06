//
//  JCBootPageView.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/4.
//  Copyright © 2020 jiachen. All rights reserved.
// 引导页  参考 HHGuidePageHUD-master

import UIKit
let JCScreeW = UIScreen.main.bounds.size.width
let JCScreeH = UIScreen.main.bounds.size.height

typealias SkipButtonBlock = () ->()
class JCBootPageView: UIView {
    var imageArr:[String]?
    var bootPageScrollView: UIScrollView!
    var imagePageControl: UIPageControl!
    var skipButtonBlock: SkipButtonBlock!
    
    init(imageNameArray:[String], isHiddenSkipButton: Bool) {
        let frame = CGRect.init(x: 0, y: 0, width: JCScreeW, height: JCScreeH)
        super.init(frame: frame)
        if imageNameArray.isEmpty || imageNameArray.count == 0{
         return
        }
        self.imageArr = imageNameArray
        self.addScrollView(frame: frame)
        self.addSkipButton(isHiddenSkipButton: isHiddenSkipButton)
        self.addImages()
        self.addPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - 标记
extension JCBootPageView {
    //scrollview
    func addScrollView(frame: CGRect) {
        self.bootPageScrollView = UIScrollView.init(frame: frame)
        bootPageScrollView.backgroundColor = .white
        bootPageScrollView.contentSize = CGSize.init(width: JCScreeW * CGFloat(Float(self.imageArr!.count)), height: JCScreeH)
        bootPageScrollView.bounces = false
        bootPageScrollView.isPagingEnabled = true
        bootPageScrollView.showsHorizontalScrollIndicator = false
        bootPageScrollView.showsVerticalScrollIndicator = false
        bootPageScrollView.delegate = self
        if #available(iOS 11.0, *) {
            bootPageScrollView.contentInsetAdjustmentBehavior = .never
                   } else {
//            .automaticallyAdjustsScrollViewInsets = false;
            }
        self.addSubview(bootPageScrollView)
    }
    
    //跳过按钮
    func addSkipButton(isHiddenSkipButton: Bool) -> Void {
        if isHiddenSkipButton {// YES 隐藏不创建
            return
        }
        
        let skipButton = UIButton(type: UIButton.ButtonType.custom)
        skipButton.frame = CGRect.init(x: JCScreeW * 0.8, y: JCScreeH * 0.1, width: 70, height: 35)
        skipButton.setTitle("跳过", for: .normal)
        skipButton.backgroundColor = .orange
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.layer.cornerRadius = skipButton.frame.size.height * 0.5
        skipButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        self.addSubview(skipButton)
    }
    
    @objc func skipButtonClick() -> Void {
        UIView.animate(withDuration: 0.9, animations: {
            self.alpha = 0.0
        }) { (finish) in
            self.removeFromSuperview()
            if self.skipButtonBlock != nil {
                self.skipButtonBlock()
            }
        }
    }
    
  //图片
    func addImages() -> Void {
        //guard let守护一定有值
        guard let imageArray = self.imageArr  else {
            return
        }
        
        for index in 0..<imageArray.count {
            let imageView = UIImageView.init(frame: CGRect.init(x: JCScreeW * CGFloat(index), y: 0, width: JCScreeW, height: JCScreeH))
            let idString = (imageArray[index] as NSString).substring(from: imageArray[index].count - 3)
            if idString == "gif" {
                
            } else {
                  imageView.image = UIImage.init(named: imageArray[index])
                self.bootPageScrollView.addSubview(imageView)
            }
        
             //最后一张图片上体验按钮
            if index == imageArray.count - 1 {
                imageView.isUserInteractionEnabled  = true
                let startButton = UIButton.init(frame: CGRect.init(x: JCScreeW * 0.1, y: JCScreeH * 0.8, width: JCScreeW * 0.8, height: JCScreeH * 0.08))
                startButton.setTitle("开始体验", for: .normal)
                startButton.setTitleColor(.white, for: .normal)
                startButton.backgroundColor = .red
                 startButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
                  imageView.addSubview(startButton)
            }

        }
    }
    
    func addPageControl() -> Void {
        // 设置引导页上的页面控制器
        self.imagePageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: JCScreeH*0.9, width: JCScreeW, height: JCScreeH*0.1))
        self.imagePageControl?.currentPage = 0
        self.imagePageControl?.numberOfPages = self.imageArr?.count ?? 0
        self.imagePageControl?.pageIndicatorTintColor = UIColor.gray
        self.imagePageControl?.currentPageIndicatorTintColor = UIColor.white
        self.addSubview(self.imagePageControl!)
    }
}

   // MARK: - 代理方法
   extension JCBootPageView: UIScrollViewDelegate {
       
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           let page = scrollView.contentOffset.x / scrollView.frame.size.width
           self.imagePageControl?.currentPage = Int(page)
       }

}


//TODO: - 功能代码待编写


//FIXME:此处代码需要修正
