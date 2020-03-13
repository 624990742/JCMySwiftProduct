//
//  JCMeHeaderView.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/13.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

let iconHeiht = 80.0
let leftMargin = 15.0

class JCMeHeaderView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
          setupUI()
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
///MARK: 配置界面
    func setupUI() {
        self.addSubview(self.userIcon)
        self.userIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(leftMargin)
            make.top.equalToSuperview().offset(leftMargin)
            make.size.equalTo(CGSize(width: iconHeiht, height: iconHeiht))
        }
        self.userIcon.layoutIfNeeded()
        self.userIcon.layer.cornerRadius = CGFloat(iconHeiht * 0.5)
        self.userIcon.layer.masksToBounds = true
        
        
        self.addSubview(self.loginLabel)
     
        self.loginLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.userIcon.snp_right).offset(10)
            make.top.equalTo(self.userIcon.snp_top).offset(15)
            make.right.equalToSuperview().offset(-10)
            }
        
        
        
        self.addSubview(self.tipLabel)
        self.tipLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.loginLabel.snp_left)
            make.top.equalTo(self.loginLabel.snp_bottom).offset(5)
            make.right.equalToSuperview().offset(-10)
            }
               
        
        
        
        self.addSubview(self.bottomView)
       self.bottomView.snp.makeConstraints { (make) in
                 make.top.equalTo(self.userIcon.snp_bottom).offset(20)
                 make.left.equalToSuperview().offset(leftMargin)
                 make.right.equalToSuperview().offset(-leftMargin)
                 make.height.equalTo(45)
             }
        self.bottomView.layoutIfNeeded()
        self.bottomView.layer.cornerRadius = 10
        self.bottomView.layer.masksToBounds = true
        
    }
    

    
    
    ///MARK: 懒加载
       private var userIcon: UIImageView = {
          let iconImageView = UIImageView()
           iconImageView.image = UIImage(named: "userIcon")
           return iconImageView
       }()
       
       private var bottomView: UIView = {
               let bView = JCSpecialImageView()
              bView.bgImageName = UIImage(named: "pay_banner.jpg")
              bView.clipsToBounds = true
                return bView
            }()
    
    
    
       private var loginLabel : UILabel = {
           let label = UILabel()
           label.text = "立即登录"
           label.textAlignment = .left
           label.font = UIFont.boldSystemFont(ofSize: 23)
           label.textColor = UIColor.black
           return label
       }()
   
    
       private var tipLabel : UILabel = {
         let label = UILabel()
         label.text = "新用户登录即可领取大礼包"
         label.textAlignment = .left
         label.font = UIFont.systemFont(ofSize: 14)
         label.textColor = UIColor.orange
         return label
     }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension JCMeHeaderView {
    
}

