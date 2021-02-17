//
//  JCTestFileViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/2/13.
//  Copyright © 2021 jiachen. All rights reserved.
//

import UIKit
import HandyJSON
//class JCManoModel: HandyJSON {
//    var current_page: NSInteger?
//    var  total_pages: NSInteger?
//    var  total_items: NSInteger?
//    var      feature: String?
//    var      photos: [PhotosModel]?
//
//
//    required init() {}
//}
//
//
//class PhotosModel: HandyJSON {
//    var created_at: String?
//    var url: String?
//    required init() {}
//}




//
//class BasicTypes: HandyJSON {
//    var bool: Bool = true
//    var intOptional: Int?
//    var doubleImplicitlyUnwrapped: Double!
//    var anyObjectOptional: Any?
//
//    var arrayInt: Array<Int> = []
//    var arrayStringOptional: Array<String>?
//    var setInt: Set<Int>?
//    var dictAnyObject: Dictionary<String, Any> = [:]
//
//    var nsNumber = 2
//    var nsString: NSString?
//
//    required init() {}
//}
//


// MARK: - test1
//class BasicTypes: HandyJSON {
//    var int: Int = 2
//    var doubleOptional: Double?
//    var stringImplicitlyUnwrapped: String!
//
//    required init() {}
//}

//class Cat: HandyJSON {
//    var name: String?
//    var id: String?
//
//    required init() {}
//}


class Cat: HandyJSON {
    var id: Int64!
    var name: String!
    var parent: (String, String)?

    required init() {}

    func mapping(mapper: HelpingMapper) {
        // 指定 id 字段用 "cat_id" 去解析
        mapper.specify(property: &id, name: "cat_id")
        // 指定 parent 字段用下边这个方法去解析
        
        //方法一：
        mapper.specify(property: &parent) { (rawString) -> (String, String) in
            let parentNames = rawString.split{$0 == "/"}.map(String.init)
        return (parentNames[0], parentNames[1])

         
        /*方法二：
       let transformOf  = TransformOf<(String, String), String>(fromJSON: { (rawString) -> (String, String)? in
           if let parentNames = rawString?.split(separator: "/").map(String.init) {
               return (parentNames[0], parentNames[1])
           }
           return nil
       }, toJSON: { (tuple) -> String? in
           if let _tuple = tuple {
               return "\(_tuple.0)/\(_tuple.1)"
           }
           return nil
       })
        
        mapper.specify(property: &parent) { (tt) -> (String,String) in
            transformOf.transformFromJSON(tt)!
        }*/
      }
    }
}


class JCTestFileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let jsonString = "{\"cat_id\":12345,\"name\":\"Kitty\",\"parent\":\"Tom/Lily\",\"friend\":{\"id\":54321,\"name\":\"Lily\"}}"

        if let cat = Cat.deserialize(from: jsonString) {
            print(cat.id ?? "")
            print(cat.parent ?? "")
        }
        
        
        
//        let jsonFile = Bundle.main.url(forResource: "TestJosnFile", withExtension: "txt")
//        let data = try! Data(contentsOf: jsonFile!)
//        let jsonString = String(data: data, encoding: .utf8)
//
//        self.test3()
      
        
        
        
        
    }
    
    

    
    
    
//    func test3() {
//
//
//        let jsonArrayString: String? = "[{\"name\":\"Bob\",\"id\":\"1\"}, {\"name\":\"Lily\",\"id\":\"2\"}, {\"name\":\"Lucy\",\"id\":\"3\"}]"
//        if let cats = [Cat].deserialize(from: jsonArrayString) {
//            cats.forEach({ (cat) in
//                print(cat?.name! ?? "nil")
//            })
//        }
//    }
    
    
//
//    func test2()  {
//
//
//        let object = BasicTypes()
//        object.intOptional = 1
//        object.doubleImplicitlyUnwrapped = 1.1
//        object.anyObjectOptional = "StringValue"
//        object.arrayInt = [1, 2]
//        object.arrayStringOptional = ["a", "b"]
//        object.setInt = [1, 2]
//        object.dictAnyObject = ["key1": 1, "key2": "stringValue"]
//        object.nsNumber = 2
//        object.nsString = "nsStringValue"
//
//        let jsonString = object.toJSONString()!
//
//        if let tempObject = BasicTypes.deserialize(from: jsonString) {
//
//            print("arrayStringOptional==>\(tempObject.arrayStringOptional!)");
//        }
//
//
//    }
//
    
    
//    // MARK: - 普通字典转model，model转字典
//    func test1() {
//
//    //反序列化
//      let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
//      if let object = BasicTypes.deserialize(from: jsonString) {
//          print(object.int)
//          print(object.doubleOptional!)
//          print(object.stringImplicitlyUnwrapped!)
//      }
//
//     print("===============")
//
//      //序列化
//      let object = BasicTypes()
//      object.int = 1
//      object.doubleOptional = 1.1
//      object.stringImplicitlyUnwrapped = "hello"
//
//      print(object.toJSON()!) // 序列化为字典
//      print(object.toJSONString()!) // 序列化为json字符串
//      print(object.toJSONString(prettyPrint: true)!)//序列化为json格式的字符串
//
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
