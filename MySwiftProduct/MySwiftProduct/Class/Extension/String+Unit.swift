//
//  String+Unit.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/14.
//  Copyright © 2020 jiachen. All rights reserved.
//

import Foundation

extension String{
    
    /// 从某个位置开始截取：
    /// - Parameter index: 起始位置
    public func subFromString(from index: Int) -> String {
        if(self.count > index){
            let startIndex = self.index(self.startIndex,offsetBy: index)
            let subString = self[startIndex..<self.endIndex];
            return String(subString);
        }else{
            return ""
        }
    }
    
    /// 从零开始截取到某个位置：
    /// - Parameter index: 达到某个位置
    public func subToString(to index: Int) -> String {
        if(self.count > index){
            let endindex = self.index(self.startIndex, offsetBy: index)
            let subString = self[self.startIndex..<endindex]
            return String(subString)
        }else{
            return self
        }
    }
    
    /// 某个范围内截取
    /// - Parameter rangs: 范围
    public func subRangeString(rang rangs:NSRange) -> String{
        var string = String()
        if(rangs.location >= 0) && (self.count > (rangs.location + rangs.length)){
            let startIndex = self.index(self.startIndex,offsetBy: rangs.location)
            let endIndex = self.index(self.startIndex,offsetBy: (rangs.location + rangs.length))
            let subString = self[startIndex..<endIndex]
            string = String(subString)
        }
        return string
    }
    
    
    func isIncludeChinese() -> Bool {
           for ch in self.unicodeScalars {
               // 中文字元範圍：0x4e00 ~ 0x9fff
               if (0x4e00 < ch.value  && ch.value < 0x9fff) {
                   return true
               }
           }
           return false
       }
    
    
    
}
