//
//  JCRealmSwiftTestTool.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/5/31.
//  Copyright © 2021 jiachen. All rights reserved.
///   自己研究 官方文档 https://docs.mongodb.com/realm/sdk/ios/quick-start/

import Foundation
import RealmSwift
import HandyJSON
class JCRealmSwiftTestTool {
    
    
    private class func getRealmSwiftDB() -> Realm {
        
        /// 传入路径会自动创建数据库
        let dbPath = self.realmSwiftDBPath()
        let defaultRealm = try! Realm(fileURL: URL.init(string: dbPath)!)
        return defaultRealm
    }
    
   
    ///沙盒的路径
    private  class func realmSwiftDBPath() -> String {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        let dbPath = docPath.appending("/JCRealmSwiftTest.realm")
        return dbPath
    }
    
    /// 获取本地的json数据
    class func getTxtData() {
        
        guard let jsonPath = Bundle.main.path(forResource: "ReamlSwiftTestJsonData", ofType: "json") else {
            return
            
        }
        
        let url = URL(fileURLWithPath: jsonPath)
        let data = try! Data(contentsOf: url)
        let realm = try! Realm()

        
        // Insert from Data containing JSON
        try! realm.write {
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            realm.create(JCRealmTest.self, value: json, update: .error)
        }
        
    }
    
    
    
    
    ///创建一条json数据
    class func createJosnData() {
  
    var testArr = [Any]()
        
    let test = JCRealmJson()
    test.id = "1987"
    test.name = "码农晨仔"
    test.answer = "what  are you doing  "
    test.age = 21
  
    let tt1 = test.toJSON()
    var dict = [String: Any]()
        dict["Jack"] = tt1
    testArr.append(dict)
        
        test.id = "8796"
       let tt2 = test.toJSON()
        testArr.append(tt2 ?? "")
        
      let data = try! JSONSerialization.data(withJSONObject: testArr,
                                             options: JSONSerialization.WritingOptions.prettyPrinted)
        
      let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        let dbPath = docPath.appending("/ReamlSwiftTestJsonData.json")
        
      let url = URL(fileURLWithPath: dbPath)
       try! data.write(to: url, options: .atomic)
        
        
    }
    
}





//    let array = [
//            ["clsName": "WBHomeViewController",
//             "title": "首页",
//             "imageName": "home",
//             "visitorInfo": ["imageName": "",
//                             "message": "关注一些人，回这里看看有什么惊喜"]],
//
//            ["clsName": "WBMessageViewController",
//             "title": "消息",
//             "imageName": "message_center",
//             "visitorInfo": ["imageName": "visitordiscover_image_message",
//                             "message": "登录后，别人评论你的微博，给你发消息，都会在这里收到通知"]],
//
//            ["clsName": "UIViewController"],
//
//            ["clsName": "WBDiscoverViewController",
//             "title": "发现",
//             "imageName": "discover",
//             "visitorInfo": ["imageName": "visitordiscover_image_message",
//                             "message": "登录后，最新、最热微博尽在掌握，不再与实事潮流擦肩而过"]],
//
//            ["clsName": "WBProfileViewController",
//             "title": "我",
//             "imageName": "profile",
//             "visitorInfo": ["imageName": "visitordiscover_image_profile",
//                             "message": "登录后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
//        ]



///转成json
class JCRealmJson: HandyJSON {
     var id: String = ""
     var name: String = ""
     var answer: String = ""
     var age: Int = 10
    required init() {}
}



class JCRealmTest: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var answer = ""
    @objc dynamic var age = 0
    
    override class func primaryKey() -> String? {
        
        return "id"
    }
 
}
