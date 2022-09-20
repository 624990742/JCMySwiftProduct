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
    func transformationNumberToChineseCapital(val : Int) -> String {
        let formatter = NumberFormatter()
            ///- 这里需要特别注意设置"zh_CN"就为中文输出内容
            ///- 不设置跟随系统的语言输入内容
            formatter.locale = Locale.init(identifier: "zh_CN")
            formatter.numberStyle = .spellOut
       let  chineseNum = formatter.string(from: NSNumber.init(value: val)) ?? ""
        return chineseNum
    }
    
}

///MARK - 指定位置字符插入“特定的字符”
extension Collection {
    ///指定位置插入特定的字符
    ///例如： "1234455wewq".unfoldSubSequences(limitedTo: 2).joined(separator:" ")
    func unfoldSubSequences(limitedTo maxLength: Int) -> UnfoldSequence<SubSequence,Index> {
        sequence(state: startIndex) { start in
            guard start < self.endIndex else { return nil }
            let end = self.index(start, offsetBy: maxLength, limitedBy: self.endIndex) ?? self.endIndex
            defer { start = end }
            return self[start..<end]
        }
    }
    ///指定位置插入特定的字符
    ///例如："12345667".insert(separator:":", every: 3)
    func every(n: Int) -> UnfoldSequence<Element,Index> {
        sequence(state: startIndex) { index in
            guard index < endIndex else { return nil }
            defer { index = self.index(index, offsetBy: n, limitedBy: endIndex) ?? endIndex }
            return self[index]
        }
    }

}

extension StringProtocol where Self: RangeReplaceableCollection {
    ///指定位置插入特定的字符
    ///例如："123456677".insert(separator:":", every: 3)
    mutating func insert<S: StringProtocol>(separator: S, every n: Int) {
        for index in indices.every(n: n).dropFirst().reversed() {
            insert(contentsOf: separator, at: index)
        }
    }
    ///指定位置插入特定的字符
    ///例如："1880703".inserting(separator:" ", every: 4)
    func inserting<S: StringProtocol>(separator: S, every n: Int) -> Self {
        .init(unfoldSubSequences(limitedTo: n).joined(separator: separator))
    }
}
