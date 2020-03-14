//
//  constFile.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import Foundation
import UIKit

let JC_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let JC_SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let JC_IPHONEX = JC_SCREEN_HEIGHT == 812 ? true : false
let JC_NavBarHeight = JC_IPHONEX ? 88.0 : 64.0 //导航栏的高度
let JC_TABBARHEIGHT = JC_IPHONEX ? 83.0 : 49.0 //导航栏的高度
let JC_RATIO = (JC_SCREEN_WIDTH / 375)//屏幕适配系数
let XD_SAVEAREA_TOP = JC_IPHONEX ? 24.0 : 0.0  // 顶部安全区域
let XD_SAVEAREA_BTM = JC_IPHONEX ? 34.0 : 0.0   // 底部安全区域
let XD_STATUSBAR_HEIGHT = JC_IPHONEX ? 44.0 : 20.0// 状态栏高度



