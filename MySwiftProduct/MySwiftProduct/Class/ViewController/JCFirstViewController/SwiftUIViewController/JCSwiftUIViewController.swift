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
   
   
    override func viewDidLoad() {
         super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let bannerView = JCBannerView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
        bannerView.autoScrollInterval = 2
        bannerView.isInfinite = false
        bannerView.dataSource = self
        view.addSubview(bannerView)
    
        
     }
    
    
    
    func numberOfBanners(_ bannerView: JCBannerView) -> Int {
        
        return JCFakeTestData.createBanners().count
       }
       
       func viewForBanner(_ bannerView: JCBannerView, index: Int, convertView: UIView?) -> UIView {
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
