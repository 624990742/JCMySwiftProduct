//
//  JCListenProvider.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/21.
//  Copyright © 2020 jiachen. All rights reserved.
//  提供API

import UIKit
import Moya

let JCListenProvider = MoyaProvider<FMListenAPI>()


public enum FMListenAPI {
    case listenSubscribeList
    case listenChannelList
    case listenMoreChannelList
}

extension FMListenAPI:TargetType {
    //服务器地址
    public var baseURL: URL{
        return URL(string: "http://mobile.ximalaya.com")!
    }
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .listenSubscribeList:
            return "/subscribe/v2/subscribe/comprehensive/rank"
        case .listenChannelList:
            return "/radio-station/v1/subscribe-channel/list"
        case .listenMoreChannelList:
            return "/subscribe/v3/subscribe/recommend"
        default:
            return "/subscribe/v3/subscribe/recommend"
        }
    }
    
    public var method: Moya.Method{
        return .get
    }
    public var task: Task {
        var  parmeters = ["pageId":1] as [String:Any]
        switch self {
        case .listenSubscribeList:
            parmeters = [
                "pageSize":30,
                "pageId":1,
                "device":"iPhone",
                "sign":2,
                "size":30,
                "tsuid":124057809,
                "xt":Int32(Date().timeIntervalSince1970)
                ] as [String:Any]
        case .listenChannelList:
            break
        case .listenMoreChannelList:
            parmeters = [
                "pageSize":20,
                "pageId":1,
                "device":"iPhone"
                ] as [String:Any]
          
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
        
    }
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    public var headers: [String : String]? {
        return nil
    }
}
