//
//  JCListenModel.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/19.
//  Copyright © 2020 jiachen. All rights reserved.
//  我听页签所有的model

import UIKit
import HandyJSON
//----一键听Modle
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

//----订阅Model
struct AlbumResultsModel:HandyJSON {
    var albumCover : String?
    var albumId :Int = 0
    var albumTitle : String?
    var avatar : String?
    var dynamicType : Int = 0
    var isAuthorized : Bool = false
    var isDraft :  Bool = false
    var isPaid :  Bool = false
    var isTop : Bool = false
    var lastUpdateAt : NSInteger = 0
    var nickName : String?
    var serialState : Int = 0
    var status: Int = 0
    var timeline: NSInteger = 0
    var trackId: NSInteger = 0
    var trackTitle: String?
    var trackType: Int = 0
    var uid: NSInteger = 0
    var unreadNum: Int = 0
    

    
}

//-----推荐Model
struct albumsModel:HandyJSON {
    var albumId: NSInteger = 0
    var coverMiddle: String?
    var coverSmall: String?
    var isDraft: Bool = false
    var isFinished: Int = 0
    var isPaid: Bool = false
    var lastUpdateAt: NSInteger = 0
    var playsCounts: NSInteger = 0
    var recReason: String?
    var recSrc: String?
    var recTrack: String?
    var refundSupportType: Int = 0
    var title: String?
    var tracks: Int = 0
}
