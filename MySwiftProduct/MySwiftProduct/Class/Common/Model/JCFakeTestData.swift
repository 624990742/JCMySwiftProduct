//
//  JCFakeTestData.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2020/3/2.
//  Copyright © 2020 jiachen. All rights reserved.
//

import Foundation
class  JCFakeTestData {
    
    private static var bannerList = [String]()
    static func createBanners() -> [String] {
    
        bannerList = ["https://img.alicdn.com/simba/img/TB1B1uBRVXXXXcCaXXXSutbFXXX.jpg",
                                  "https://img.alicdn.com/simba/img/TB19IBHQVXXXXaQXXXXSutbFXXX.jpg",
                                  "https://img.alicdn.com/tfs/TB1CyKfRVXXXXbqXXXXXXXXXXXX-520-280.jpg"]
        
        return bannerList
    }
    
}
