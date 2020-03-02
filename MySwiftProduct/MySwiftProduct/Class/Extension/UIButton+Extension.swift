//
//  UIButton+Extension.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/8/14.
//  Copyright © 2019 jiachen. All rights reserved.
//

import UIKit

//导航返回按钮
extension UIButton {
    convenience init(backTarget: AnyObject?, action: Selector) {
        self.init()
        setImage(UIImage(named:"back"), for: UIControl.State.normal)
        frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        addTarget(backTarget, action: action, for: UIControl.Event.touchUpInside)
    }
    
    
    
    
}
