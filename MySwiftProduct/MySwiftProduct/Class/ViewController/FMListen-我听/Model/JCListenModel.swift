//
//  JCListenModel.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/19.
//  Copyright © 2020 jiachen. All rights reserved.
//  我听页签所有的model

import UIKit
import HandyJSON
//----一键听
struct ChannelResultsModel:HandyJSON {
    var bigCover:String?
    var channelId:String?
    var channelName:String?
    var channelProperty:String?
    var cover:String?
    var createdAt:Int = 0
    var isRec:Bool = false
    var jumpUrl:String?
    var playerParam: PlayParamModel?
    var playUrl:String?
    var slogan:String?

    
}
struct PlayParamModel:HandyJSON {
    var tabid:String?
    var pageSize:String?
    var albumId:String?
    var pageId:String?
    var isWrap:String?

}

