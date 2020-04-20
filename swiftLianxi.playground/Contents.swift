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

enum Setting {
    case text(String)
    case int(Int)
    case bool(Bool)
}

let defaultSettings:[String:Setting] = [
    "Airplane Model":.bool(false),
    "Name":.text("My iPhone"),
]
print(defaultSettings["Name"]!)









