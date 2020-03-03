//
//  JCSwiftUIViewController.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2020/2/26.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
import Kingfisher

class JCSwiftUIViewController: JCSwiftBaseGrammarVC , JCBannerViewDataSource {
   
    
    override func viewWillAppear(_ animated: Bool) {
        hidesBottomBarWhenPushed = false

    }
   
    override func viewDidLoad() {
         super.viewDidLoad()
        self.title = "轮播图"
//        let bannerView = JCBannerView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
        
        let bannerView = JCBannerView.init()
        bannerView.autoScrollInterval = 2
        bannerView.isInfinite = false
//        weak var weakSelf = self
//        bannerView.dataSource = weakSelf!
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
        bannerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
     }
    

    func numberOfBanners(_ bannerView: JCBannerView?) -> Int {
       return JCFakeTestData.createBanners().count
    }
       
       func viewForBanner(_ bannerView: JCBannerView?, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: JCFakeTestData.createBanners()[index]))
            return view
        } else {
         let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill //scaleAspectFit
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: JCFakeTestData.createBanners()[index]))
          return imageView
         }
       }
   

    

}

