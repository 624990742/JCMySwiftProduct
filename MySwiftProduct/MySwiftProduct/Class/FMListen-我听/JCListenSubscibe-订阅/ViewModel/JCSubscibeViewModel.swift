//
//  JCSubscibeViewModel.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/30.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class JCSubscibeViewModel: NSObject {
    //声明数组
    var resultArr:[AlbumResultsModel]?
    //定义类型: 一般是定义函数类型
    typealias AddBlock = () -> Void
    var updateBlock : AddBlock?
    
    
    
}
//请求数据
extension JCSubscibeViewModel {
    func refreshDataSource()  {
        //1.获取项目文件路径
        let path : String? = Bundle.main.path(forResource: "listenSubscibe", ofType: "json")
        //2.获取文件内容
        let jsonData = NSData(contentsOfFile: path!)
        //3.解析json内容
        let json = JSON(jsonData)
        //4. A as? B： A 强制转化为B的可选类型
        if let mappedObject = JSONDeserializer<AlbumResultsModel>.deserializeModelArrayFrom(json: json["data"]["albumResults"].description) {
            self.resultArr = mappedObject as? [AlbumResultsModel]
            updateBlock?()
        }
        

    }
}

//展示数据接口
extension JCSubscibeViewModel {
    func numberOfRowsInSection(section:NSInteger) -> NSInteger {
        return self.resultArr?.count ?? 0
    }
}
