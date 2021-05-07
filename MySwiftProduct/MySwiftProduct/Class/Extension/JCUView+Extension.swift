//
//  JCUView+Extension.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/4/27.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import SnapKit
extension UIView {
    
  
    public struct SafeArea {
        let view: UIView
        
        var top: ConstraintItem {
            if #available(iOS 11, *) {
                return view.safeAreaLayoutGuide.snp.top
            } else {
                return view.viewController!.topLayoutGuide.snp.top
            }
        }
        
        var left: ConstraintItem {
            if #available(iOS 11, *) {
                return view.safeAreaLayoutGuide.snp.left
            } else {
                return view.snp.left
            }
        }
        
        var bottom: ConstraintItem {
            if #available(iOS 11, *) {
                return view.safeAreaLayoutGuide.snp.bottom
            } else {
                return view.viewController!.bottomLayoutGuide.snp.bottom
            }
        }
        
        var right: ConstraintItem {
            if #available(iOS 11, *) {
                return view.safeAreaLayoutGuide.snp.right
            } else {
                return view.snp.right
            }
        }
    }

    public var safeArea: SafeArea {
            return SafeArea(view: self)
    }
    
    var viewController :UIViewController? {
        get{
            //1.通过响应者链关系，取得此视图的下一个响应者
            var n = next
            while n != nil {
                //2.判断响应者对象是否是视图控制器类型
                if n is UIViewController {
                    //3.转换类型后  返回
                    return n as? UIViewController
                }
                n = n?.next
            }
            return nil
        }
    }
    
}
