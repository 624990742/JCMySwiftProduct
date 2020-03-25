import Foundation

////单例
//class MyManager {
//    class var share: MyManager {
//        struct Static {
//            static let shareInstance: MyManager = MyManager()
//        }
//        return Static.shareInstance
//    }
//}
//
//
////单例 1.2 版本i以后的写法
//class MyStaticManager {
//    static let shared = MyStaticManager()
//    private init(){}
//}


/*
 解决闭包中的循环引用

   class Person {
    let name: String

     lazy var printName: ()->() = {
     [weak self] in //解决循环引用
     if let stongSelf = self {
      print("The name is \(stongSelf.name)") }
     }
      
      init(personName: String) { name = personName
   }
     deinit {
     print("Person deinit \(self.name)")
   }
     
 }

 var xiaoMing: Person? = Person(personName: "XiaoMing")
 xiaoMing!.printName()
 xiaoMing = nil
 // 输出:
 */

/*
 替换字符串的方法：
 方法一：
 let levels = "ABCDE"
 let startIndex = levels.startIndex
 let endIndex = levels.endIndex
 let indexPositionOne = String.Index.init(encodedOffset: 1)
 let inddexPositionTwo = String.Index.init(encodedOffset: 4)
 let swiftRange = indexPositionOne ..< inddexPositionTwo
 let tempLe = levels.replacingCharacters(in: swiftRange, with: "AAAA")
 print("tempLe===>\(tempLe)")
 
  方法二：

  let levels = "ABCDE"
  let nsRange = NSMakeRange(1, 4)
  let indexPositionOne = levels.index(levels.startIndex, offsetBy: 1)
  let swiftRange = indexPositionOne ..< levels.index(levels.startIndex, offsetBy: 5)
  let tepLevel = levels.replacingCharacters(in: swiftRange, with: "AAAA")
  print("tepLevel:\(tepLevel)")
  
 
 
  方法三：
 
 let levels = "ABCDE"
 let nsRange = NSMakeRange(1, 4)
 let tepLevel = (levels as NSString).replacingCharacters(in: nsRange, with: "AAAA")
 print("tepLevel:\(tepLevel)")
 
 */
/*
 获取对象本身
 
 swift 中使用oc的方式获取
 let date = NSDate()
 let name: AnyClass! = object_getClass(date)
 print(name ?? 0)
 
 swift的方式u获取
 let nameq = type(of: date)
 print(nameq)


  let testString = "Hello"
  let testName = type(of: testString)
  print(testName)

 */

/*
  swift 中的 is 在功能上相当于原来的 isKindOfClass
 */

class testClassA {}
class testClassB: testClassA {}
let obj: AnyObject = testClassB()
if (obj is testClassA){
    print("属于 testClassA")
}

if (obj is testClassB){
    print("属于 testClassB")
}



 let string = "String"
 if string is String {
    // Do something
}
