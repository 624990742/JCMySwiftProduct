//
//  constFile.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import Foundation
import UIKit
//import HandyJSON
//import SnapKit

let JC_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let JC_SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let JC_IPHONEX = JC_SCREEN_HEIGHT == 812 ? true : false
let JC_NavBarHeight: CGFloat = JC_IPHONEX ? 88.0 : 64.0 //导航栏的高度
let JC_TABBARHEIGHT = JC_IPHONEX ? 83.0 : 49.0 //导航栏的高度
let JC_RATIO = (JC_SCREEN_WIDTH / 375)//屏幕适配系数
let XD_SAVEAREA_TOP = JC_IPHONEX ? 24.0 : 0.0  // 顶部安全区域
let XD_SAVEAREA_BTM = JC_IPHONEX ? 34.0 : 0.0   // 底部安全区域
let XD_STATUSBAR_HEIGHT = JC_IPHONEX ? 44.0 : 20.0// 状态栏高度

/// 输出日志
/// - parameter message:  日志消息
/// - parameter logError: 错误标记，默认是 false，如果是 true，发布时仍然会输出
/// - parameter file:     文件名
/// - parameter method:   方法名
/// - parameter line:     代码行数
func JCDebugLog<T>(message: T,
              logError: Bool = false,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    if logError {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    } else {
        #if DEBUG
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
}

/// 自定义Log打印
///
/// - Description:
///     考虑到自定义Log要打印方法所在的文件/方法名/行号，以及自定义的内容，同时考虑调用的便捷性，所以要使用默认参数（fileName: String = #file），因此无需调用者传递太多的参数。
///     T 使用泛型，可以让调用者传递任意的类型，进行打印Log的操作。
/// - Parameters:
///   - message: 需要打印的内容
///   - fileName: 当前打印所在文件名 使用#file获取
///   - funcName: 当前打印所在方法名 使用#function获取
///   - lineNum: 当前打印所在行号   使用#line获取
//func MYLog<T> (message: T, fileName: String = #file, funcName: String = #function, lineNum: Int = #line) {
//
//    #if DEBUG
//
//        let file = (fileName as NSString).lastPathComponent
//
//        print("-\(file) \(funcName)-[\(lineNum)]: \(message)")
//
//    #endif
//
//}
