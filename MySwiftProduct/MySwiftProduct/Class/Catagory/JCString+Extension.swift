//
//  JCString+Extension.swift
//  MySwiftProduct
//
//  Created by jcmac on 2021/12/10.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation

extension String {
    ///数字转换
    ///如：“1” 转换成 “一”
   @objc func transformationNumberToChineseCapital(val : Int) -> String {
        let formatter = NumberFormatter()
            ///- 这里需要特别注意设置"zh_CN"就为中文输出内容
            ///- 不设置跟随系统的语言输入内容
            formatter.locale = Locale.init(identifier: "zh_CN")
            formatter.numberStyle = .spellOut
       let  chineseNum = formatter.string(from: NSNumber.init(value: val)) ?? ""
        return chineseNum
    }
    
}
