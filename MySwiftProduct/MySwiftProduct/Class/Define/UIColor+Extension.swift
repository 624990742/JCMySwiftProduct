//
//  UIColor+Extension.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/13.
//  Copyright © 2020 jiachen. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat){
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0);
    }
    //简化RGB颜色写法
    class func RGBA(_ r : UInt, g : UInt, b : UInt, a : CGFloat) -> UIColor {
        let redFloat = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        return UIColor(red: redFloat, green: green, blue: blue, alpha: a)
    }
    //随机色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)));
    }
    
    
    /// 样式 #5B5B5B
    ///
    /// - Parameters:
    ///   - color_vaule: 传入#5B5B5B格式的字符串
    ///   - alpha: 传入透明度
    /// - Returns: 颜色
    func UIColorFromRGB(color_vaule : String , alpha : CGFloat = 1) -> UIColor {
        
        if color_vaule.isEmpty {
            return UIColor.clear
        }
        
        var cString = color_vaule.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if cString.count == 0 {
            return UIColor.clear
        }
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count < 6 && cString.count != 6 {
            
            return UIColor.clear
        }
        
        let value = "0x\(cString)"
        
        let scanner = Scanner(string:value)
        
        var hexValue : UInt64 = 0
        //查找16进制是否存在
        if scanner.scanHexInt64(&hexValue) {
            print(hexValue)
            let redValue = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
              let greenValue = CGFloat((hexValue & 0xFF00) >> 8)/255.0
              let blueValue = CGFloat(hexValue & 0xFF)/255.0
              return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
        }else{
            return UIColor.clear
        }
    }
    
    
//    //16进制颜色
//    class func colorWithHexString(_ hex: String, alpha : CGFloat = 1.0) -> UIColor {
//        var hex = hex
//        if hex.hasPrefix("#") {
//            hex = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 1))
//        }
//
//        // Deal with 3 character Hex strings
//        if hex.characters.count == 3 {
//            let redHex   = hex.substring(to: hex.characters.index(hex.startIndex, offsetBy: 1))
//            let greenHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 1) ..< hex.characters.index(hex.startIndex, offsetBy: 2)))
//            let blueHex  = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 2))
//
//            hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
//        }
//
//        let redHex = hex.substring(to: hex.characters.index(hex.startIndex, offsetBy: 2))
//        let greenHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 2) ..< hex.characters.index(hex.startIndex, offsetBy: 4)))
//        let blueHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 4) ..< hex.characters.index(hex.startIndex, offsetBy: 6)))
//
//        var redInt:   CUnsignedInt = 0
//        var greenInt: CUnsignedInt = 0
//        var blueInt:  CUnsignedInt = 0
//
//        Scanner(string: redHex).scanHexInt32(&redInt)
//        Scanner(string: greenHex).scanHexInt32(&greenInt)
//        Scanner(string: blueHex).scanHexInt32(&blueInt)
//
//        return UIColor(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
//    }
}
