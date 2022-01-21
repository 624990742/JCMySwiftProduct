//
//  JCRecommendViewModel.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/4/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON


class JCRecommendViewModel: NSObject {
    var albums:[albumsModel]?
    //声明一个block类型
    typealias AddBlock = ()->Void
    
    var updateBlock : AddBlock?
    

}
extension JCRecommendViewModel {
    func refreshDataSource()  {
        //1.获取json文件路径
        let path = Bundle.main.path(forResource: "listenRecommend", ofType: "json")
        //2.将json文件转化为NSData 格式
        let jsonData = NSData(contentsOfFile: path!)
        //3.解析NSData数据
        let json = JSON(jsonData!)
        if let mappedObject = JSONDeserializer<albumsModel>.deserializeModelArrayFrom(json: json["data"]["albums"].description) {
            //获取数据之后进行刷新
            self.albums = mappedObject as?  [albumsModel]
            self.updateBlock?()
        }
        
    }
    
}
extension JCRecommendViewModel {
    func numOfSection(section:NSInteger) -> NSInteger {
        return self.albums?.count ?? 0
    }
}
