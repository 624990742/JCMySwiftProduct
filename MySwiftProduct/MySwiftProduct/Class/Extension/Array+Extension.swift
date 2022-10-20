//
//  Array+Extension.swift
//  MySwiftProduct
//
//  Created by jcmac on 2022/10/20.
//  Copyright © 2022 jiachen. All rights reserved.
//

extension Array {
    
    ///去除数组中的重复元素
    func filterDuplicatesElement<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
}
