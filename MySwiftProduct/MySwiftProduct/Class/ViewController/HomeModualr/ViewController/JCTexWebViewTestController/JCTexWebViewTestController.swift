//
//  JCTexWebViewTestController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/6/2.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import WebKit
class JCTexWebViewTestController: UIViewController {
    
    
    @IBOutlet weak var web1: WKWebView!
    @IBOutlet weak var web2: WKWebView!
    @IBOutlet weak var web3: WKWebView!
    
    private enum Text {
        static let tableHTML = """
        <html>
        <head>
          这里是文档的头部
        </head>
        <scr>
        <body>
          这里是文档的主体
          <p><a id="runoob" href="https://www.runoob.com/">   <font size="10" color="red">菜鸟教程</font> </a></p>
          <p><a id="runoob" href="https://www.runoob.com/">菜鸟教程</a></p>
          <p><a id="runoob" href="https://www.runoob.com/">菜鸟教程</a></p>
          <p><button onclick="audio()"><font size="10" color="red">我是一个</font> <font size="2" color="black">按钮</font></button></p>
            <p onclick="alert('aaa')">
              <font size="10" color="red">我是一个点击时间</font>
              <font size="2" color="black">me</font>
            </p>
            <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F035%2F063%2F726%2F3ea4031f045945e1843ae5156749d64c.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625041177&t=66a726674a7e4d610281002d6a44204f"   width="170" height="110"/>
               <br> </br>
               <click  type="2" value="1622514526424" picture="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fd.lanrentuku.com%2Fdown%2Fpng%2F0904%2FM-v-Player%2FM-v-Player_13.png&refer=http%3A%2F%2Fd.lanrentuku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625106762&t=ad3b4e68e88ec5e4d73775dcecfd82f2"><font size="10" color="red">老鼠爱大米</font> </click>
        </body>
        </html>
        """

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.web1.loadHTMLString(Text.tableHTML, baseURL: nil)
        self.web2.loadHTMLString(Text.tableHTML, baseURL: nil)
        self.web3.loadHTMLString(Text.tableHTML, baseURL: nil)
        self.web1.reload()
        self.web2.reload()
        self.web3.reload()
        
    }
}
