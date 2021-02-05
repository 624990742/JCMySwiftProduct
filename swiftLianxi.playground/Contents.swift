import UIKit
/*
 数组变形->Map
 1.自己写一个数组交换的方法
 var fibs = [1,2,3,4,5,6]
 var squared:[Int] = []
 for fib in fibs {
     squared.append(fib * fib)
 }
 print("squared:\(squared)")
 
  2.swift 提供的map 方法
  var fibs = [1,2,3,4,5,6]
 let squares = fibs.map { fib in
     fib * fib
 }
 print("squares:\(squares)")
 
 3. 与上边的写法相同
 var fibs = [1,2,3,4,5,6]
 let squares = fibs.map { (fib) -> Int in
     fib * fib
 }
  print("squares:\(squares)")

 
 */

/*
 Element  数组包含的元素类型的占位符
  T   元素转换之后类型的占位符
 以上两者可以是任意类型。
 T的具体类型将由调用者传入给 map 的 transform方法的返回值类型决定
 
 extension Array {
     func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
         var result:[T] = []
         result.reserveCapacity(count)
         for x in self {
             result.append(try transform(x))
         }
         return result
     }
     
 }

 */

/*
 //基础版本
let names = ["Paula","Elena","Zoe"]
var lastNameEndingInA:String?
for name in names.reversed() where name.hasSuffix("a") {
    lastNameEndingInA = name
    break
}

print("lastNameEndingInA:\(String(describing: lastNameEndingInA))")

//进化版本
 let names = ["Paula","Elena","Zoe"]
 extension Sequence {
   func last(where predicate: (Element) -> Bool) -> Element? {
    for element in reversed() where predicate(element) { return element
 }
   return nil
   }
 }

 let match = names.last {$0.hasSuffix("a")}
 print("match:\(String(describing: match))")

 */



//extension Array {
//func accumulate<Result>(_ initialResult: Result,
//_ nextPartialResult: (Result, Element) -> Result) -> [Result] {
//    var running = initialResult
//     return map { next in
//     running = nextPartialResult(running, next)
//    return running
//    }
//  }
//}
//
//print([1,2,3,4].accumulate(0, +))// [1, 3, 6, 10]

//let nums = [1,2,3,4,5,6,7,8,9,10]
//print(nums.filter{ num in num % 2 == 0})
//nums.filter{$0 % 2 == 0}
//let fibs = [0, 1, 1, 2, 3, 5]
//var total = 0
//for num in fibs {
//    total = total + num
//}
//print("total:\(total)",total)

//let suits = ["♠", "♥", "♣", "♦"]
//let ranks = ["J","Q","K","A"]
//let result = suits.flatMap { suit in
//ranks.map { rank in (suit, rank)
//} }

//let slice = fibs[1...]
//slice // [1, 1, 2, 3, 5]
//type(of: slice) // ArraySlice<Int>

//enum Setting {
//    case text(String)
//    case int(Int)
//    case bool(Bool)
//}
//
//let defaultSettings:[String:Setting] = [
//    "Airplane Model":.bool(false),
//    "Name":.text("My iPhone"),
//]
//print(defaultSettings["Name"]!)



//func swapTwoValues<T>(_ a: inout T,_ b: inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someInt = 3
//var anotherInt = 107
//swapTwoValues(&someInt, &anotherInt)


// swift  数组的使用

/*
 1、迭代数组
 
 let  testArr = [3,4,5,6]
 for ob in testArr {
     print(ob)
 }
 */

//print("===1===")
/*
 2.迭代数组中除了第一个元素以外的数组其余部分
 for ob1 in testArr.dropFirst() {
     print(ob1)
 }
 print("===2===")
 */

/*
 3.想要迭代除了个2元素以外的元素，就是从下标为1之后的元素开始。
 for ob2 in testArr.dropLast(2) {
     print(ob2)
 }
 print("===3===")
 */


/*
 4.列举数组中的元素和对应的下标
 
 for (num,element) in testArr.enumerated() {
     print("num==>\(num),element==>\(element)")
 }
 print("========")
 */


/*
 5.寻找一个指定元素的位置
 if let idx = testArr.firstIndex(where:{ (obj)-> Bool in
     if obj == 4 {
     
         return true
     }
     return false
 }) {
     print("\(idx)")
 }

 */

/*
 6.对数组中的所有元素进行变形
 let  resultArr = testArr.map{$0 + 2}
 print("resultArr==>\(resultArr)")
 */


//var testArr = [1,2,3,4]
////在array中过滤出偶数
//let endResult = testArr.filter{
//  $0 % 2 == 0
//}
//print(endResult)
//


/*
 7.数组操作
 var squared:[Int] = []
 var fibs = [1,2,3,4]
 for fib in fibs {
     squared.append(fib*fib)
 }
 print(squared)

 */



/*
 8.使用map方法进行操作
 let squraed1 = fibs.map{fib in fib*fib}
 print("========")
 print(squraed1)

 
 */

/*
 9.
 Element 数组中包含元素的占位符
 T 是元素转换之后类型的占位符。
 map 函数本身并不关心 Element 和 T是什么，他们可以是任意类型。
 T的具体类型将由调用者传入给map的transform方法的返回值类型来决定。
 
 extension Array {
     func map<T>(_transform:(Element)->T) -> [T] {
         var result:[T] = []
         result.reserveCapacity(count)
         for x in self {
             result.append(_transform(x))
         }
         return result
     }
 }


 */


/*
 10.
 
 */

//func map<T>(_ transform:(Element)throws -> T) rethrows ->[T]


//let names = ["Paula","Elena","Zoe"]

//var lastNameEndingInA:String?
//for name in names.reversed() where name.hasSuffix("a") {
//    lastNameEndingInA = name
//    break
//}
//print(lastNameEndingInA ?? "")
//
//
//extension Sequence {
//    func last(where predicate:(Element) ->Bool) -> Element? {
//        for element in reversed() where predicate(element) {
//            return element
//        }
//        return nil
//    }
//}

//let match = names.last{$0.hasSuffix("a")}
//print("match==>\(match ?? "aaa")")



//let name: String? = "老王"
//let age: Int? = 10
//
//if name != nil && age ?? 0 > 0 {
//    print(name! + age!.description)
//}
//
//print("=====1======")
//
//if let nameNew = name,
//    let ageNew = age{
//    print(nameNew,ageNew.description)
//}
//
//
//print("======2=====")
//func demo(name:String?, age: Int?){
//    guard let nameNew1 = name,
//        let ageNew1 = age else {
//        print("guard let")
//        return
//    }
//    print(nameNew1 + String(ageNew1))
//}

//var names = ["Paula","Elena","Zoe"]
//names.map { item in
//    names.insert("aa", at: 1)
//}
//
//extension Array {
//    func accumulate<Result>(_ initialResult: Result,_ nextPartialResult:(Result,Element) ->Result) -> [Result] {
//        var running = initialResult
//        return map { next  in
//            running = nextPartialResult(running,next)
//            return running
//        }
//    }
//}
//
//
//let ttArr = [1,2,3,4].accumulate(0, +)
//print(ttArr)


//let nums = [1,2,3,4,5,6,7,8,9,10]
//nums.filter { num in num % 2 == 0
//    print("num===>\(num)")
//}
//
//nums.filter{$0 % 2 == 0}

//let fibs = [1,2,3,4,5,6]
//let sum = fibs.reduce(0){total,num in total + num}
//print("sum===>\(sum)")
//
//
//extension Array {
//    func map2<T>(_ transform:(Element) -> T) -> [T] {
//        return reduce([]){
//            $0 + [transform($01)]
//        }
//    }
//}


//let suits = ["♠︎", "♥︎", "♣︎", "♦︎"]
//let ranks = ["J","Q","K","A"]
//
//let result = suits.flatMap { suits in
//    ranks.map { rank in
//        (suits,rank)
//    }
//}
//
//
//print(result)
//
//enum Setting {
//    case text(String)
//    case age(Int)
//    case bool(Bool)
//}
//
//let defaultSettings: [String:Setting] = [
//    "Airplane Mode":.bool(false),
//    "Name":.text("My iphone"),
//    "ageNum":.age(10)
//]
//

/**
 var userSettings = defaultSettings
 作用是把不可变的 ”defaultSettings“  复制一份并且命名为 ”userSettings“
 */
//var userSettings = defaultSettings
//userSettings["Name"] = .text("码农晨仔")
//userSettings["Airplane Mode"] = .bool(true)
//
//
//print(userSettings.values)
//print("==========")
//
//let oldName = userSettings.updateValue(.text("小晨晨"), forKey: "name")
//print(userSettings["Name"] ?? "")//输出 ”小晨晨“
//
//let tempAge = userSettings.updateValue(.age(20), forKey: "ageNum")
//print(userSettings["ageNum"] ?? 0)//输出 ”小晨晨“
//
//
//var settings = defaultSettings
//let overriddenSettings:[String:Setting] = ["Name":.text("jiachenzailianxi")]
//settings.merge(overriddenSettings, uniquingKeysWith: {$1})
//print("setting==>\(settings)")
//
//
//extension Sequence where Element:Hashable {
//    var frequencies:[Element:Int] {
//        let frequencyPairs = self.map{($0,1)}
//        print("frequencyPairs==>\(frequencyPairs)")
//        return Dictionary(frequencyPairs,uniquingKeysWith:+)
//    }
//}
//
//let frequencies = "hello".frequencies
//print("frequencies + \(frequencies)")
//
//print("==========")
//
//frequencies.filter{$0.value > 1}
//print("frequencies + \(frequencies.filter{$0.value > 1})")
//
//
//
//
//let settingAsStrings = settings.mapValues { setting -> String in
//    switch setting {
//    case .text(let text): return text
//    case .age(let number): return String(number)
//    case .bool(let value): return String(value)
//    }
//}
//print("settingsAsStrings ==> \(settingAsStrings)")

/**

 ExpressibleByArrayLiteral 协议
 
 let naturals: Set = [1,2,3,2]
 print("naturals==>\(naturals)")
 print("naturals.contains(3)==>\(naturals.contains(3))")
 naturals.contains(0)
 print("naturals.contains(0)==>\(naturals.contains(0))")

 */


//补集
/*
 let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
 let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
let nonNeighbors = employees.subtracting(neighbors)
   print("nonNeighbors==>\(nonNeighbors)")
   print("===========")
 let nonEmployees = neighbors.subtracting(employees)
 print("nonEmployees==>\(nonEmployees)")
 */
 



/**
 交集
 let iPods: Set = ["iPod touch", "iPod nano", "iPod mini",
 "iPod shuffle", "iPod Classic"]
 let touchscreen: Set = ["iPhone", "iPad", "iPod touch", "iPod nano"]
 let iPodsWithTouch = iPods.intersection(touchscreen)
 print("iPodsWithTouch==>\(iPodsWithTouch)")
 */

/**
 并集
 let discontinuedIPods: Set = ["iPod mini", "iPod Classic",
 "iPod nano", "1"]
 var discontinued:Set = ["iBook","Powerbook","Power Mac","1"]
 discontinued.formUnion(discontinuedIPods)
 //SetAlgebra 协议。
 print("discontinued==>\(discontinued)")
 */

//var indices  = IndexSet()
//indices.insert(integersIn:1..<5)
//indices.insert(integersIn: 11..<15)
//let  evenIndices = indices.filter{$0 % 2 == 0}
//
//extension Sequence where Element: Hashable {
//    func unique() -> [Element] {
//        var seen:Set<Element> = []
//        return filter { element in
//            if seen.contains(element) {
//                return false
//            } else {
//                seen.insert(element)
//                return true
//        }
//    }
//  }
//}
//print([1,2,3,12,1,3,4,5,6,4,6].unique())
import Foundation
/*
//闭合范围
let  singleDigitNumbers = 0..<10
Array(singleDigitNumbers)
let  lowercaseLetters = Character("a")...Character("z")
print("lowercaseLetters==>\(lowercaseLetters)")

//单边范围
let  fromZero = 0...
let upToZ = ..<Character("z")

/**
 Range  ..< 创建的半开范围
 ClosedRange ... 闭合范围
 */
let result1 = singleDigitNumbers.contains(9)
let result2  = lowercaseLetters.overlaps("c"..<"f")

print("result1:\(result1),result2:\(result2)")
*/

/**
 KVC 在swift中的使用
 
class SimpleClass {
    var someValue: String = "123"
}
//SimpleClass().setValue("456", forKey: "someValue") // 错误, 必须要继承自 NSObject

class KVCClass :NSObject{
//   @objc
    var someValue: String = "123"
}
let kvc = KVCClass()
kvc.someValue // 123
kvc.setValue("456", forKey: "someValue")
kvc.someValue // 456
print("\(kvc.someValue)")

*/

/**
 KVO 的使用
class KVOClass:NSObject {
    dynamic var someValue: String = "123"
    var someOtherValue: String = "abc"
}

class ObserverClass: NSObject {
    func observer() {
        let kvo = KVOClass()
        kvo.addObserver(self, forKeyPath: "someValue", options: .new, context: nil)
        kvo.addObserver(self, forKeyPath: "someOtherValue", options: .new, context: nil)
        kvo.someValue = "456"
        kvo.someOtherValue = "def"
        kvo.removeObserver(self, forKeyPath: "someValue")
        kvo.removeObserver(self, forKeyPath: "someOtherValue")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("\(keyPath!) change to \(change![.newKey] as! String)")
    }
}
ObserverClass().observer()
**/








