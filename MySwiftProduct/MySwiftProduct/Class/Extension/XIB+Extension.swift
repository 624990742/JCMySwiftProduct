//
//  XIB+Extension.swift
//  MySwiftProduct
//
//  Created by jcmac on 2022/7/22.
//  Copyright © 2022 jiachen. All rights reserved.
//

import Foundation

//Mark -   加载自定义的xib视图的操作
/// 定义一个协议
protocol JCNibLoadable {
    /// 具体实现写到 extension 中
}
/// 加载xib
/* Xib 和 类名 同名
 * lazy var headerView = HomeHeaderView.loadFromNib()
 * Self(大写)当前类对象
 * self(小写)当前对象
 * Xib 中多个 View 视图 index 为多个视图的索引值
 * lazy var sectionView = JCHomeHeaderView.loadFromNib("JCHomeHeaderView",index: 1) */
extension JCNibLoadable where Self : UIView {
    /// 协议中不能定义class
    static func loadFromNib(_ nibname:String? = nil,index:Int = 0) -> Self {
        let loadName = nibname == nil ? "\(Self.self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)![index] as! Self
    }
}

