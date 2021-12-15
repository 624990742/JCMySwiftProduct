//
//  JCListenChannelViewModel.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/20.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class JCListenChannelViewModel: NSObject {
    var channelResults:[ChannelResultsModel]?
    //定义类型 定一个Block
    typealias AddDataBlock = () -> Void
    var updateBlock : AddDataBlock?
    

}
//扩展
extension JCListenChannelViewModel {
    func refreshDataSource() {
        //一键听接口请求数据
        JCListenProvider.request(.listenChannelList) { (result) in
            //可选绑定
            if case let .success(response) = result {
                //解析数据
                let data = try?response.mapJSON()//可选链
                if data == nil{
                    JCDebugLog(message: "data为空")
                    return
                }
                let json = JSON(data!)
                if let mappedObject = JSONDeserializer<ChannelResultsModel>.deserializeModelArrayFrom(json: json["data"]["channelResults"].description) {//从字符串转化为对象实例
                    self.channelResults = mappedObject as? [ChannelResultsModel]
                    self.updateBlock?()
                }
                
                
            }
        }
    }
}
extension JCListenChannelViewModel {
    //每个分区显示item的数量
    func numberOfRowInSection(section:NSInteger) -> NSInteger {
        return self.channelResults?.count ?? 0
    }
}
