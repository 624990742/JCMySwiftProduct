import UIKit

/*
 字符串的操作
 */
//初始化语法
//var emtyString = String()
//if emtyString.isEmpty {//空字符串判断
//    print("这是一个空字符串")
//}

//#必须和特殊字符是相同的数量字符串中才能显示正常的特殊字符
//let str = ##"1\#n2\#n3"##
//print(str)


//var str:String = "abc"
//var str1 = str
//print(str == str1)
//str += "def"
//print(str)
//print(str1)
//print(str == str1)

//
//for character in  "Dog 拘 ！"{
//    print(character)
//}

//字符串通过数组进行构造
//let catCharacters: [Character] = ["c","a","d","f","d"]
//let catStrig = String(catCharacters)
//print(catStrig)

//字符串添加

//var welme1 = "hello"
//var welme2 = welme1
//print(welme1 == welme2)
//welme1.append(",")
//print(welme1)
//print(welme2)
//
//for c in welme1 {
//    print(c)
//}

//let str = #"6*7 = \#(6 * 7)"#
//print(str)


//字符串的索引
//let greeting = "Guten Tag!"
//greeting[greeting.startIndex]//开始索引上的字符
//greeting[greeting.index(before: greeting.endIndex)]//结束索引上的字符
//greeting[greeting.index(after: greeting.startIndex)]//第一个字符以后得值
//let index = greeting.index(greeting.startIndex,offsetBy: 7)//获取指定索引上的字符
//greeting[index]
//


////插入字符串
//var welcome = "hellddajdjalajdlahdkahdeuabw"
//welcome.insert("A", at: welcome.startIndex)
////插入另一个字符串的内容到特定的索引上
//welcome.insert(contentsOf: "我", at: welcome.index(before: welcome.endIndex))
//welcome.caseInsensitiveCompare("me")
//
//
////移除
//welcome.remove(at: welcome.index(before: welcome.endIndex))
//print(welcome)
//
////移除某一区间的字符串
//let range = welcome.index(welcome.endIndex,offsetBy: -1)..<welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)



//if let i = welcome.firstIndex(of: "w") {
//         welcome.remove(at: i)
//     }
// print(welcome)

//子字符串
//let greeting = "Hello,world!"
//let index = greeting.firstIndex(of:",") ?? greeting.endIndex
//let beginning = greeting[..<index]
//let newString = String(beginning)

//字符串的比较

//var welcome = "Hello,world!"
//var welcome1 = "Hello,world!"
//print(welcome == welcome1)
//print(welcome.hasPrefix("hello"))//前缀相等性
//print(welcome.hasSuffix("word"))//后缀相等性


/*
 溢出运算符
 1、溢出加法 （&+）
 2、溢出减法 （&-）
 3、溢出乘法  (&*)
 */

//let num1:UInt8 = 250
//let num2 = num1&+10
//print(num2)


//let num1:UInt8 = 0
//let num2 = num1&-1
//print(num2)

/*
 合并空置运算符
 */
//let a:Int? = nil
//let b = 4
//print(a ?? b)

//let a:Int? = 3
//let b = 4
//print(a ?? b)

//let a:Int? = nil
//let b:String = "bb"
//print(a ?? b)


//let a:Int? = nil
//let b:Int = 2
//print(a ?? b)

//func addTwoNum(num1: Int?,num2: Int?) -> Int {
    //没有使用空置运算符
//    if num1 != nil {
//        if num2 != nil{
//            return num1! + num2!
//        }else{
//            return num1!
//        }
//    }else{
//        if num2 != nil{
//           return num2!
//        }else{
//            return 0
//        }
//    }
 //使用之后
//    return (a ?? 0) + (b ?? 0)
//      return (a ?? 0) + (b)
//}
//
//print(addTwoNum(num1: a, num2: b))

/*
 闭区间预算符
 */

//for index in 1...5 {
//    print("\(index) times 5 is \(index * 5)")
//}

//let names = ["xiaochen" ,"jiachen","zhouyi","xiaochen1" ,"jiachen1","zhouyi1"]
//let count = names.count
//for i in 0..<count {
//    print("Person\(i+1) is called\(names[i])")
//}

//for name in names[2...] {
//    print(name)
//}
//print("--------")
//
//for name1 in names[...2] {
//    print(name1)
//}
//print("--------")
//
//for name2 in names[..<2] {
//    print(name2)
//}



//let range = ...5
//range.contains(7)
//range.contains(4)
//range.contains(-1)

//移除一个区间
//var welecome = "hello,world"
//let range = welecome.index(welecome.endIndex, offsetBy: -5)..<welecome.endIndex
//welecome.removeSubrange(range)
//print(welecome)

//反向便利
//for i in (0..<10).reversed() {
//    print(i)
//}

//let weloome = "Hello,world"
//let interval = "a"..."z"
//for c in weloome {
//    if !interval.contains(String(c)) {
//        print("\(c)不是小写字母")
//    }
//}
//var a = 10
//var b = 8
//a = a ^ b
//print(a)
//print("-----------")
//
//b = a ^ b
//print(b)
//print("-----------")
//
//a = a^b
//print(a)
//print(b)
//print("-----------")



/*
 类和结构体
 运算符重载
 */
//
//struct Coordinate2D {
//    var x = 0.0,y = 0.0;
//}
//
//extension Coordinate2D {
//    static func + (left: Coordinate2D, right: Coordinate2D) -> Coordinate2D{
//    return Coordinate2D(x: left.x + right.x, y: left.y + right.y)
//    }
//}
//
//let vector = Coordinate2D(x:30 ,y:1.0)
//let anotherVector = Coordinate2D(x: 2.0, y: 4.0)
//let combinedVector =  vector + anotherVector
//print(combinedVector)
/*
一元运算符重载
类与结构体也能提供标准一元运算符的实现。
要实现前缀或者后缀运算符，需要在声明运算符函数的时候在
 func关键字之前指定prefix（前缀） 或者 postfix（后缀）限定符
*/

//struct Coordinate2D {
//    var x = 0.0,y = 0.0;
//}
//extension Coordinate2D {
//    static prefix func - (vector: Coordinate2D) -> Coordinate2D{
//        return Coordinate2D(x: -vector.x, y: -vector.y)
//    }
//}
//let positive = Coordinate2D(x: 3.0, y: 4.0)
//let negative = -positive
//let alsopositive = -negative



//extension Coordinate2D {
//    static postfix func  -- (vector: Coordinate2D) -> Coordinate2D{
//        return Coordinate2D(x: -vector.x, y: -vector.y)
//    }
//}
//var positive = Coordinate2D(x: 3.0, y: 4.0)
//var negative = positive--
//var alsopositive = negative--


/*
组合赋值运算符重载
组合赋值运算符将赋值运算（=）与其它运算符进行结合
实现时，需要把运算符的左参数设置成 inout 类型（可以修改），
 因为这个参数的值会在运算符函数内直接被修改
*/
//struct Coordinate2D {
//    var x = 0.0,y = 0.0;
//}
//extension Coordinate2D {
//    static  func += (left: inout Coordinate2D ,right: Coordinate2D) -> Coordinate2D{
////        left.x =  left.x + right.x
////        left.y =  left.y + right.y
//        return Coordinate2D(x: left.x + right.x, y: left.y + right.y )
//    }
//}
//var original = Coordinate2D(x: 1.0, y: 2.0)
//let vectorToAdd = Coordinate2D(x: 3.0, y:4.0)
//original += vectorToAdd

/*
等价运算符重载
自定义类和结构体不接收等价运算符的默认实现，就是所谓的“等于“预算符（==）和 ”不等于”运算符 （!=）。
 
 要使用等价运算符来检查你自己类型的等价，需要和其他中缀运算符一样提供一个“等于”运算符重载，并且遵循标准库的Equatable协议
*/
// struct Coordinate2D {
//     var x = 0.0,y = 0.0;
// }
//
//extension  Coordinate2D:Equatable {
//    static func == (left: Coordinate2D, right: Coordinate2D) ->Bool{
//        return (left.x == right.x) && (left.y == right.y)
//    }
//}

/*
 Swift 为以下自定义类型提供等价运算符合成实现
 - 只是拥有遵循Equatable协议存储属性的结构体
 - 只拥有遵循Equatable协议关联类型的枚举
 - 没有关联类型的枚举
 */


//struct Coordinate4D: Equatable{
//    var x  = 0.0, y = 0.0 ,z = 0.0 ,f = 0.0
//}
//
//let coordinate1 = Coordinate4D(x:2.0 ,y: 3.0,z: 4.0 ,f: 5.0)
//let coordinate2 = Coordinate4D(x:2.0 ,y: 3.0,z: 4.0,f: 5.0)
//if (coordinate1 == coordinate2){
//    print("相等")
//}

/*
 自定义运算符
 新的运算符要在全局作用域内，使用operator关键字进行声明，同时还要指定
 prefix（z前缀）、 infix(中缀) 、 postfix（后缀）
 
 */

//
//struct Coordinate2D{
//    var x  = 0.0, y = 0.0
//}
//
//
//prefix operator +++
//extension Coordinate2D {
//    static prefix func +++ (vector: inout Coordinate2D) -> Coordinate2D {
//        vector.x += vector.x
//        vector.y += vector.y
//        return vector
//    }
//}
//var roBeDouble =  Coordinate2D(x: 1.0, y: 4.0)
//let afterDoubling = +++roBeDouble
//print(afterDoubling)

/*
 自定义中缀运算符的优先级和结合性
 每一个自定义的中缀运算符都y属于一个优先级组
 优先级组指定了自定义中缀运算符和其他中缀运算符的关系
 */

//
//struct Coordinate2D{
//    var x  = 0.0, y = 0.0
//}
//
//infix operator +-: AdditionPrecedence
//extension Coordinate2D {
//    static func +- (left: Coordinate2D,right: Coordinate2D) ->Coordinate2D{
//        return Coordinate2D(x:left.x + right.x,y: left.y - right.y)
//    }
//}
//
//infix operator *^: MultiplicationPrecedence
////自定义优先级组
//precedencegroup MyPrecedence {
////    higherThan:AdditionPrecedence  优先级比加法运算高
//    lowerThan: AdditionPrecedence  // 优先级, 比加法运算低
//    associativity: left  // 结合方向:left, right or none
//    assignment:false   // true=赋值运算符,false=非赋值运算符
//
//}
//
//extension Coordinate2D {
//    static func *^ (left: Coordinate2D,right: Coordinate2D) -> Coordinate2D {
//        return Coordinate2D(x: left.x * right.x,y: left.y * left.y + right.y * right.y)
//    }
//}
//let firsCoordinate = Coordinate2D(x: 1.0, y: 2.0)
//let secondCoordinate = Coordinate2D(x: 3.0, y: 8.0)
//let plusMinusCoordinate = firsCoordinate +- secondCoordinate
//let thirdCoordinate = Coordinate2D(x: 2.0, y: 2.0)
//let coordinate = firsCoordinate +- secondCoordinate *^ thirdCoordinate
//print(coordinate.x)
//print(coordinate.y)


/*
 /*******************************************************************************/

 1、函数的定义
 */

//func greet (person: String) -> String {
//    let greeting = "Hello," + person + "!"
//    return greeting
//}
//print(greet(person: "西贝先生"))
//
//print(_:separator:terminator:)

/*
2、无参数函数
*/

//func sayHelloworld() -> String {
//    return "Hello, world 我是屌丝爷们"
//}
//print(sayHelloworld())


/*
3、多参数函数
*/

//func moreGreet(person: String, alreadyGreeted: Bool) -> String {
//    if alreadyGreeted {
//        return greet(person: person)
//    } else {
//        return greet(person: person)
//    }
//}

//4、可选元组返回类型
// (Int, Int)? 或 (String, Int, Bool)?
//
//
//func minMax(array: [Int]) -> (min: Int, max: Int)? {
//    if array.isEmpty {
//     return nil
//    }
//
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//         currentMax = value
//        }
//    }
//    return(currentMin,currentMax)
//}


 /*
 ####################################################################
  闭包
 */

 /*
 排序的方法
 let names = ["jack","kali","diaosi","mihao"]

func backWard(_ s1: String, _ s2: String) -> Bool {
    return s1 >  s2
}
var reversedNames = names.sorted(by: backWard(_:_:))
print(reversedNames)
 */

 /*
 闭包语法 表达式
 { (parameters) -> return type in
 statements
 }
 
 内联闭包参数和返回值类型声明函数类型声明相同。
  关键字 “in” 该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
 */
//参数为内联闭包
//  let names = ["jack","kali","diaosi","mihao"]
// var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2
//})
////swift可以上下文推断类型 所以简化如下
//reversedNames = names.sorted(by: {s1, s2 in return s1 > s2 })

/*
####################################################################
  1、柯里化（Currying）
*/

//func addNumber(num: Int) ->Int{
//    return num + 1
//}

//func addTo(_ adder: Int) -> (Int) -> Int{
//    return {
//        num in
//        return num + adder
//    }
//}
//
//let addTwo = addTo(2)
//let result = addTwo(6)
//print(result)


//基本的柯里化函数
//func addToNumber(_ adder: Int) -> (Int) -> Int {
//    return { num in
//        return num + adder
//    }
//}
//
//let addTwo = addToNumber(2)   //产生一个以2为被加数的闭包
//var result6 = addTwo(6) // 2 + 6
//var result7 = addTwo(7) // 2 + 7



// Swift 3.0之前(利用柯里化声明方法):
//func curried(x: Int)(y: String) -> Float {
//    return Float(x) + Float(y)!
//}


//// Swift 3.0之后(利用闭包实现):
//func curried(x: Int) -> (String) -> Float {
//    return {(y: String) -> Float in
//        return Float(x) + Float(y)!
//    }
//}

/*
 借助柯⾥化，安全改造和利用target-action
 */


/*
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>:TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    func performAction() -> (){
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    func setTarget<T: AnyObject>(target: T,action: @escaping (T) ->() ->(),controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    func removeTargetForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent] = nil
    }
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]? .performAction()
    }
}
 */

//协议
protocol Vehicle{
    var numberOfWheels:Int {get}
    var color:UIColor {get set}
    mutating func changeColor()
}


struct MyCar: Vehicle {
   
    let numberOfWheels = 4
    var color = UIColor.blue
    mutating func changeColor() {
        color = .red
    }
}

//闭包
func makeIncrementer(amout: Int)-> () -> Int {
    var total = 0
    func incrementer() -> Int {
     total += amout
      return total
    }
    return incrementer
}

let incrementByTen = makeIncrementer(amout: 10)
//print(incrementByTen())
//print(incrementByTen())
//print(incrementByTen())

//捕获
let incrementBySeven = makeIncrementer(amout: 7)
//print(incrementBySeven())

/**
 闭包的采用如下之一的形式：
 全局函数是一个有名字但不会捕获任何值的闭包
 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 */


/*
 1.闭包表示式延迟处理
 var tetsData = ["nihao","haha","xixi","lle","woaini"]
 let customerProvider = {tetsData.remove(at: 0)}
print("执行闭包前数组个数==>\(tetsData.count)")//这里打印count的时候上边的“闭包”没有执行。
print(customerProvider())//这里的时候闭包才会执行
print("执行闭包后组个数==>\(tetsData.count)")
 */
/*
 2.逃逸闭包
 */
var providers:[() -> String] = []

/*
 非逃逸闭包(会报错)
func collectCustomerProviders(provider: () -> String){
    providers.append(provider)
}
*/

/*
 逃逸闭包 （关键字 @escaping）

 func collectCustomerProviders(provider:@escaping () -> String){
     providers.append(provider)
 }
 */



/*
 自动闭包 （关键字 @autoclosure）
 
 */
//var names = ["zhangsan","lisi","wangwu","zhaoliu"]
//func collectCustomerProviders(provider:@autoclosure @escaping () -> String){
//    providers.append(provider)
//}

//这里如果不加 @autoclosure  需要写成
//collectCustomerProviders(provider: {names.remove(at: 0)})
//collectCustomerProviders(provider: names.remove(at: 0))
//print("前边:\(names.count)")
//for provider in providers {
//    print(provider())
//}
//print("后边:\(names.count)")

//在类中使用逃逸闭包需要使用self显示引用否则会报错
//class someThingClass {
//    var x:String = "hello"
//    func doSomeThing() {
//        collectCustomerProviders(provider: self.x)
//    }
//}
//
//


/**
 高阶函数
 */

//let numbers = [1,2,3,4,10]
//print(numbers.map{$0 * 10})
//print(numbers.filter{$0 > 4})
//print(numbers.reduce(100, {$0 + $1}))
//
//
//let arrayNumbers = [[1,2,3],[4,5,6],[7,8,9]]
//print(arrayNumbers.flatMap{ $0.map{$0 * 10}})
//
//let names:[String?] = ["zhangsan","lisi",nil,"wangwu",nil,"zhaolu"]
//print(names.count)
//print(names.compactMap {$0})
//print(names.compactMap{ $0?.count })

//一、filter方法:可以过滤数组中不满足筛选条件的元素，返回满足筛选条件的元素所组成的数组。


////滤波器
//let array = [1,2,3,4]
//let filteredArray = array.filter{$0 > 2}
//print(filteredArray)//[3, 4]

//var tempArr = [Int]()
//for s in array {
//    if s > 2 {
//    tempArr.append(s)
//    }
//}
//print(tempArr)
//


//let array = [1,2,3,4]
//let testMapArray = array.map{$0 * 10}
//print(testMapArray)


//
//let arraArr: [Any?] = [0,1,2,4,5,nil,"abc",9,"109"]
//let arrInt = arraArr.map { (obj) -> Int in
//    if obj is Int {
//        return obj as! Int
//    } else {
//        return 0
//    }
//}
//print("arrInt: \(arrInt)")


// 计算字符串的长度
//let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
//let arrayCount = stringArray.map { (str) -> Int in
//      return str.count
//}

//print("arrayCount: \(arrayCount)")

let sizes = ["s","m","l"]
let colors = ["red","black","white"]
//let groups = sizes.map { size  in
//    colors.map({ color  in
//        return (size + "" + color)
//    })
//}
//print(groups)

//var groups:[String] = []
//for size in sizes {
//    for color in colors {
//        groups.append(size+color)
//    }
//}
//  print(groups)


//let groups = sizes.flatMap { size in
//    colors.map({ color in
//        return (size  + " " + color)
//    })
//}
//print(groups)
//


/**
 范式转换 - 传统式
 **/

/*
let NON_WORDS: Set = ["the","and","of","to","a","i","it","in","or","is","as","so","but","be"]


func wordFreq(wors: String) -> [String: Int] {
    var wordDidct:[String: Int] = [:]
    let wordList = wors.split(separator:" ")
    for word in wordList {
        let lowerCaseWord = word.lowercased()
        if !NON_WORDS.contains(lowerCaseWord) {
            if let count = wordDidct[lowerCaseWord] {
                wordDidct[lowerCaseWord] = count + 1
            } else {
                wordDidct[lowerCaseWord] = 1
            }
        }
    }
    return wordDidct;
}


let words = """
  there are moments in life when you miss someone  so
  much that you just want to pick them from your dreams
  and hug them for real Dream what you want to dream go
  where  you want to go be what you want to be because
  you have only one life and one chance to do all the things
  you want to do
  """
print(wordFreq(wors: words))
*/


/** 范式转换 - 函数式 */
//let NON_WORDS: Set = ["the","and","of","to","a","i","it","in","or","is","as","so","but","be"]
//
//let words = """
//  there are moments in life when you miss someone  so
//  much that you just want to pick them from your dreams
//  and hug them for real Dream what you want to dream go
//  where  you want to go be what you want to be because
//  you have only one life and one chance to do all the things
//  you wan
//"""
//func wordFreq2(words: String) -> [String: Int] {
//    var wordDict: [String:Int] = [:]
//    let wordList = words.split(separator: " ")
//    wordList.map{$0.lowercased()}
//        .filter{ !NON_WORDS.contains($0)}
//        .forEach{(word) in
//            wordDict[word] = (wordDict[word] ?? 0) + 1
//    }
//    return wordDict;
//}
//
//print(wordFreq2(words: words))


//输出：["AA", "BB", "CC"]


//func wordFreq2(words: String) -> [String: Int] {
//    var wordDict: [String: Int] = [:]
//    let wordList = words.split(separator: <#T##Character#>)
//
//}


struct PackageInfo{
    var name:String
    var number:Int
    var price:Float
    var address:String
}
//let testInfo = [
//    PackageInfo(name: "测试1", number: 1, price: 80.0, address: "阿西西"),
//    PackageInfo(name: "测试2", number: 2, price: 88.0, address: "哈哈"),
//    PackageInfo(name: "测试3", number: 3, price: 35.0, address: "7哈哈"),
//    PackageInfo(name: "测试4", number: 4, price: 50.0, address: "oo")
//]
//
//let testDemo = testInfo.filter{(package) -> Bool in
//    return package.price == 80
//}
//print(testDemo)


//let testInfo = [
//    PackageInfo(name: "测试1", number: 1, price: 1111, address: "阿西西"),
//    PackageInfo(name: "测试2", number: 2, price: 882.0, address: "哈哈"),
//    PackageInfo(name: "测试3", number: 3, price: 35.0, address: "7哈哈"),
//    PackageInfo(name: "测试4", number: 4, price: 50.0, address: "oo")
//]
//
//let reduceName = testInfo.reduce("") {$0 + $1.address}
//reduceName = "Swift高阶函数编程Swift面向协议编程Swift基础Swift进阶"
//print(reduceName)
//
//var dataArr = [3, 5, 6, 7, 8]
//var totalValue = dataArr.reduce(0) { $0 + $1 }
//print(totalValue)



//let names = ["西贝", "小呗"]
//let ages = [7, 6]
//let dict = Dictionary(uniqueKeysWithValues: zip(names, ages))
//print(dict)

//let array = ["Apple", "Pear", "Pear", "Orange"]
//let dic = Dictionary(zip(array, repeatElement(1, count: array.count)), uniquingKeysWith: +)
//print(dic)


//let testText = "Hello, World"
//var testARR = ["a","e","i","o","u"]
//let testDemmo = zip(testText,testARR).map { $0 }
//print(testDemmo)

//命令是写法
let dataArr = ["neal","s","stu","j","rich","bob","aiden","j","ethan","liam","mason","noah","lucas","jacob","jack"]
//
//func cleanNames(names:Array<String>) -> String {
//    var cleanedNames = ""
//    for name in names {
//        if name.count > 1 {
//            cleanedNames += name.capitalized + ","
//            print("cleanedNames==> + \(cleanedNames)")
//        }
//    }
//    cleanedNames.remove(at: cleanedNames.index(before: cleanedNames.endIndex))
//    return cleanedNames
//}
//print(cleanNames(names: dataArr))


//函数式写法

let test1 = "anhds"
print(test1.capitalized)


//let cleanedNames = dataArr.filter{$0.count > 1}
//                           .map{$0.capitalized}
//                           .joined(separator: ",")
//
//print(cleanedNames)

//并行操作
//extension Array where Element: Any {
//    func parallerMap<T>(_ transform: (Element) -> T) -> [T] {
//        let n = self.count
//          if n == 0 {
//            return []
//        }
//        var result = ContiguousArray<T>()
//        result.reserveCapacity(n)
//
//        DispatchQueue.concurrentPerform(iterations: n) {
//            (i) in
//            result.append(transform(self[i]))
//        }
//        return Array<T>(result)
//    }
//}



//let cleanedNames = dataArr.filter{$0.count > 1}
//                           .map{$0.capitalized}
//                           .joined(separator: ",")
//
//
//print(cleanedNames)
//


//筛选 （filter）
//映射 （map）
//折叠 foldLeft
//化约  reduce

let numbers = [Int](1...7)

//for num in numbers {
//    print(num)
//}
//
//numbers.forEach { (num) in
//    if num == 3 {
//        return
//    }
//    print(num)
//}



/******** 枚举   *******/


//enum CompassPoint: CaseIterable {
//    case south
//    case north
//    case east
//    case west
//}

//print(CompassPoint.allCases)


/*
 基础用法
 */
enum testPoint{
    case headerPoint
    case bodyPoint
    case footerPoint
}





/*
   常规用法（一）
 enum ControlPoint: String, CaseIterable{
     case headerPoint = "headerPoint"
     case bodyPoint = "bodyPoint"
     case footerPoint = "footerPoint"
 }
 print(ControlPoint.allCases)
 */

/*
 常规用法（二）
 enum CompassPoint: Int {
     case south = 5
     case north
     case east
     case west
 }

 let direction = CompassPoint(rawValue: 9)
 print(direction ?? 5)//默认值为 5 防止为nil

 */





/*
 便利枚举的方法
 
let pointTest = testPoint.headerPoint;
 switch pointTest {
 case .headerPoint:
 print("headerPoint")
 case .bodyPoint:
 print("bodyPoint")
 case .footerPoint:
 print("footerPoint")
  }

if pointTest == .headerPoint {
   print("footerPoint")
}
*/


/*
 嵌套枚举

enum Adress {
    enum Province {//省份
        case Hebei
        enum Shanxi: String {//地级市
                    case taiyuan = "太原"
                    case linfen = "临汾"
                }
    }
    
}
print(Adress.Province.Shanxi.taiyuan.rawValue)

 */



/*
 关联值
enum Shopping {
    case Buy(price: String, number: Int)
    case state(total: Int, surplus: Int)
}

//省略的写法
enum Shopping {
    case Buy(String, Int)
    case state(Int,Int)
}

func testMethon(sate:Shopping) { }

let testShop = Shopping.Buy("橘子", 10)
print(testShop)
*/




//
//enum Barcode {
//    case upc(Int, Int, Int, Int)
//    case qrCode(String)
//}
////var productCode = Barcode.upc(1, 2, 3, 4)
//var productCode = Barcode.qrCode("abgsh")
//print(productCode)
//switch productCode {
//  case .upc(let a , let b, let c, let d):
//  print("upc-\(a)-\(b)-\(c)-\(d)")
//  case .qrCode(let codeString):
//     print("qrCode-\(codeString)")
//}
//
//
////递归枚举
//indirect enum TestExpression {
//    case number(Int)
//    case add(TestExpression, TestExpression)
//    case mutiply(TestExpression, TestExpression)
//}
//
//let firstExpression = TestExpression.number(5)
//let secondExpression = TestExpression.number(4)
//let addExpression  = TestExpression.add(firstExpression, secondExpression)
//let third = TestExpression.number(2)
//let mutilplyExpression = TestExpression.mutiply(addExpression, third)
//print(mutilplyExpression)
//
//
//print("====")
//
//func eval(_ expression: TestExpression) -> Int {
//    switch expression {
//    case .number(let value):
//        return value
//    case .add(let first, let second):
//        return eval(first) + eval(second)
//    case .mutiply(let first , let second):
//        return eval(first) * eval(second)
//    }
//}
//
//print(eval(mutilplyExpression))

/*
 延迟存储属性  lazy
 1、 延迟存储属性的初始值在其第一次使用时才进行计算。可以在其声明前标注lazy修饰语来表示一个延迟存储属性。
 2、如果标记了lazy修饰的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次。
 
 

class DataImporter {
    var fileName = "data.text"
    init() {
        print("DataImporter")
    }
}
class DataManage {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManage()
manager.data.append("some data")
manager.data.append("some more data")
print("manager.data.append finish")
print(manager.importer.fileName)
*/

/*
 计算属性
 除了存储属性，类、结构体和枚举也能够定义计算属性。
相反，它提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值。
 */


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0,height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x:centerX,y:centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

/*
 简写setter
 如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么它将被默认名为newValue。
 
 简写 getter
 如果整个getter 的函数体是一个单一的表达式，那么getter 隐式返回这个表达式
 */
struct TestRect1 {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            return Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.width / 2)
        }
    }
}

/*
   只读计算属性
  1.一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。
  只读计算属性返回一个值，也可以通过点语法访问，但是不能被 修改为另一个值。
  2.必须使用var 关键字定义计算属性（包括只读计算属性）为变量属性，因为它们的值
    不是固定的。let 关键字只是用于长两属性，用于明确那些值一旦作为实例初始化就不能
    更改。
 */
struct TestRect3{
    var origin = Point()
    var size = Size()
    var center:Point {
        return Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
    }
}

/*
   属性观察者
  1.willSet 会在该值被存储之前被调用
  2.didSet 会在一个新值被存储后被调用。
  3.如果你实现了一个willSet观察者，新的属性值会以常量形式参数传递。你可以在你的
  willSet 实现中为这个参数定义名字。如果你没有为它命名，那么它会使用默认的名字
  newValue。
 
  4.如果你实现了一个didSet观察者，一个包含旧属性值的常量形式参数将会被传递。
   你可以为它命名，也可以使用默认的形式参数名oldValue。如果你在属性自己的didSet
   观察者里给自己赋值，你赋值的新值就会取代刚刚设置的值。
 */

class StepCounter {
    var totalSteps:Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps tp \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCoun = StepCounter()
    stepCoun.totalSteps = 200
    stepCoun.totalSteps = 300
    stepCoun.totalSteps = 896

//print(stepCoun)

/*
  全局和局部变量
  1.观察属性的能力同样对全局变量和局部变量有效。
  2.全局变量是定义在任何函数、方法、闭包或者类型环境之外的变量。
  3.局部变量定义在函数、方法或者闭包环境之中的变量。
 
 
 var count: Int = 0 {
 willSet(newCount){
 print("About to set count to \(newCount)")
 }
 didSet {
 if count > oldValue {
 print("Added \(count - oldValue)")
 }
 }
 }
 
 count = 10
 if count == 10 {
 print("ten")
 }

 */

/*
 类型属性
 使用static 关键字来定义类型属性。
 对于类类型的计算类型属性，你可以使用class关键字来允许子类重写父类的实现。
 */

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
       return 107
    }
}

/*
  实例方法
  实例方法是属于特定类实例、结构体实例或者枚举实例的函数。他们为这些实例提供功能性，
  要么通过提供访问和修改实例属性的方法，要么通过提供与实例目的相关的功能。
 
 class Counter {
 var count = 0
 func increment() {
 count += 1
 
 }
 
 func increment(by amount: Int) {
 count += amount
 print(count)
 }
 func reset() {
 count = 0
 }
 }
 let testCounter = Counter()
 
 print(testCounter.increment(by: 10))

 */

/*
 实例方法- self
 1.每一个类的实例都隐含了一个叫做self的属性，它完全与实例本身相等。
 可以使用self调用它自身的方法。
 
 struct TempPoint {
  var x = 0.0, y = 0.0
  
  func isToTheRightOf(x: Double) -> Bool {
      return self.x > x
  }
  
 }
 let somePoint = TempPoint(x: 4.0, y: 5.0)
 if somePoint.isToTheRightOf(x: 1.0) {
   print("来了")
  }
 */

/*
  实例方法中修改属性
  1.结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改。
  2.你可以选择在func关键字前放一个mutaing 关键字来指定方可以修改属性。

 struct TestDemoPoint {
     var x = 0.0,y = 0.0
     mutating func moveBy(x deltax: Double,y deltaY: Double)
     {
       x += deltax
       y += deltaY
     }
 }
 var somePoint = TestDemoPoint(x: 1.0,y: 1.0)
 somePoint.moveBy(x: 2.0, y: 3.0)
 print("The point is now at(\(somePoint.x),\(somePoint.y))")
 
 */



/*
 在mutating 方法中赋值给 self
 1.Mutaing 方法可以指定整个实例给隐含的self属性

 struct TestDemoPoint {
     var x = 0.0, y = 0.0
     mutating func moveBy(x deltaX: Double,y deltaY: Double)
     {
         self = TestDemoPoint(x: x + deltaX, y: y + deltaY)
     }
 }
 var somePoint = TestDemoPoint(x: 1.0, y: 1.0)
 somePoint.moveBy(x: 2.0, y:3.0)

 */

 /*
  枚举的mutating方法
  枚举的异变方法可以设置隐含的self属性为相同枚举里的不同成员。
 
 enum TestTriSwitchState {
    case open, letft, right, close
    mutating func next(){
        switch self {
        case .open:
            self = .letft
        case .letft:
            self = .open
        case .right:
            self = .close
        case .close:
            self = .right
     }
   }
 }
  var ovenLight = TestTriSwitchState.letft
  ovenLight.next()
  ovenLight.next()

  */


/*
 类型方法
 通过在func关键字之前使用static关键字来明确一个类型方法。类同样可以使用class关键字来允许
 子类重写父类对类型方法的实现。
 
  class TestSomeClass{
     class func rewriteTestSomeMethod(){
         print("重写了TestSomeClass")
     }
  }

 TestSomeClass.rewriteTestSomeMethod()
 */


/*
  下标语法
 1.下标脚本允许你通过在实例名后面的方括号内写一个或多个值对该类的实例进行查询。
   它的语法类似于“实例方法”和“计算属性”。使用关键字subscript来定义下标，
   指定一个或者多个输入形式参数和返回类型，与实例方法一样。与实例方法不同的是，
   下标可以是读写也可以是只读的。
 
 struct TestTimesTab {
     
     let mutiplier: Int,tempLier: Int
     subscript(index: Int, lastIndex: Int) -> Int {
         return (mutiplier * index) + (lastIndex * lastIndex)
     }
 }
  let threeTimesTa = TestTimesTab(mutiplier: 1, tempLier: 2)
  print("six times three is \(threeTimesTa[4,2])")


 */


/*
 下标参数
 1.下标可以接收任意数量的输入形式参数，并且这些输入形式参数可以是任意类型。下标也可以
 返回任意类型。下标可以使用变量形式参数和可变形式参数，但是不能使用输入输出形式参数
 或提供默认形式参数值。

 struct TestMatix {
     let rows: Int, columns: Int
     var grid: [Double]
     init(rows: Int, columns: Int) {
         self.rows = rows
         self.columns = columns
         grid = Array(repeating: 0.0, count: rows * columns)
     }
     func indexIsValid(row: Int, colum: Int) -> Bool {
        return row >= 0 && row < rows && colum >= 0 && colum < columns
     }
     
     subscript(row: Int, column: Int) -> Double {
         get {
             assert(indexIsValid(row: row, colum: column),"Index out of range")
             return grid[(row * columns) + column]
         }
         set {
             assert(indexIsValid(row: row, colum: column),"Index out of range")
             grid[(row * columns) + column] = newValue
         }
     }
     
 }

   var matrix = TestMatix(rows: 2, columns: 2)
       matrix[0,1] = 1.5
       matrix[1,0] = 3.2

  print(matrix)

 */


/*
 类型下标

   enum TestPlanet: Int {
       case mercury = 1,venus,earth,mars,juiter,saturn,neptune
     static subscript(n: Int) -> TestPlanet {
         return TestPlanet(rawValue: n)!
     }
  }

 let testMar = TestPlanet[4]
 print(testMar)

 */




/*
  初始化器创建特定类型的实例时被调用
 struct TestFahrenheit {
     var temperature: Double
     init() {
         temperature = 32.0
     }
 }
 var testDemo = TestFahrenheit()
 print("这是\(testDemo.temperature)")
 */


/*
 默认的属性值
 struct Fahrenheit {
     var temperature = 32.0
 }
 var f = Fahrenheit()
 print(f.temperature)

 */

/*
 默认的初始化器
 class ShoppingListItem {
     var name: String?
     var quantity = 1
     var purchased = false
  }
 var item = ShoppingListItem()
 */
  
/*
 自定义初始化：
  初始化形式参数与函数和方法的形式参数具有相同的功能和语法
 */


struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let bolingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

/*
   初始化中分配常量属性
   在初始化的任意时刻，你都可以给常量属性赋值只要r它在初始化结束是设置了确定的值即可。
   一旦为常量属性被赋值，它就不能在被修改了

 class SurveyQuestion {
     let text: String
     var response: String?
     init(text: String) {
         self.text = text
     }
     func ask() {
         print(text)
     }
 }
 let beetsQuestion = SurveyQuestion(text: "How about beets?")
 beetsQuestion.ask()
 beetsQuestion.response = ""

 */


/*
 结构体的成员初始化器
   struct TestSize {
     var width = 0.0,height = 0.0
  }
 let twoByTwo = TestSize(width: 2.0, height: 2.0)
 */

/*
  值类型的初始化器委托
 */
struct TestSize {
    var width = 0.0, height = 0.0
}
struct TestPoint {
    var x = 0.0,y = 0.0
}

struct TestRect{
    var origin = TestPoint()
    var size = TestSize()
    init() {}
    init(origin: TestPoint,size: TestSize) {
        self.origin = origin
        self.size = size
    }
    init(center: TestPoint,size: TestSize) {
        let originX = center.x - (size.width / 2)
        let orignY = center.y - (size.height / 2)
        self.init(origin: TestPoint(x: originX, y:orignY),size:size)
    }
}

/*
 安全检查
*/

/*
 convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
 便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
 便利构造函数的特点：
 1、便利构造函数通常都是写在extension里面
 2、便利函数init前面需要加载convenience
 3、在便利构造函数中需要明确的调用self.init()
 
 */
class Person {
    var name: String
    var age: Int
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
    convenience init() {
        self.init(name: "[Unnamed]", age:0)
    }
}


class Teacher: Person {
    var salary :Int
    init(name: String,age: Int,salary: Int) {
    self.salary = salary
//    self.test()
    super.init(name: name, age: age)
    self.name = name + "老师"
    }
    convenience init(name: String) {
//        self.name = name + "老师"
        self.init(name: name, age: 30, salary: 5000)
    }
    
//    func test() {
//        print("i am a teacher")
//    }
    
    func showInfo(){
        print("teacher name\(name), age\(age), salary\(salary)")
    }
}


class TestChicle {
    var currentSpeed = 0.0
    var description: String {
        return "打印出来\(currentSpeed)"
    }
    func makeNoise() {
    }
}

class TestBicle: TestChicle {
    var hasBasket = false
 }

let bicycle = TestBicle()
//    bicycle.hasBasket = true
//    bicycle.currentSpeed = 15.0
//    print("Bicycle\(bicycle.description)")


//class Train: TestBicle {
//    override func makeNoise() {
//        print("子类重写")
//    }
//}
//let train = Train()
// train.makeNoise()

class Car: TestBicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
 car.currentSpeed = 25.0
 car.gear = 3
 print("Car:\(car.description)")


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
         gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

// let automatic = AutomaticCar()
// automatic.currentSpeed = 45.0
// print("AutomaticCar:\(automatic.description)")



class TestMediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class TestMovie: TestMediaItem {
    var director: String
    init(name: String,director: String) {
        self.director = director
        super.init(name: name)
    }
}


class TestSong: TestMediaItem {
    var artist: String
    init(name: String, arrist: String) {
        self.artist = arrist
        super.init(name: name)
    }
}

let library11 = [
    TestMovie(name: "Casablance", director: "Michael Curtiz"),
    TestSong(name: "dada", arrist: "dada"),
    TestMovie(name: "1111111", director: "wenjian"),
    TestSong(name: "22222222", arrist: "dada bbbb cccc"),
    TestSong(name: "dada", arrist: "4444444"),
]


print(type(of: library11))


extension Double {
    var km: Double { return self * 1_0000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1_000.0}
    var ft: Double {return self / 3.28084}
}
let oneInch = 25.4.mm
print("oneInch\(oneInch)")

let threeFeet = 3.ft
print("oneInch\(threeFeet)")

//
//struct TestDemoSize {
//    var width = 0.0, height = 0.0
//}
//struct TestDemoPoint {
//    var x = 0.0, y = 0.0
//}
//struct TestDemoRect {
//    var origin = TestDemoPoint()
//    var size = TestDemoSize()
//}
//
//extension TestRect {
//    init(center: TestDemoPoint,size: TestDemoSize) {
//        let TestOriginX = center.x - (size.width / 2)
//        let TestOriginY = center.y - (size.height / 2)
//        self.init(origin: TestDemoPoint(x: 4.0, y: 4.0), size: TestDemoSize(width: 3.0, height: 3.0))
//    }
//}
//let centerRect = TestRect(center: TestDemoPoint(x: 4.0, y: 4.0), size: TestDemoSize(width: 3.0, height: 3.0))

extension Int {
    func repetitions(task: () -> Void){
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello")
}

protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int { get }
}


protocol LlFullyNamed {
    var fullName: String { get }
}

struct LTestPerson: LlFullyNamed {
    var fullName: String
}
let john = LTestPerson(fullName: "测试")

//class DemoStarship: LlFullyNamed {
//     var prefix:String?
//     var name:String
//     init(name: String, prefix: String? = nil) {
//        self.name = name
//        self.prefix = prefix
//    }
//    var fullName: String {
//        return{ prefix != nil ? prefix! + "" : "" } + name
//    }
// }
//
//var ncc1701 = DemoStarship(name: "ener", prefix: "uss")
//

//
//protocol AnotherProtocol {
//    static var someTypeProperty: Int {get  set}
//}
//
//
//protocol SomeProtocol {
//    init(someParameter: Int) {
//
//    }
//}

func swapTwoInts(_ a: inout Int,_ b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}


func swapTwoString(_ a: inout String,_ b: inout String){
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double,_ b: inout Double){
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(_ a: inout T,_ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//
//var someInt = 3
//var anotherInt = 107
//
//swapTwoValues(&someInt, &anotherInt)
//
//var someString = "hello"
//var anotherString = "world"
//swapTwoValues(&someString, &anotherString)
//




//struct InStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}

//泛型Stack
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()
    stackOfString.push("uno")
    stackOfString.push("dosk")

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


func someFunction<T:SomeClass,U: SomeProtocol>(someT: T, someU: U){
}

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

/*
 关联类型的应用
 1.没有指定元素如何存储在容器中，也没有指定允许存入容器的元素类型。只是指定了想成为一个 Container 的类型，必须
  提供的三种功能。遵循该协议的类型可以提供其他功能，只要满足这三个要求即可。
 
 2.任何遵循Container协议的类型必须能指定其存储值的类型。尤其它是必须保证只有正确类型的元素才能添加到容器中，而且该类型下标返回的元素类型必须是正确的。
 
 3.为了定义这些要求，Container协议需要一种在不知道容器具体类型的情况下，引用容器将存储的元素类型的方法。Container协议需要指定所有传给append（_:）方法的值必须和容器里元素的值类型是一样的，而且容器下标返回的值也是和容器里元素的值类型相同。
 
 */
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
//关联类型的应用
struct InStack: Container {
   
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
   
    mutating func pop() ->Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    func append(_ item: Int) {
    }
       
    var count: Int {
      return items.count
    }
       
    subscript(i: Int) -> Int {
     return items[i]
    }
}

////关联类型的应用
//struct TeStack<Element>: Container {
//
//
//
//    typealias ItemType = Int
//
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//
//    mutating func append(_ item: Int) {
//
//    }
//    var count: Int {
//        return items.count
//    }
//
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//
//}
//






//protocol Container {
//    associatedtype Item: Equatable
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}

//
//protocol SuffixableContainer: Container {
//    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
//    func suffix(_ size: Int) -> Suffix
//}












